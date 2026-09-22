;; eq?とequal?
;; (eq? x y)はxとyが同じ記憶場所に格納されていれば#t
;; (equal? x y)はxとyが同じ印字結果なら#t
;; 例
(equal? '(1 2 3) '(1 2 3))
;; => $t
(eq? '(1 2 3) '(1 2 3))
;; => $f

;; 連想リストの操作
;; assoc
;; 等価性の判定をequal?によって行うのがassoc
(assoc '(a) '((a . 1) ((a) . 2) (b . 3)))
;; => ((a) . 2)

;; assq
;; 等価性の判定をeqによって行うのがassq
(assq 'a '((a . 1) ((a) . 2) (b . 3)))
;; => (a . 1)

;; member
;; findのような組み込み手続き
(member 3 '(4 1 3 5 6 7))
;; => (3 5 6 7)
(member 3 '(4 1 10 5 6 7))
;; => #f
;; append
(append '(foo bar) '(baz qux))
;; => (foo bar baz qux)
;; consと比較する
(cons 'foo '(bar baz))
;; => (foo bar baz)

;; 破壊的なリスト操作: set-car!, set-cdr!
(define x '(1 2))
(set-car! x 'foo)
;; goshだとERROR: attempt to mutate car of an immutable pair (1 2) with fooとなり、エラーとなる

