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
    multi-return
        multi-assign
            最右
        func-params
            最右
        table-constructor
            最右
        return
            最右

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
--]]


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

--[[
thread
userdata

--]]

--[[
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

for var=exp1,exp2,exp3 do
    <执行体>
end

repeat
   statements
until( condition )

--]]

--[[
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

optional_function_scope function function_name( argument1, argument2, argument3..., argumentn)
    function_body
    return result_params_comma_separated
end

--]]

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


-- testmain
--[[
--]]

