;; Schemeによる記号処理入門: p.44
(cadr '(a b c d e))
;; -> return b
(caddr '((a b) (c d) e))
;; -> return e

;; Schemeによる記号処理入門 p.32
'(* 10 (+ 2 1))
(+ (* 2 1) (* 3 2))
((lambda (x y) (if (> x y) x y)) 40 19)
((lambda (f x) (f x)) odd? 33)
(cond ((odd? 3) 'odd) ((even? 3) 'even))

;; リストに引数で渡した要素があればそれを返して、なければ#fを返す関数
(define (my-find? elem lst)
  (cond ((null? lst) #f)
        ((equal? elem (car lst)) #t)
        (else (my-find elem (cdr lst)))))

(my-find? 3 '(1 2 3 4 5))
(my-find? "c" '("a" "b" "c" "d" "e"))

;; Schemeによる...p.77
;; (sum-do 1) => 1
;; (sum-do 2) => 3
;; (sum-do 3) => 6
;; ...
;; (sum-do 10) => 55
(define (sum-do n)
  (do ((e 0 (+ e j))
       (i 0 (+ i 1))
       (j 1 (+ j 1)))
    ((<= n i) e)))
