#!/usr/local/bin/lua

--[[
chunk: 程序段

run lua：
    lua
    lua -i
    lua -i test.lua
    lua -i
        dofile("test.lua")
    lua -e
--]]

--[[
function fact (n)
    if n == 0 then
        return 1
    else
        return n * fact(n - 1)
    end end

function add (a, b)
    return a + b
end
--]]

--[[
print("hello world")
--]]

--mark line
--[[
    mark line1
    mark line2
]]

--[[
--global var
print(no_such)
no_such = 1
print(no_such)
--]]


--[[
type
    nil,
    boolean,
    number,
    string,
    function,
    userdata,
    thread,
    table

print(type("Hello world"))      --> string
print(type(10.4*3))             --> number
print(type(print))              --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
print(type({}))  --> table
--]]

--[[
--nil, for delete
print(no_such)
print(type(no_such) == nil) -- false
print(type(no_such) == "nil") --true
--]]

--[[
--boolean
    --false false/nil
    --true others
--and, or, not
    A and B or C    ==> A ? B :C
if false or nil then
    print("至少有一个是 true")
else
    print("false 和 nil 都为 false")
end

if 0 then
    print("数字 0 是 true")
else
    print("数字 0 为 false")
end
--]]

--[[
--number
    -- integer 64 bits
    -- float 64 bits

    /
        always as float
    //
        floor operator
    %
    ~=
        different type means true
    integer -> float
        num + 0.0
    float -> integer
        num | 0
        math.tointeger(num)
math lib
    random/randomseed
    floor/ceil/modf

    math.maxinteger/math.mininteger
print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))

print(1 == 1.0) -- true
print(math.type(1.0))
print(type(math.type(1)))

print(1/2)
print(1.0/2)

