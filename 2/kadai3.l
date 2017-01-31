(defun summit1 (lst)
  (setq lst (remove nil lst))
  (apply #'+ lst))

(defun summit2 (lst)
  (if (null lst) 0
    (let ((x (car lst)))
      (if (null x) 
	  (summit2(cdr lst))
	(+ x (summit2 (cdr lst)))))))
