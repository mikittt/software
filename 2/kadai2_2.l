(defun count_a1 (a)
  (setq count 0)
  (progn(dolist (x a)(if (eql x 'a)(setq count(+ count 1))))count))

(defun count_a2 (x)
  (if (null x) 0
      (if (eql (car x) 'a) 
	  (+ 1 (count_a2(cdr x)))
	(count_a2(cdr x)))))
