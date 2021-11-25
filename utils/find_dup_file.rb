#!/usr/bin/ruby -w

require 'find'
# require 'fileutils'
require 'digest/md5'
require 'digest/sha1'

# @param {Array[String]} filename list
# @return {Hash}
def find_dup_filename(list)
    list.each_with_object({}) do |filename, hash|
        basename = File.basename(filename)
        hash[basename] = [] unless hash[basename]
        hash[basename] << filename
    end.select { |_, v| v.size > 1 }
end

# @param {Array[String]} filename list
# @return {Hash}
def find_dup_algorithm(list)
    list.each_with_object({}) do |filename, hash|
        digest = Digest::MD5.hexdigest(File.open(filename, "rb") {|fs| fs.read})
        # digest = Digest::SHA1.hexdigest(File.open(filename, "rb") {|fs| fs.read})
        hash[digest] = [] unless hash[digest]
        hash[digest] << filename
    end.select { |_, v| v.size > 1 }
end

# @param {Array[String]} filename list
# @return {Hash}
def stat_file_size(list)
    list.each_with_object(Hash.new(0)) do |filename, hash|
        hash[File.extname(filename).downcase] += File::size?(filename)
    end
end

# source file list
source_dir = './source'
file_list = []
Find.find(source_dir) do |filename|
    next if FileTest.directory?(filename)
    file_list << filename
end

puts "Analysis directory #{source_dir}. #{Time.now}"

puts '---- file stats by type ----'
dup = stat_file_size(file_list)
dup.each { |k, v| puts "#{k} => #{v / (1024 * 1024)}" }

puts '---- dupulate file name ----'
dup = find_dup_filename(file_list)
dup.each { |k, v| puts "#{k} => #{v.inspect}" }

puts '---- dupulate file algorithm ----'
dup = find_dup_algorithm(file_list)
dup.each { |k, v| puts "#{k} => #{v.inspect}" }

puts "~~ the end^_^ ~~ #{Time.now}"
