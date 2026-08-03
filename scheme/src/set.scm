;; 集合演算

;; 集合Aが空集合であるかどうかを判定する述語empty?
(define empty? null?)

(empty? '())
;; => #t
(empty? 'a)
;; => #f

;; xが集合Aに属するかどうかを判定する述語element?
(define (element? x a)
  (cond ((empty? a) #f)
        ((equal? x (car a)) #t)
        (else (element? x (cdr a)))))

(element? 1 '(2 3 4))
;; => #f
(element? 3 '(1 2 4 5))
;; => #f
(element? 3 '(1 2 3 4 5))
;; => #t

;; 集合Aが集合Bの部分集合かどうかを判定する述語subset?
(define (subset? a b)
  (cond ((empty? a) #t)
        ((element? (car a) b) (subset? (cdr a) b))
        (else #f)))

(subset? '(1 2) '(1 2 3))
;; => #t

;; 集合Aの基数を求める手続き
;; 例
;; (cardinal '(a b c)) => 3
;; (cardinal '(a (b c) d)) => 3
(define (cardinal x)
  (cond ((empty? x) 0)
        (else (+ 1 (cardinal (cdr x))))))

;; 集合AとBの合併集合を求める手続き
;; 例
;; (union '(1 2 3 4) '(2 3 4 5 6)) => (1 2 3 4 5 6)
;; (union '(1 2 3) '(1 2 3)) => (1 2 3)
(define (union a b)
  (cond ((empty? a) b)
        ((element? (car a) b) (union (cdr a) b))
        (else (union (cdr a) (cons (car a) b)))))

;; 集合AとBの共通集合を求める手続き
;; 例
;; (intersection '(1 2 3) '(1 2 3)) => (1 2 3)
;; (intersection '(1 2 3) '(4 5 6)) => ()
;; (intersection '(1 2 3 4 5) '(3 4 5 6)) => (3 4 5)
(define (intersection a b)
  (cond ((empty? a) '())
        ((element? (car a) b)
         (cons (car a) (intersection (cdr a) b)))
        (else (intersection (cdr a) b))))

;; 集合AとBの差集合を求める手続き
;; 例
;; (difference '(2 3 1) '(1 2 3))
;; => ()
;; (difference '(1 2 3 4 5) '(3 2 1))
;; => (4 5)
;; (difference '(12 1 2 3 4 5) '(3 2 1 7 8 9 10))
;; => (5 4 12)
;; ((element? a) b) => #t なら()
;; ((element? a) b) => #f なら(union (car a) b)
(define (difference a b)
  (difference-aux a b '()))

;; 最終的に値を返すための引数cを使う
(define (difference-aux a b c)
  (cond ((empty? a) c)
        ((element? (car a) b) (difference-aux (cdr a) b c))
        (else (difference-aux (cdr a) b (cons (car a) c)))))
