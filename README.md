# Exercise
自分で実際に作ってみたスクリプトなどをここに置く

# Rubocop
- RubyのLinter
```bash
# 安全なものだけ修正
rubocop -a <filename>

# 全て修正
rubocop -A <filename>
```

# TODO
Ruby を4.0.2に更新したらMiniTest -> Minitestとなったので次の対応が必要
```bash
sed -i "" s/MiniTest::Test/Minitest::Test/g <filename>
```
