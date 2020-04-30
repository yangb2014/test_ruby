#!/usr/bin/ruby -w

# 代码块
3.times {puts "hiya there, kiddo"}

# 自定义的 times 方法: 打开现有的 Fixnum 类，向其中添加一个方法，用 yield 调用代码块
# 由于在 ruby 2.5/centos 8 上出现告警，改为 Integer
class Integer
    def my_times
        i = self
        while i > 0
            i = i - 1
            puts "yield: "
            yield
        end
    end
end
3.my_times {puts "mangy moose"}

# 分发可执行代码: first-class parameter
def call_back(&block)
    block.call
end
def pass_block(&block)
    call_back(&block)
end
pass_block {puts "Hello, block."}
