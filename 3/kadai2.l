
(setq a1 (make-cylinder 10 100))
(send a1 :locate #f(0 0 0))
(setq a2 (make-cylinder 6.4 80))
(send a2 :locate #f(0 0 0))
(setq a3 (body- a1 a2))
(send a3 :set-color :grey20)

(setq a4 (make-cylinder 6.3 100))
(send a4 :locate #f(0 0 0))
(objects (list a3 a4))

(setq i 1)
(do-until-key 
 (send a4 :locate (float-vector 0 0 (+ (*  30 (sin (deg2rad i)))  -50)))
 (setq i (+ i 1))
 (send *irtviewer* :draw-objects)
 (send a4 :locate (float-vector 0 0 (- (+ (*  30 (sin (deg2rad (- i 1))))  -50))))
 (x::window-main-one)
)


