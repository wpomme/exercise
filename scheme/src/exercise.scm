;; ## S式
;; 1. アトムと()はS式である
;; 2. s1とs2がS式ならば、(s1 . s2)はS式である
;;
;; ## carとcdr
;; (s1 . s2)にて、s1をcar部、s2をcdr部と呼ぶ
;;
;; ## cons
;; リストに要素を追加したいときに使う
;; (cons 1 '(2 3)) => (1 2 3)
;;
;; ## ドット表記とリスト表記
;; - 次の通り
;; (a . (b)) == (a b)
;; (a . (b . (c))) == (a b c)
;;
;; - 本来の定義は
;; (a . (b . (c . d))) == (a b c . d)
;; でd == () or nilならば
;; (a . (b . (c))) == (a b c)
;; となる
;;
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

