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
;; (infix->prefix '(a * b + c))
;; => (+ (* a b) c)
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

;; expr, opr, opdはスタックである
;; expr: 初期値に中置表記の式を取る
;; opr: 演算子を一時的に保存するところ
;; opd: exprとoprから求められる前置表記
;; (cons (list (car opr) (cadr opd) (car opd))
;;      (cddr opd))

;; 注釈１
;; opr: (+)
;; opd: (c (* a b))
;; から
;; opr: ()
;; opd: (* (* a b) c)
;; に変換する
;; 
;; 例１
;; (cadr '(c (* a b)))
;; => (* a b)
;; (car '(c (* a b)))
;; => c
;; (cddr '(c (* a b)))
;; => ()
;;
;; 例２
;; (cons (list (car '(+)) (cadr '(c (* a b))) (car '(c (* a b))))
;;      (cddr '(c (* a b))))
;; => ((+ (* a b) c))
(define (in-pre-aux expr opr opd)
  (cond
    ;; 中置表記が空になった場合
    ((null? expr)
     ;; 演算子を保存するスタックも空なら最終的な式を返す
     (if (null? opr) (car opd)
       (in-pre-aux
         expr
         (cdr opr)
         ;; 注釈１
         (cons (list (car opr) (cadr opd) (car opd))
               (cddr opd)))))
    ;; exprのcar部が定数なら、その定数をopdに追加する
    ((constant? expr)
     (in-pre-aux (cdr expr) opr (cons expr opd)))
    ((constant? (car expr))
     (in-pre-aux (cdr expr) opr (cons (car expr) opd)))
    ;; exprのcar部が演算子の場合
    (else
      ;; 演算子のスタックoprが空ならexprの演算子をそのままoprに追加する
      (cond ((null? opr)
             (in-pre-aux (cdr expr)
                         (cons (car expr) opr)
                         opd))
            ;; oprが空でなければ、演算子の結合度により、
            ((greater? (car expr) (car opr))
             (in-pre-aux (cdr expr)
                         (cons (car expr) opr)
                         opd))
            (else
              (in-pre-aux
              (cdr expr)
              (cons (car expr) (cdr opr))
              ;; 注釈１と同じパターン
              (cons (list (car opr)
                          (cadr opd) (car opd))
                    (cddr opd))))))))
