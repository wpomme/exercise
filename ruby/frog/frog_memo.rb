# Frog 問題
# dp(6) は8となる

def dp(n)
  return 0 if n.zero? # dp(0)
  return 7 if n == 1 # dp(1)

  lst = [0, 7]
  height = [2, 9, 4, 5, 1, 6, 10]

  (2..n).each do |n|
    cost1 = (height[n] - height[n - 1]).abs
    cost2 = (height[n] - height[n - 2]).abs
    lst.push [lst[n - 1] + cost1, lst[n - 2] + cost2].min
  end
  ## debug
  pp lst
  lst[n]
end

p dp(6)
