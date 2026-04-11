# Frog 問題
# 7個の足場があって、その高さはheight[i]で与えられる。
# カエルが0番目の足場から、次のいずれかの行動をとって、6番目の足場を目指す。
# 1. 足場iから足場i+1へと移動する
# 2. 足場iから足場i+2へと移動する
# この場合、カエルが6番目に辿り着くまでに一番早く辿り着く方法を求める
#
# なお、dp(2)は2となる
def dp(n)
  return 0 if n == 0 # dp(0)
  return 7 if n == 1 # dp(1)

  height = [2, 9, 4, 5, 1, 6, 10]

  cost1 = (height[n] - height[n - 1]).abs
  cost2 = (height[n] - height[n - 2]).abs

  [dp(n-1) + cost1, dp(n-2) + cost2].min
end

p dp(2) # dp(6) は8となる
