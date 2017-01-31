(defun make-servo nil
  (let (b1 b2)
    (setq b1 (make-cube 35 20 46))
    (send b1 :locate #f(9.5 0 0))
    (setq b2 (make-cylinder 3 60))
    (send b2 :locate #f(0 0 -30))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :gray20)
    b1))

(defun make-hinji nil
  (let ((b2 (make-cube 22 16 58))
	(b1 (make-cube 26 20 54)))
    (send b2 :locate #f(-4 0 0))
    (setq b2 (body- b2 b1))
    (send b1 :set-color :gray80)
    b2))

(defclass hinji-servo-robot
  :super cascaded-link)
(defmethod hinji-servo-robot
  (:init
   ()
   (let (h1 s1 h2 s2 l1 l2 l3)
     (send-super :init)
     (setq h1 (make-hinji))
     (setq s1 (make-servo))
     (setq h2 (make-hinji))
     (setq s2 (make-servo))
     (send h2 :locate #f(42 0 0))
     (send s1 :assoc h2)
     (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list h1)))
     (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list s1 h2)))
     (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list s2)))
     (send l3 :locate #f(42 0 0))
     
     (send self :assoc l1)
     (send l1 :assoc l2)
     (send l2 :assoc l3)
     
     (setq joint-link
	   (list
	    (instance rotational-joint
		      :init :parent-link l1 :child-link l2
		      :axis :z)
	    (instance rotational-joint
		      :init :parent-link l2 :child-link l3
		      :axis :z)))
     (setq links (list l1 l2 l3))
     (setq joint-list joint-link)
     (send self :init-ending)
     )))


(setq r1 (instance hinji-servo-robot :init))
(setq r2 (instance hinji-servo-robot :init))
(objects (list r1 r2))
(send r1 :assoc r2)
(dotimes (i 10000)
  (send r1 :angle-vector (float-vector (* 90 (sin (/ i 500.0))) (* 90 (sin (/ i 1000.0)))))

  (send *irtviewer* :draw-objects))
