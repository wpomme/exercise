;; 繰り返し処理
;; 例: aのn乗を求める手続き
(define (expt-do a n)
  (do ((e 1 e)
       (i 0 (+ i 1)))
    ((<= n i) e)
    (set! e (* e a))))

;; 次のようにも書ける
(define (expt-do a n)
  (do ((e 1 (* e a))
       (i 0 (+ i 1)))
    ((<= n i) e)))

(expt-do 2 10)
;; => 1024
(expt-do 3 5)
;; => 243

;; 定義
;; (do ((var1 init1 step1)
;;      ...
;;      (varn initn stepn))
;;   (exitp exp1 ... expm)
;;   body1
;;   ...
;;   bodyl)
;;
;; Step1: すべてのinitiが評価されたあとで、variにinitiが束縛される
;; Step2: exitpの評価が行われ、値が真ならば、exp1からexpmを順に評価して終了する。
;;        このとき、expmの値がdoの評価値となる。
;; Step3: body1から順にbodylを評価する
;; Step4: すべてのstepiが評価されたあとで、variに各stepiの評価値が束縛される。Step2へ戻る。
