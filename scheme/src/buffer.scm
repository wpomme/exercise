(define (my-find elem lst)
  (cond ((null? lst) #f)
        ((equal? elem (car lst)) elem)
        (else (my-find elem (cdr lst)))))

(my-find 3 '(1 2 3 4 5))
(my-find "c" '("a" "b" "c" "d" "e"))

(cdr (car '(a b c d e)))
(car '(a b c d e))
(cdr '(a b c d e))
