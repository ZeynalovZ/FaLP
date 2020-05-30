;9 ЛР
; 1 задание Написать предикат set-equal, который возвращает t, если два его множество-
;аргумента содержат одни и те же элементы, порядок которых не имеет значения.

(defun set-equal (set1 set2)
  (and 
       (eval (cons 'and (mapcar #'(lambda(x) (not (null x))) (mapcar #'(lambda (x) (member x set2 :test 'equal)) set1))))
       (eval (cons 'and (mapcar #'(lambda(x) (not (null x))) (mapcar #'(lambda (x) (member x set1 :test 'equal)) set2))))
      ;;  (mapcar #'(lambda (x) (member x set1 :test 'equal)) set2)
    )
)

(defun is_in (set1 set2)
    (cond
        ((null set1) t)
        ((member (car set1) set2 :test 'equal) (is_in (cdr set1) set2))
        (t nil)    
    )
)

(defun set-equal_rec (set1 set2)
    (and (is_in set1 set2) (is_in set2 set1))
)


; Напишите необходимые функции, которые обрабатывают таблицу из точечных пар:
;(страна. столица), и возвращают по стране - столицу, а по столице - страну.

(defun myrassoc (name lstCons)
    (car (car (remove nil(mapcar #'(lambda (x) (if (equal (cdr x) name) x nil)) lstCons))))
)


(defun myassoc (name lstCons)
    (cdr (car (remove nil(mapcar #'(lambda (x) (if (equal (car x) name) x nil)) lstCons))))
)

(defun myassoc_rec (name lstCons)
    (cond 
        ((endp lstCons) nil)
        ((equal name (car (car lstCons))) (car lstCons))
        (t (myassoc_rec name (cdr lstCons)))
    )
)

(defun myrassoc_rec (name lstCons)
    (cond 
        ((endp lstCons) nil)
        ((equal name (cdr (car lstCons))) (car lstCons))
        (t (myrassoc_rec name (cdr lstCons)))
    )
)

; 7. Напишите функцию, которая умножает на заданное число-аргумент все числа
;из заданного списка-аргумента, когда

;a) все элементы списка --- числа,
;6) элементы списка -- любые объекты.

(defun multiplyAll (num resNum)
    (mapcar #'(lambda (x) (* x num)) resnum)
)

(defun multiplyNumbers (num resNum)
    (mapcar #'(lambda (x) (if (numberp x) (* x num) x)) resnum)
)

(defun multiplyAll_rec(num resnum)
    (cond ((equal (cdr resnum) Nil) (cons (* num (car resnum)) Nil))
          (T (cons (* num (car resnum))(multiplyAll num (cdr resnum))))
    )
)


;Напишите функцию, которая уменьшает на 10 все числа из списка
;аргумента этой функции.

(defun decreaseTen (lst)
    (mapcar #'(lambda (x) (- x 10)) lst)
)

(defun decreaseTen_rec(lst)
    (cond ((null lst) nil)
          (t (cons (- (car lst) 10) (decreaseTen_rec (cdr lst)))))
)

;3. Написать функцию, которая возвращает первый аргумент списка -аргумента.
;который сам является непустым списком.

(defun firstlst (lst)
    (car (remove nil (mapcar #'(lambda (x) (if (listp x) (if (null x) nil x) nil)) lst)))
)

(defun firstlst (lst)
    (cond
        ((and (listp (car lst)) (not (equal (car lst) nil))) (car lst)) 
        ((null lst) nil)
        (t (firstlst (cdr lst)))
    )
)

;4. Написать функцию, которая выбирает из заданного списка только те числа,
;которые больше 1 и меньше 10. 
;(Вариант: между двумя заданными границами. )

(defun between (from to lst)
    (remove nil (mapcar #'(lambda (x) (if (<= x to) (if (>= x from) x))) lst))
)

(defun between_rec(min max lst)
    (cond ((equal (cdr lst) Nil) (cond ((and (>= (car lst) min)(<= (car lst) max) (cons (car lst) nil)))(T Nil)))
          (T (cond 
            ((and (>= (car lst) min)(<= (car lst) max))(cons (car lst) (between_rec min max (cdr lst))))
            (T (between_rec min max (cdr lst)))
            )
          )
    )
)

;5. Написать функцию, вычисляющую декартово произведение двух своих списков-аргументов. 
;( Напомним, что А х В это множество всевозможных пар (a b), где а принадлежит А, принадлежит В.)

(defun decart (lst1 lst2)
    (mapcan #'(lambda (x1)(mapcar #'(lambda (x2) (cons x1(cons x2 nil)))lst2)) lst1)
)

(defun dec_rec(el lst)
 ( cond ((null lst) Nil)
 (t (cons (cons el (cons (car lst) nil)) (dec_rec el (cdr lst))))
 )
)
(defun decart_rec(a b)
 ( cond ( (null a) nil)
 (t (nconc (dec_rec (car a) b) (decart_rec (cdr a) b)))
 )
)

(defun lastOdd (lst value)
    (cond 
        ((null lst) value)
        ((oddp (car lst)) (lastOdd (cdr lst) (car lst)))
        (t (lastOdd (cdr lst) value))
    )
)

(defun modd (lst)
    (lastOdd lst nil)
)

(defun square_all (lst)
    (cond 
    ((null lst) nil)
    (t (cons (* (car lst) (car lst)) (square_all (cdr lst))))
    )
)

(defun select_all_odd (lst)
    (cond
    ((null lst) nil)
    (t (cons (if (oddp (car lst)) (car lst) nil) (select_all_odd (cdr lst))))
    )
)

(defun select-odd (lst)
  (remove nil (select_all_odd lst))
)

