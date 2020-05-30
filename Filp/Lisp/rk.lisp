; функция аналогичная функции append, вставляет элемент в конец списка
(defun myappend (lst obj)
    (cond
    ((null lst) obj)
    (T (cons (car lst) (myappend (cdr lst) obj)))
    )
)

(defun myappendn (lst obj)
    ;(mapcar #'(lambda (x) (if (null x) obj x)) lst)
    (cons lst (cons obj nil))
)

; Находится ли число в множестве, результат T или nil
; Входные параметры число и множество
(defun isIn(num set)
    (car (remove nil (mapcar #'(lambda (x) (if (eql num x) T nil)) set)))
)

; Находится ли число в множестве, результат T или nil (Рекурсия)
; Входные параметры число и множество
(defun isInRec(num set)
    (cond 
    ((null set) nil)
    ((if (eql num (car set)) T nil))
    (T (isInRec num (cdr set)))
    )
)

; Поиск количества вхождений чмсел из lst в множество set
 (defun find_rec (lst set)
     (cond 
     ((null lst) 0)
     ((listp lst) ( + (find_rec (car lst) set) (find_rec (cdr lst) set)))
     (T ( if (isInRec lst set) 1 0))
     )
 )

(defun my_length(lst) 
    ( cond ((null lst) 0)
        ((not (listp lst)) 1)
        (t (+ 1 (my_length (cdr lst))))
    )
)

; Ищет кол-во вхождений эл списка в множество
(defun findn (lst set)
    (my_length (remove nil (mapcar #'(lambda (x) (if (isIn x set) x nil)) lst)))
)
; Вставляет на к место элемент obj в список lst
(defun insertK (lst k obj)
    (reduce 
    (lambda (res cur) 
        (cond
        ((= (my_length res) k) (myappend res (cons obj nil)))
        ((listp cur) (myappend res cur))
        (T (myappend res (cons cur nil)))
        ) 
    ) lst :initial-value Nil)
)

(defun ins (lst set k)
    (insertK lst k (findn lst set))
)

; Вставляет найденное количество в конец списка
(defun insertK (lst set)
    (append lst (cons (find_rec lst set) nil))
)
