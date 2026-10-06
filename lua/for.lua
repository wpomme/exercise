-- 関数の定義の仕方の一つ
local function twice(x)
  return x + x
end

-- データ構造はtableのみである
-- ここでは配列を定義している
local array = { 1, 2, 3, 4, 5 }

-- 三種類のfor文がある
print("next:")
for value in next, array do
  print(twice(value))
end

print("")
print("pairs: index and value")
for index, value in pairs(array) do
  print(index, twice(value))
end

print("")
print("pairs: key and value")
local dict = {foo = 1, bar = 2, baz = "foo"}

for k, v in pairs(dict) do
  print ("key: " .. k)
  print ("value: " .. v)
  print("")
end

print("")
print("ipairs:")
for index, value in ipairs(array) do
  print(index, twice(value))
end
