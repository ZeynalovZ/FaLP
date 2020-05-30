;; Создание двухэлементных списков
(defun create_list_pair (countries capitals)
    (mapcar #'(lambda (x y)(cons x (cons y NIL))) countries capitals))


(defun create_cons_pair (countries capitals)
    (mapcar #'cons countries capitals)
)

(defun search_in_cons (name lst)
    (or (car(rassoc name lst))
        (cdr(assoc name lst))
    )
)

(defun search_in_list (name lst)
    (or (car(rassoc (cons name nil) lst :test 'equal))
        (cadr(assoc name lst :test 'equal))
    )
)
;; (defun f () 
    ;; (mapcar #'cons '(Russia China Germany France) '(Moscow Pekin Berlin Paris)))
    
(defun how_alike (x y)
    (if (or (= x y)(equal x y)) 'the_same
        (if (and (oddp x) (oddp y)) 'both_odd
            (if (and (evenp x) (evenp y)) 'both_even 'difference)
    )
))

;; (defun search_reduce(name lst)
;;     (reduce (lambda (a x) (if (or())))
;; )