print(1//2)
print(1.0//2)

print(math.type(1//2))
print(math.type(1.0//2))

print(math.pi % 0.1)
print(math.pi % 0.01)

print(math.pi - math.pi % 0.1)
print(math.pi - math.pi % 0.01)

print(1 ~= "hello") -- true

print(math.maxinteger)
print(math.mininteger)

print(math.type(1 + 0.0))
print(math.type(1.0 | 0))
print(math.type(math.tointeger(1.0)))
--]]


--[[
--string
    ''
    ""
    [[  ] ]
    [==[  ]==]

    const-value
    ..
    #str

    type-convert
        10 .. 20
        "10" + 1
        tonumber(val, base)
        tostring(val)
        10 < "2"
            compare operator, throw error
--string lib
    string.find ..
    str:find ..
string1 = "this is string1"
string2 = 'this is string2'
html = [[
<html>
<head></head>
<body>
    <a href="http://www.runoob.com/">菜鸟教程</a>
</body>
</html>
] ]
print(html)

print("2" + 6)
print("2" + "6")
--print("error" + 1) --error

print("a" .. "b")

print(#"hello")

str1 = "hello1"
str2 = "hello2"
print(#str1)
print(str1 .. str2)

content = [==[ hello ]==]
print(content)

print(10 .. 20)
print(tonumber("abbc", 2))
print(tostring(123))
-- print(1 < "2") --error

str = "hello world"
print(string.find(str, "hello"))
print(str:find("hello"))
print(string.format("%s", "hello"))
--]]

--[[
--table
    construct
        { }
        list-style
            {1, 2, 3}
        record-style
            {a = 1, b = 2,}
        general-style
            { ["+"] = 1, [1] = 2}
    index
        any-type
            may have different performance
        tbl[0.0] => tbl[0]
        tbl[0.1] => tbl[0.1]
        tbl["key"] ==> tbl.key
    array/list
        tbl = {1,2,3, nil, 4}
        tbl = {1,2,3, 4}

        #
            if have hole with val is nil, not accurate,
            should store the length by self
     sequence
        tbl = {1,2,3, 4}
        #
            for length, accurate

    travel table
        pairs
            may random
        ipairs
            only for sequence, accurate
        k = 1, #tbl
            only for sequence, accurate
    safe-access
        zip = company and company.director and
            company.director.address and
            company.director.address.zipCode       ==>

        zip = ((((company or {})).director or {}).address or {}).zipCode  -- good

        zip = (((company
                    or E).director
                        or E).address
                            or E).zipCode
    lib
        table.remove
        table.insert ..


--]]
--[[
a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
    print(k .. " : " .. v)
end

local tbl = {"apple", "pear", "orange", "grape"}
for key, val in pairs(tbl) do
    print("Key", key)
    print("Val", val)
end

tbl = { ["+"] = 1}
print(tbl["+"])

tbl = {1, 2, 3}
print(tbl[1])

tbl = {a = 1, b = 2}
print(tbl["a"])

tbl =  { ["+"] = 1, [1] = 2}
print(tbl["+"] .. tbl[1])

print("#" .. #{1,2,3}) -- 3
print("#" .. #{1,nil,3}) -- 3
print("#" .. #{1,nil,3, nil, nil}) -- 1

tbl = {}
tbl[1] = 1
tbl[100] = 100
print("#" .. #tbl)

tbl = {1, print, 12, "hi"}
print("------ipairs-------")
for k, v in ipairs(tbl) do
    print(k,v) --4 element
end

print("------pairs-------")
for k, v in pairs(tbl) do
    print(k,v) --4 element
end

print("------#-------")
for k = 1, #tbl do
    print(k, tbl[k])
end

tbl = {1, print, 12, nil, "hi"}
print("------hole, ipairs-------")
for k, v in ipairs(tbl) do
    print(k,v) -- 3 element
end

print("------hole, pairs-------")
for k, v in pairs(tbl) do
    print(k,v) -- 4 element
end

E = {}
zip = (((company
        or E).director
        or E).address
        or E).zipCode
print(zip)

company = {
    director = {
        address = {
            zipCode = "hello"
        }
    }
}

zip = (((company
        or E).director
        or E).address
        or E).zipCode
print(zip)

--]]

--[[

--function
    call
        funcName param
            -- only 1 param
                  string or table
        funcName(param)
        object:funcName(param)
    param
        抛弃多余的
        补齐不够的

        可变参数
            ... : 可变参数表达式，类似多个返回值的
            遍历：
                {...}
                    ipairs/pairs
                arg = table.pack(...)
                    arg.n --one by one
                num = select("#", ...)
                    num -- one by one

            table.unpack(list, start, end)
    multi-return
        multi-assign
            最右
        func-params
            最右
        table-constructor
            最右
        return
            最右
    force-one-return
        return (funcName(param1, param2, ..))

    tail-call elimination
        use no stack, just like

        return func(args)
function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end
print(factorial1(5))
factorial2 = factorial1
print(factorial2(5))

function foo0()

end

function foo1()
    return 1
end

function foo2()
    return 1, 2
end

-- multi-assign
print("multi-assign-------")
x, y = foo2()
print(x, y)

x, y = foo2(),3
print(x, y)

-- func-param
print("func-param")
print(foo2())
print(foo2(), 3)


--table-constructor
print("table-constructor")
tbl = {foo2()}
for k, v in pairs(tbl) do
    print(k, v)
end

print("---------------")
tbl = {foo2(), 3}
for k, v in pairs(tbl) do
    print(k, v)
end

---return
function foo(i)
    if i == 0 then
        return foo0()
    elseif i == 1 then
        return foo1()
    elseif i == 2 then
        return foo2()
    end
end

print("return")
print(foo(2))
function display1(...)
    for _, v in ipairs({...}) do
        print(v)
    end
end

print("display1")
display1(1,2,3) --1,2,3
display1(1,2, nil, 3) --1,2

function display2(...)
    for _, v in pairs({...}) do
        print(v)
    end
end

print("display2")
display2(1,2,3) --1,2,3
display2(1,2, nil, 3) --1,2, 3

function display3(...)
    local arg = table.pack(...)
    for i = 1, arg.n  do
        print(arg[i])
    end
end

print("display3")
display3(1,2,3) --1,2,3
display3(1,2, nil, 3) --1,2, nil, 3

function display4(...)
    print(select("#", ...))
    -- travel one by one
end

print("display4")
display4(1,2,3) --3
display4(1,2, nil, 3) --4


print("unpack")
print(table.unpack({1,2,3})) --3 elem
print(table.unpack({1,2,nil, 3})) --4 elem

function foo(n)
    if n > 0 then
        return foo(n-1)
    end
end

print("foo")
print(foo(1024*1024))

function foo1(n)
    if n > 0 then
        return foo1(n-1) + 1
    end

    return 0
end

print("foo1")
print(foo1(1024*1024))

--]]

--[[
thread
userdata
--]]

--[[
io
    simple-io
        io.input
        io.output
        io.read
        io.write
        io.lines
    full-io
        io.open
        f:read
        f:write
        f:close
others
    io.tmpfile
    flush
    setvbuf
    seek
    rename
    remove

    os.exit
    os.execute
    os.getenv

    io.popen
--]]


--[[
local var
    local varName = val
    优点：
        名字冲突
        访问速度快；
        gc速度快；

    local table = table
        访问速度快；
        动态替换
code block
    do
        ...
    end
--var
a = 5               -- 全局变量
local b = 5         -- 局部变量

function joke()
    c = 5           -- 全局变量
    local d = 6     -- 局部变量
end

joke()
print(c,d)          --> 5 nil

do
    local a = 6     -- 局部变量
    b = 6           -- 对局部变量重新赋值
    print(a,b);     --> 6 6
end

print(a,b)      --> 5 6

site = {}
site["key"] = "www.runoob.com"
print(site["key"])
print(site.key)

-]]

--[[
--loop
while(condition)
do
    statements
end

--number
for var=exp1,exp2,exp3 do
    <执行体>
end

--genetic
for with
    pairs
    ipairs
    io.lines()


repeat
   statements
until( condition )

return
break
goto
    can not jump
        local var
        other code-block
        out of function
--]]


--[[

goto END
-- local a = 1
-- do
    ::END::
-- end
print("hello end")


a=10
while( a < 20 )
do
    print("a 的值为:", a)
    a = a+1
end

for i=10,1,-1 do
    print(i)
end

--打印数组a的所有值
a = {"one", "two", "three"}
for i, v in ipairs(a) do
    print(i, v)
end

--[ 变量定义 --]
a = 10
--[ 执行循环 --]
repeat
    print("a的值为:", a)
    a = a + 1
until( a > 15 )

local a = 1
::label:: print("--- goto label ---")

a = a+1
if a < 3 then
    goto label   -- a 小于 3 的时候跳转到标签 label
end
--]]



--[[
if statements

if(布尔表达式)
then
   --[ 在布尔表达式为 true 时执行的语句 --]
end

if(布尔表达式)
then
   --[ 布尔表达式为 true 时执行该语句块 --]
else
   --[ 布尔表达式为 false 时执行该语句块 --]
end

if( 布尔表达式 1)
then
   --[ 在布尔表达式 1 为 true 时执行该语句块 --]

elseif( 布尔表达式 2)
then
   --[ 在布尔表达式 2 为 true 时执行该语句块 --]

elseif( 布尔表达式 3)
then
   --[ 在布尔表达式 3 为 true 时执行该语句块 --]
else
   --[ 如果以上布尔表达式都不为 true 则执行该语句块 --]
end

--]]

--[[
--[ 定义变量 --]
a = 100;
--[ 检查条件 --]
if( a < 20 )
then
    --[ if 条件为 true 时执行该语句块 --]
    print("a 小于 20" )
else
    --[ if 条件为 false 时执行该语句块 --]
    print("a 大于 20" )
end

print("a 的值为 :", a)


a = 100

--[ 检查布尔条件 --]
if a == 10
then
    --[ 如果条件为 true 打印以下信息 --]
    print("a 的值为 10" )
elseif( a == 20 )
then
    --[ if else if 条件为 true 时打印以下信息 --]
    print("a 的值为 20" )
elseif( a == 30 )
then
    --[ if else if condition 条件为 true 时打印以下信息 --]
    print("a 的值为 30" )
else
    --[ 以上条件语句没有一个为 true 时打印以下信息 --]
    print("没有匹配 a 的值" )
end
print("a 的真实值为: ", a )

--]]

--[[
function
    1. first-class value
        全部都是匿名的；
        可以做普通的变量;

        global function
            function foo() do .. end    ==>>
            foo = function do .. end
       local function
            lib = {}
               lib.foo = function() do ... end

               function lib.foo() do ... end

               lib = { foo = function() do ... end }


           local function funcName  ... end      ==>

           local funcName   --local
           function funcName ... end     --local
    2. lexical scope, 词法定界
            lambda exp；闭包
            非局部变量，up-value

            usage
                1. high-order-function
                2. function which creates function
                3. callBack function
                4. re-define function, include pre-defined function
                5. sandbox; secure environment


optional_function_scope function function_name( argument1, argument2, argument3..., argument)
    function_body
    return result_params_comma_separated
end

--]]

--[[
local fact  --local
function fact(n) --local
    n = n or 0
    if n <= 0 then
        return 1
    end

    return n*fact(n-1)
end

print(fact(10))


function newCounter()
    local count = 0
    return function ()
        count = count + 1
        return count
    end
end

cnt1 = newCounter()
print(cnt1())
print(cnt1())
print(cnt1())

cnt2 = newCounter()
print(cnt2())
print(cnt2())
--]]


--[[
reg-exp
   not like perl/posix

   string.find
--]]

--[[
begIdx, endIdx  = string.find("hello world", "hello")
print(begIdx, endIdx)

begIdx, endIdx  = string.find("hello world", "no-such")
print(begIdx, endIdx)


print(string.match("hello world", "hello"))
print(string.match("test 12/23/23", "%d+/%d+/%d+"))

print(string.gsub("aaa", 'a', 'b'))
print(string.gsub("aaa", 'a', 'b', 2))

--]]


--[[
    date and time

    time
        os.time()
    date
        自带时区转换
        tbl = os.date("*t", timestamp)
        strTime = os.date("%D", timestamp)
    time/date operation
        date.tbl
            自动归一化
        os.difftime
            on-wall time
        os.clock
            cpu time
--]]

--[[
print(os.time())

--time -> date
print("min:" .. os.time() % 3600 // 60)
print("sec:" .. os.time()%60)

-- date --> time
print(os.time({
    year = 1970,
    month = 1,
    day = 1,
    hour = 0
})) --28800

print(os.time({
    year = 1970,
    month = 1,
    day = 1,
    hour = 8
})) --0, 需要自己换算时区


tbl = os.date("*t", os.time()) -- 自带时区转换
for k, v in pairs(tbl) do
    print(k, v)
end

print(os.date("%Y-%m-%d-%H-%M-%S-%z", os.time())) -- 自带时区转换

print("day test")
t = os.date("*t")
print(os.date("%Y/%m/%d", os.time(t)))
t.day = t.day + 40
print(os.date("%Y/%m/%d", os.time(t))) --自动归一化

print("month test")
t = os.date("*t")
print(os.date("%Y/%m/%d", os.time(t)))
t.month = t.month + 1
print(os.date("%Y/%m/%d", os.time(t))) --自动归一化
t.month = t.month - 1
print(os.date("%Y/%m/%d", os.time(t))) --自动归一化


t1 = os.time()
os.execute("sleep " .. 1)
t2 = os.time()
print(os.difftime(t2, t1)) -- on-wall time
--]]

--[[
c1 = os.clock()
os.execute("sleep " .. 1)
c2 = os.clock()

local sum = 0;
for i = 1, 1000000000 do
    sum = sum + i
end

c3 = os.clock()
print(c2 - c1) -- cpu time
print(c3- c2) -- cpu time
--]]

--[[
bits and byte
    &
    |
    ~
        按位异或/取反
    >>
    <<
        lua只有逻辑移位，没有算术移位

unsigned int
    lua不显示支持无符号
    string.format("%u", val)
    string.format("%x", val)

    +, -, *
        same to signed int
    math-compare
        math.ult(val1, val2)

        mask = 0x8000000000000000
        (val1 ~ mask) < (val2 ~ mask)
    /
        需要特殊处理
    float -> unsigned
        需要特殊处理
    unsigned -> float
        需要特殊处理
--]]

--[[
print(string.format("%x",  255))
print(string.format("%x",  0xff << 12))
print(string.format("%x",  0xff >> -12))

--lua只有逻辑移位
print(string.format("%x",  0xffffffffffffffff))
print(string.format("%x",  0xffffffffffffffff >> 1))

print(string.format("%x",  0x03 << 62))
print(string.format("%d",  0x03 << 62))
print(string.format("%u",  0x03 << 62))

mask = 0x8000000000000000
print(math.ult(1, 0xffffffffffffffff)) --true
print((1 ~mask) < (0xffffffffffffffff ~mask)) --true
--]]

--[[
    string.pack
    string.unpack

    integer
        b, h, i, l, j
            +i
    string
        \0, 定长，显示长度
    float
        单精度浮点，双精度浮点，


    二进制 -> 文本

    文本 -> 二进制
--]]

--[[
buff = string.pack("ii", 1,2)
print(#buff)
print(string.unpack("ii", buff))
--]]

--[[
array
	idx must start from 1;
	for sequence opeartion
--]]
a = { }

for i = 1,5 do
    a[i] = i
end
print(#a)

for i = -5,5 do
    a[i] = i
end
print(#a)

--[[
matrix:
	不规则数组(二维)
	一层数组
稀疏矩阵:
	lua中不需要考虑，非nil元素才占用空间

	矩阵乘法
		调整遍历层次，优化
--]]

--[[
链表
	list = nil
	list = {
		next = list,
		val = v,
	}

	local l = list
	while l do
		visit l.value
		l = l.next
	end
双向列表
循环列表
	类似上面
栈
	无界数组即可
--]]

--[[
--
队列/双端队列
	function listNew(){
		return {
			first = 0,
			last = -1;
		}
	}

	pushFirst(list, value);
	pushLast(list, value);

	popFirst(list, value);
	popLast(list, value);
--]]

--[[
t1 = os.time()
content = ""
for i = 1, 100000 do
    content = content .. "hello world"
end
t2 = os.time()
print(t2 - t1)

t1 = os.time()
content = ""
tbl = {}
for i = 1, 200000 do
    tbl[i] =  "hello world"
end
content = table.concat(tbl)
t2 = os.time()
print( t2 - t1)
--]]

--[[
lua 数据文件/序列化
    描述数据
        安全性
        性能
数据文件
    将数据文件协程lua代码

    "goldbeef", "goldbeef@163.com"   -->

    Entry{"goldbeef", "goldbbeef@163.com"} -->

    Entry{name = "goldbeef", email = "goldbeef@163.com"}
序列化

--]]

--[[
function serialize1(o, prefix)
    prefix = prefix or ""
    local t = type(o)
    if t == "number" or t == "string" or t == "nil" or t == "boolean" then
        io.write(prefix .. string.format("%q", o))
    elseif t == "table" then
        io.write(prefix .. "{\n")
        for k, v in pairs(o) do
            --io.write(prefix .. "\t", k, " = ")
            io.write(prefix .. "\t[", k, "] = ")
            serialize1(v, prefix .. "\t")
            io.write(prefix .. ",\n")
        end
        io.write(prefix .. "}\n")
    else
        error("can not serialize a" .. type(o))
    end
end

print("-------------")
serialize1({a = 12, b = "lua", key = "another one", {l21 = 1, l22 =2}})

print("-------------")
serialize1({["+"] = "add", ["-"] = "del"})
--]]

--[[
function basicSerialize(o)
    --number, string, nil, boolean
    return string.format("%q\n", o)
end

function serialize2(name, o, prefix, saved)
    saved = saved or {}
    prefix = prefix or ""
    name = name or ""
    local t = type(o)
    io.write(prefix .. name, " = ")
    --basic
    if t == "number" or t == "string" or t == "nil" or t == "boolean" then
        io.write(prefix .. basicSerialize(o))
        return
    end

    --non-table
    if t ~= "table" then
        error("can not serialize a" .. type(o))
    end

    --table saved
    if saved[o] then
        io.write(prefix .. saved[o], "\n")
        return
    end

    --new table
    saved[o] = name
    io.write(prefix .. "{\n")
    for k, v in pairs(o) do
        --io.write(prefix .. "\t", k, " = ")
        --io.write(prefix .. "\t[", k, "] = ")
        serialize2(k, v, prefix .. "\t", saved)
        --io.write(prefix .. ",\n")
    end
    io.write(prefix .. "}\n")
end

print("-------------------")
serialize2("a", 1)

print("-------------------")
a = {x = 1, y = 2, {3,4,5}}
serialize2("a", a)

print("-------------------")
a[2] = a
serialize2("a", a)



t = {1,2, 3}
tbl1 = {a = 1, inner = t}
tbl2 = {b = 2, inner = t}
local shared = {}

serialize2("tbl1", tbl1, "", shared)
serialize2("tbl2", tbl2, "", shared)
--]]

--[[
编译/运行/错误
    dofile
        编译+执行

        易用
        开销大
    loadfile
        灵活
        开销小
    load
        assert(load(s))()
        开销大/诡异问题
--]]

i  = 32
local i = 10

function loadTest1()
    print(i)
end
print("----------")
print(loadTest1()) --local


print("----------")
loadTest2 = load("print(i)")
print(loadTest2()) --global

--[[
function max(num1, num2)
    if (num1 > num2) then
        return num1
    end
    return num2
end

print(max(1,2))

myprint = function(param)
    print("这是打印函数 -   ##",param,"##")
end

function add(num1,num2,functionPrint)
    result = num1 + num2
    -- 调用传递的函数参数
    functionPrint(result)
end
myprint(10)
-- myprint 函数作为参数传递
add(2,5,myprint)


function add(...)
    local s = 0
    for i, v in ipairs{...} do   --> {...} 表示一个由所有变长参数构成的数组
        s = s + v
    end
    return s
end
print(add(3,4,5,6,7))  --->25

function average(...)
    result = 0
    local arg={...}    --> arg 为一个表，局部变量
    for i,v in ipairs(arg) do
        result = result + v
    end
    print("总共传入 " .. #arg .. " 个数")
    select("#",...)
    return result/#arg
end

do
    function foo(...)
        for i = 1, select('#', ...) do  -->获取参数总数
            local arg = select(i, ...); -->读取参数
            print("arg", arg);
        end
    end

    foo(1, 2, 3, 4);
end

t = {1,2, 3}
print("t", t)
--]]


--[[
math operator
    +
    -
    *
    /
    %
    ^
    -
relation operator
    <
    <=
    ==
    >=
    >
    ~=
logical operator
    and
    or
    not
other
    ..
    #

--]]

--[[
string
    "content"
    'content'
    [[content]]
--]]
--[[
string1 = "Lua";
print(string.upper(string1))
print(string.lower(string1))
--]]

--[[
array = {"Lua", "Tutorial"}
for i= 0, 2 do
    print(array[i])
end

array = {}

for i= -2, 2 do
    array[i] = i *2
end

for i = -2,2 do
    print(array[i])
end

--]]

--[[
iterator
--]]

--[[
array = {"Google", "Runoob"}

for key,value in ipairs(array)
do
    print(key, value)
end

function square(iteratorMaxCount,currentNumber)
    if currentNumber<iteratorMaxCount
    then
        currentNumber = currentNumber+1
        return currentNumber, currentNumber*currentNumber
    end
end

for i,n in square,3,0
do
    print(i,n)
end
--]]

--[[
table
--]]

--[[
-- 简单的 table
mytable = {}
print("mytable 的类型是 ",type(mytable))

mytable[1]= "Lua"
mytable["wow"] = "修改前"
print("mytable 索引为 1 的元素是 ", mytable[1])
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

-- alternatetable和mytable的是指同一个 table
alternatetable = mytable

print("alternatetable 索引为 1 的元素是 ", alternatetable[1])
print("mytable 索引为 wow 的元素是 ", alternatetable["wow"])

alternatetable["wow"] = "修改后"

print("mytable 索引为 wow 的元素是 ", mytable["wow"])

-- 释放变量
alternatetable = nil
print("alternatetable 是 ", alternatetable)

-- mytable 仍然可以访问
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

mytable = nil
print("mytable 是 ", mytable)

table.sort()
table.insert()

--]]


--[[
module
    LUA_PATH
    LUA_CPATH
--]]

--[[
local m = require("module")
print(m.constant)
m.func3()
--]]

--[[
coroutine
--]]

--[[
co = coroutine.create(
        function(i)
            print(i);
        end
)

coroutine.resume(co, 1)   -- 1
print(coroutine.status(co))  -- dead

print("----------")

co = coroutine.wrap(
        function(i)
            print(i);
        end
)

co(1)

print("----------")

co2 = coroutine.create(
        function()
            for i=1,10 do
                print(i)
                if i == 3 then
                    print(coroutine.status(co2))  --running
                    print(coroutine.running()) --thread:XXXXXX
                end
                coroutine.yield()
            end
        end
)

coroutine.resume(co2) --1
coroutine.resume(co2) --2
coroutine.resume(co2) --3

print(coroutine.status(co2))   -- suspended
print(coroutine.running())

print("----------")
--]]


--[[
error process
   assert
   error
   pcall
   xpcall
--]]

--[[
if a == nil then
    print("hello")
end

-- print(hello(1,1))
function hello(a,b)
    return a+b
end

print(hello(1,2))

-- assert(1 == 2)

function add2(a,b)
    assert(type(a) == "number", "a 不是一个数字")
    assert(type(b) == "number", "b 不是一个数字")
    return a+b
end

-- add2(10)

-- error("err1")
-- error("err2")

-- pcall(function(i) print(i) end, 33)
-- pcall(function(i) print(i) error('error..') end, 33)

xpcall(function(i) print(i) error('error..') end, function() print(debug.traceback()) end, 33)
--]]

--[[
debug
--]]


--[[
lua gc
--]]

--[[
mytable = {"apple", "orange", "banana"}
print(collectgarbage("count"))
mytable = nil
print(collectgarbage("count"))
print(collectgarbage("collect"))
print(collectgarbage("count"))
--]]

--[[
metatable
--]]

--[[
other = { foo = 3 }
t = setmetatable({}, { __index = other })
print(t.foo)
--]]

--[[
mytable = setmetatable({key1 = "value1"}, {
    __index = function(mytable, key)
        if key == "key2" then
            return "metatablevalue"
        else
            return nil
        end
    end
})
print(mytable.hello)
print(mytable.key2)
print(mytable["key2"])
--]]


--[[
__newindex
--]]

--[[
mymetatable = {}
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })

print(mytable.key1)

mytable.newkey = "新值2"
print(mytable.newkey,mymetatable.newkey)

mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1)
--]]

--[[
__tostring
--]]

--[[
mytable = setmetatable({ 10, 20, 30 }, {
    __tostring = function(mytable)
        local sum = 0
        for k, v in pairs(mytable) do
            sum = sum + v
        end
        return "total sum: " .. sum
    end
})

print(mytable)
--]]


--[[
OOA
--]]

--[[
------------------- 封装
-- 元类
Shape = {area = 0}

-- 基础类方法 new
function Shape:new (o,side)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    side = side or 0
    self.area = side*side;
    return o
end

-- 基础类方法 printArea
function Shape:printArea ()
    print("面积为 ",self.area)
end

-- 创建对象
myshape = Shape:new(nil,10)

myshape:printArea()





------------------- 继承
Square = Shape:new()
-- Derived class method new
function Square:new (o,side)
    o = o or Shape:new(o,side)
    setmetatable(o, self)
    self.__index = self
    return o
end

------------------- 函数重写
--]]


print("hello")
-- testmain
--[[
--]]

