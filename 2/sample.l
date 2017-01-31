(defclass rational
  :super propertied-object
  :slots (lst))

(defmethod rational
  (:set_value ()
   (setq lst (list 0))))
