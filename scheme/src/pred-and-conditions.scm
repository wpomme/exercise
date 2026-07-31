;; pred? -> 述語: 真偽値を返す手続き

;; if式の形式
;; (if pred then else)
;; 例
(if (even? 10) (> 100 10) (< -10 4))

;; cond式の形式
;; (cond (pred1 exp1)
;;       (pred2 exp2)
;;        ...        )
