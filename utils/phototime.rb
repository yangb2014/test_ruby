#!/usr/bin/ruby -w

require 'exifr/jpeg'
require 'yaml'
require 'find'
require 'fileutils'

# @param {String} photo filename
# @return {Hash}
@base_exif_infos = %w[exif gps width height model date_time exposure_time f_number gps_latitude gps_longitude raw]
def get_exif(filename)
    image = EXIFR::JPEG.new(filename)
    return { exif: false } unless image.exif?
    # use image.exif.date_time_original instead of image.date_time
    h = { exif: true, gps: false, width: image.width, height: image.height,
          model: image.model, date_time: image.exif.date_time_original,
          exposure_time: image.exposure_time.to_s, f_number: image.f_number.to_s,
          raw: image.exif.inspect }
    if image.gps
        h[:gps] = true
        h[:gps_latitude], h[:gps_longitude] = image.gps.latitude, image.gps.longitude
    end
    h
end

# @param {String} yaml filename
# @return {Hash}
@base_config_infos = %w[source_dir target_dir delete_source photo_type camera_model date_time_patten]
def get_app_config(filename)
    app_config = YAML.load(File.open(filename))
    app_config
end

# application configures
app_config = get_app_config('./config.yml')

# source file list
source_dir = app_config.fetch('source_dir', './source')
file_list = []
Find.find(source_dir) do |filename|
    next if FileTest.directory?(filename)
    file_list << filename
    # puts File.dirname(filename) + '/' + File.basename(filename) + ': ' + File::size?(filename).to_s
end

# target dir
target_dir = app_config.fetch('target_dir', './target')
Dir.mkdir(target_dir, 0o0755) unless Dir.exist?(target_dir)

# log filename
log_filename = app_config.fetch('log_filename', "#{target_dir}/process.log")
@log_file = File.new(log_filename, 'a+')
def log(content)
    puts content
    @log_file&.syswrite("#{Time.now}, #{content} \n")
end

# main process
delete_source = app_config.fetch('delete_source', false)
count = 0
log "start process, source: #{source_dir}, target: #{target_dir}, delete_source: #{delete_source}"
file_list.each do |filename|
    count += 1
    log filename

    # exif: only process .jpg file
    sub_dir = ''
    if filename =~ /^.*\.[jJ][pP][gG]$/
        # exifr
        exif = get_exif(filename)
        if exif[:exif] and exif.include?(:date_time) and !exif[:date_time].nil?
            # photo datetime: if photo have no date_time, move to root directory
            sub_dir = exif[:date_time].to_s
        end
    end

    # mov/mp4: sub-dir 'video'
    sub_dir = 'video' if filename =~ /^.*\.[mM][pP][34]$/ or filename =~ /^.*\.[mM][oO][vV]$/

    # no exif: get file modify time
    sub_dir = File.mtime(filename).to_s if sub_dir.empty?

    # dest directory
    sub_dir.gsub!(':', '-')
    new_directory = "#{target_dir}/#{sub_dir[0..6]}/"
    Dir.mkdir(new_directory, 0o0755) unless Dir.exist?(new_directory)

    # copy/move file
    if delete_source
        log "move #{filename} --> #{new_directory}"
        FileUtils.mv(filename, new_directory)
    else
        log "copy #{filename} --> #{new_directory}"
        FileUtils.cp(filename, new_directory)
    end
end

log "process succeed, total #{count} files."
@log_file.close
