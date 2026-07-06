;; 待ち行列*queue*を定義する
;; さらに待ち行列の最後の要素*last*も定義する
(define *queue* '())
(define *last* '())

;; (enqueue data)
;; dataを*queue*にデータを入れる
;; 更新した*stack*が評価値になる
(define (enqueue data)
  (cond ((null? *queue*)
         (set! *queue* (list data)) (set! *last* *queue*))
        (else (set-cdr! *last* (list data))
              (set! *last* (cdr *last*))))
  *queue*)

;; (dequeue)
;; dataを取り出す
(define (dequeue)
  (cond ((null? *queue*) 'empty)
        (else ((lambda (x) (set! x (car *queue*))
                 (set! *queue* (cdr *queue*))
                 x) '()))))

;; データを入れる
;; mapとpushの結果が両方返ってくる？
(map enqueue '("a" '(a b) '(a b c)))
;; 入っているデータの数は正しい
;; will return 3
(length *queue*)
;; 最後の要素は'(a b c)
(list *last*)

;; "a"からdataが返ってくる
(dequeue)
