(defclass rat
  :super propertied-object
  :slots (n_d))
(defmethod rat
  (:set_rat (x) (setq n_d x))
  (:get_numer () (car n_d))
  (:get_denom () (car (cdr n_d)))
  (:show () (format t "~A/~A~%" (send self :get_numer) (send self :get_denom)))
  )


 (defun add_rat (x y) 
   (instance rat :set_rat
	 (list
	  (+ (* (send x :get_numer) (send y :get_denom)) (* (send x :get_denom) (send y :get_numer)))
	  (* (send x :get_denom) (send y :get_denom))
	  )
	 )
   )
