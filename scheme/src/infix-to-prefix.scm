;; 中置記法から前置記法へ

;; 各演算子の結合の強さをweightで定義する
;; 数が大きければ大きいほど強く結合している
;;
;; 3 -> ** (べき乗)
;; 2 -> * / (乗算・除算)
;; 1 -> + - (加算・減算)
;;
(define (weight ope)
  (cdr (assoc ope '((+ . 1) (- . 1) (* . 2) (/ . 2)
                            (** . 3)))))

;; 中置記法から前置記法へ変換する手続き
(define (infix->prefix expr)
  (in-pre-aux expr '() '()))

;; (greater? op1 op2)
;; 演算子の強さを比較する
;; (greater? '* '+) -> #t
;; (greater? '- '**) -> #f
(define (greater? op1 op2)
  (> (weight op1) (weight op2)))

;; (constant? expr)
;; +や*のような演算子が与えられた場合は#fを返す
;; それ以外の定数(アトム)が与えられた場合は#tを返す
;; 例;
;; (constant? '*) -> #f
;; (constant?  2) -> #t
(define (constant? expr)
  (if (member expr '(+ - * / **)) #f
    (not (pair? expr))))

;; (infix->prefix '(a * b + c))
(define (in-pre-aux expr opr opd)
  (cond
    ((null? expr)
     (if (null? opr) (car opd)
       (in-pre-aux
         expr
         (cdr opr)
         (cons (list (car opr) (cadr opd) (car opd))
               (cddr opd)))))
    ((constant? expr)
     (in-pre-aux (cdr expr) opr (cons expr opd)))
    ((constant? (car expr))
     (in-pre-aux (cdr expr) opr (cons (car expr) opd)))
    (else
      (cond ((null? opr)
             (in-pre-aux (cdr expr)
                         (cons (car expr) opr)
                         opd))
            ((greater? (car expr) (car opr))
             (in-pre-aux (cdr expr)
                         (cons (car expr) opr)
                         opd))
            (else
              in-pre-aux
              (cdr expr)
              (cons (car expr) (cdr opr))
              (cons (list (car opr)
                          (cadr opd) (car opd))
                    (cddr opd)))))))
