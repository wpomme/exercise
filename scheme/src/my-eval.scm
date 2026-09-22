;; (myeval exp env)を作成する

;; error-message: エラーメッセージを表示する
(define (error-message x)
  (display "  **** Unknown expression :  ")
  (display x) (newline))

;; assoc*: envから値を取り出すときに使う関数
;;
;; envが次の通りだとする
;; ((true . t) (false . nil) (foo 1 2 3))
;; これは、アトムtrue, false, fooの値がそれぞれt, nil, (1 2 3)であるということを表す
;;
;; ここからfooを指定した場合、(1 2 3)を取り出せるようにassoc+を定義する
;; 例1:
;; (assoc* 'foo '((true . t) (false . nil) (foo 1 2 3)))
;; => (1 2 3)
;;
;; 例2:
;; (assoc* 'a '((a 1 2 3) (b . 2)))
;; => (1 2 3)
;;
;; 例3:
;; (assoc* 'c '((a 1 2 3) (b . 2)))
;; => Display Error Message
(define (assoc* x y)
  (cond ((null? y)
         (error-message x) '())
        ((equal? x (caar y)) (cdar y))
        (else (assoc* x (cdr y)))))

;; atom?: xがアトムかどうかを判断する述語
(define (atom? x) (not (pair? x)))
