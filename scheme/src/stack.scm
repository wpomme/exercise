;; スタックポインター*stack*を定義する
(define *stack* '())

;; (push data)
;; dataを*stack*にデータを入れる
;; 更新した*stack*が評価値になる
(define (push data)
  (if (null? *stack*) (set! *stack* (list data))
    (set! *stack* (cons data *stack*)))
  *stack*)

;; (pop)
(define (pop)
  (cond ((null? *stack*) 'empty)
        (else ((lambda (x) (set! x (car *stack*))
                 (set! *stack* (cdr *stack*))
                 x) '()))))

;; データを入れる
;; mapとpushの結果が両方返ってくる？
(map push '("a" '(a b) '(a b c)))
;; 入っているデータの数は正しい
;; will return 3
(length *stack*)
