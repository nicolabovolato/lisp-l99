(load (merge-pathnames "../l-99/working-with-lists/p05.lisp" *load-truename*)) ; reverse-list

(defun append-list (list1 list2)
    (cond
        ((equal list1 nil) list2)
        ((equal list2 nil) list1)
        (t (append-list-fun (reverse-list list1) (reverse-list list2) '()))
    ))

(defun append-list-fun (list1 list2 list3) 
    (cond
        ((equal list2 nil)
            (cond 
                ((equal list1 nil) list3)
                (t (append-list-fun (cdr list1) list2 (cons (car list1) list3)))
            ))
        (t (append-list-fun list1 (cdr list2) (cons (car list2) list3)))
    ))

(assert (equal (append-list '() '()) '()))
(assert (equal (append-list '(A) '(B)) '(A B)))
(assert (equal (append-list '(A B C) '(D)) '(A B C D)))
(assert (equal (append-list '(A) '(B C D)) '(A B C D)))
(assert (equal (append-list '(A B) '(C D)) '(A B C D)))