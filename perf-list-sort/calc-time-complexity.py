import numpy as np

n = np.array([1000, 10000, 100000])
T = np.array([0.000064, 0.000844, 0.009921])

# 対数変換後の線形回帰（最小二乗法）を実行する
log_n = np.log10(n)
log_T = np.log10(T)
k, b = np.polyfit(log_n, log_T, 1)
print(f"k = {k:.4f}")  # k ≈ 1.09
