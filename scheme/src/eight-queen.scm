;; node-expand: 接点を展開する手続き
;;
;; 例1:
;; (node-expand 4 '(4))
;; => ((4 4) (3 4) (2 4) (1 4))
;;
;; 例2:
;; (node-expand 3 '(3 2 1))
;; => ((3 3 2 1) (2 3 2 1) (1 3 2 1))
;;
;; 引数について
;; n: 盤のサイズ
;; lst: そのときのクイーンの配置を表すリスト
(define (node-expand n lst)
  (if (zero? n) '()
    (cons (cons n lst) (node-expand (- n 1) lst))))

;; safe?: qiが(qi+1 ... q8)のどの要素とも取り合わないことを判定する述語
;;
;; 手続きについて:
;; q1をnew、(q2...q8)をhlstとする
;; safe-aux?でnew(q1)の効き筋up, new, downがq2の位置と同じでないことを確認する
;; 次にupとdownにそれぞれ1を足し引きして、hlstから次の位置q3についてsafe?かどうかを確認する
;; これをq8まで繰り返す
;;
;; 例:
;; (safe? '(1 4 2))
;; => #t
;; (safe? '(3 4 2))
;; => #f
(define (safe? lst)
  (let ((new (car lst))
        (hlst (cdr lst)))
    (if (null? hlst) #t
      (safe-aux? new (+ new 1) (- new 1) hlst))))

(define (safe-aux? new up down hlst)
  (if (null? hlst) #t
    (let ((pos (car hlst)))
      (and (not (= pos new))
           (not (= pos up))
           (not (= pos down))
           (safe-aux? new (+ up 1) (- down 1)
                      (cdr hlst))))))

;; goal?: 生成された解候補xが解であるかどうかを判定する述語
;; => 実際は解xのリストの長さが盤のサイズと同じであれば、#tを返す述語である
;;
;; 例:
;; (goal? '(1 2 3) 3)
;; => #t
(define (goal? x n) (= (length x) n))

;; depth-first-search: ８クイーン問題を解く関数
;; (depth-first-search 8)
;; とすれば、８クイーン問題の解が得られる
;; また、
;; (depth-first-search 4)
;; などとすれば、４クイーン問題の解が得られる
;; なお、４クイーン問題の解は２通りとなる
;;
;; (length (depth-first-search 8))
;; => 92
;; したがって、問題の解は92通りとなる
(define (depth-first-search n)
  (letrec
    ((lst (node-expand n '()))
     (solution '())
     (x '())
     (pop (lambda () (let ((y (car lst)))
                       (set! lst (cdr lst)) y)))
     (push (lambda (y) (set! lst (append y lst))))
     (search
       (lambda ()
         (if (null? lst)
           solution
           (begin
             (set! x (pop))
             (display "lst= ")(display lst)
             (display " x= ")(display x)(newline)
             (if (safe? x)
               (if (goal? x n)
                 (set! solution (cons x solution))
                 (push (node-expand n x))))
             (search))))))
    (search)))

