# Ruby test codes

## 1. leetcode: Intruction to Ruby
http://leetcode.com/explore/learn/card/become-a-web-developer/

## 2. Seven Languages in Seven Weeks

## 3. runoob lessons
http://www.runoob.com/ruby/

## 4. Learn Ruby the Hard Way, 3rd Edition

## 5. Programming Ruby, The Ruby Programming Language, Meta-programming Ruby, etc.

## 6. Reference

### Offerical Documentation
http://www.ruby-lang.org/en/documentation/

### Programming Ruby
http://ruby-doc.com/docs/ProgrammingRuby/

### Official API Documentation
http://docs.ruby-lang.org/en/

### Ruby From Other Languages
http://www.ruby-lang.org/en/documentation/ruby-from-other-languages/

### Third-party Libraries
http://www.ruby-lang.org/en/libraries/


# Ruby 编码规范：在理想的世界里，遵循这些准则
http://github.com/bbatsov/ruby-style-guide/   
http://github.com/bbatsov/rails-style-guide/   
http://stylesror.github.io/   
http://sideeffect.kr/popularconvention#ruby   

## 源代码布局

* 所有源文件以UTF-8编码
* 使用2个空格的缩进
* 使用Unix风格的换行符(\n)
* 每行不超过80字符
* 每行的结尾不要有空白字符

## 语法规范

* 方法如果没参数就省略括号，有参数就使用括号
* 不要使用for，而使用each来代替
* 不要在多行的if/unless使用then
* 使用三元操作符"?:"代替if/else
* 三元操作符不要嵌套，嵌套情况使用if/else
* 布尔表达式使用&&/||，控制流程使用and/or
* 不要使用unless搭配else，将它们改为肯定条件
* 除非是判断条件涉及赋值操作，否则不需要括起来
* 避免在不需要的场合时使用return
* 避免在不需要的场合使用续行\，尽量避免使用续行
* 随意使用||=来初始化变量，但不要用来初始化布尔变量
* 运行Ruby的时候，加上"-w"以提示告警

## 命名规范

* 使用首字母大写命名Module和Class(CamelCase)
* 使用全大写 + "_"命名常量
* 使用小写 + "_"命名变量和方法(snake_case)
* 判断式方法(返回boolean)方法名后加"?"
* 有潜在“危险性”的方法名后加"!"，如改动self或参数、exit等
* 偏好map胜于collect，find胜于detect，select胜于find_all，reduce胜于inject，size胜于length

## 其他

* 为每个类写一个to_s方法以查看类状态
* 使用attr家族的方法定义琐碎的accessor或mutators
* 使用DuckTyping而非继承，因为动态语言的特性，不再需要多态了
* 避免使用类变量@@，避免使用全局变量$
* 使用self.method来定义singleton方法，而不是使用类名
* 不要使用异常做流程控制
* 优先使用%w创建字符串数组
* 使用Symbol代替String做Hashkey，不要使用可变对象做HashKey
* 在遍历一个集合时，不要改动它
* 当你不需要插入特殊符号如\t, \n, ', 等等时，偏好单引号的字串
* 当你需要构建庞大的chunk时，使用<<而不是+做字符串串联
* 避免不需要的元编程

