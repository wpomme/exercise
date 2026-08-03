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
