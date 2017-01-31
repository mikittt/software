(load "models/room73b2-scene.l")
(load "models/h7-robot.l")
(setq *room* (room73b2))
(setq *robot* (h7))
;;初期姿勢
(send *robot* :reset-pose)
;;ロボットの移動
;;(send *room* :spots)で部屋内の代表的な座標を取得
(send *robot* :move-to (send *room* :spot "cook-spot") :world)
(send *robot* :locate #f(0 0 550))
(send *robot* :locate #f(200 -1500 0))
#|
(send *irtviewer* :look-all
      ;;make...:points のリストの中から最小と最大の座標値を見つけ、 bounding-box のインスタンスを作る
      (geo::make-bounding-box
       ;;
       (flatten (send-all (send *robot* :bodies) :vertices))))
|#
(setq *dish* (send *room* :object "room73b2-dish"))
(setq *sponge* (send *room* :object "room73b2-sponge"))
;;環境モデルの初期化直後は物体は部屋にassocされているので注意
(if (send *dish* :parent) (send (send *dish* :parent) :dissoc *dish*))
(if (send *sponge* :parent) (send (send *sponge* :parent) :dissoc *sponge*))

;;ロボットの視線を対象物に向ける
;;(send *robot* :head :look-at (send *sponge* :worldpos))
;;----------------------------------------------------------------------
;;今回、対象物体が:handleメソッドとして記述されていて、メソッドはリストを返す

(send *robot* :larm :inverse-kinematics
      (car (send *dish* :handle))
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)
;;持ち上げるには、まずロボットの手先と対象物体を連結
(send *robot* :larm :end-coords :assoc *dish*)
;;100メートル持ち上げ、その時look-at-targetをtとして首を常に対象へ
(send *robot* :larm :move-end-pos #f(-50 100 300) :world
      :debug-view t :look-at-target t)

(send *robot* :larm :move-end-pos #f(-50 -400 -400) :world
      :debug-view t :look-at-target t)
(send *robot* :locate #f(0 300 0))

;;-----------------------------------------------------------------------
#|
(send *robot* :larm :inverse-kinematics
      (car (send *sponge* :handle))
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)
;;持ち上げるには、まずロボットの手先と対象物体を連結
(send *robot* :larm :end-coords :assoc *sponge*)
;;100メートル持ち上げ、その時look-at-targetをtとして首を常に対象へ
(send *robot* :larm :move-end-pos #f(-50 100 300) :world
      :debug-view t )
|#
(objects (list *room* *robot*))
