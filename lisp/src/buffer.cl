;; 代入
;; setかsetqを使う
(set 'x 10)
(setq y 10)

;; 値を返す
;; symbol-valueかアトムの形式で変数を書く
(symbol-value 'x)
x

;; リスト
;; listかquoteを使う
(setq lst1
  (list 1 2 3))

(setq lst2
  '(1 2 3))

;; 空リストとnil
;; 空リストはnilと同じ値となる
(list)
;; => nil
'()
;; => nil

;; car, cdr, consのnil
;; 次の式はいずれもnilとなる
(car nil)
(cdr nil)
;; => nil

;; これはnilを唯一の要素としたリストを返す
(cons nil nil)
;; => (nil)
