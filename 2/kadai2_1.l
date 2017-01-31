(defun period1 (end)
  (do ((i 1 (+ i  1)))
      ((> i end ) 'done)
      (format t ".")))

(defun period2 (end)
  (if (= end 0)
      'done
    (progn (format t ".")
	   (period2 (- end 1)))))
