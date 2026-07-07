;; ## S式
;; 1. アトムと()はS式である
;; 2. s1とs2がS式ならば、(s1 . s2)はS式である
;;
;; ## carとcdr
;; (s1 . s2)にて、s1をcar部、s2をcdr部と呼ぶ
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

