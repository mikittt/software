#!/usr/bin/env python
import rospy,actionlib
from move_base_msgs.msg import *
import rospy
from opencv_apps.msg import RotatedRectStamped
from geometry_msgs.msg import Point
def cb(msg):
    if msg.rect.size.width!=0.0 and msg.rect.size.height!=0.0:
        #rospy.init_node('send_goal',anonymous=True)
        try:
            print'1'
            client=actionlib.SimpleActionClient('move_base',MoveBaseAction)
            print'2'
            client.wait_for_server()
            print'3'
            goal=MoveBaseGoal()
            goal.target_pose.header.stamp=rospy.Time.now()
            goal.target_pose.header.frame_id="/map"
            goal.target_pose.pose.position.x=3;
            goal.target_pose.pose.position.y=3;
            goal.target_pose.pose.orientation.w=1
            print goal
            client.send_goal(goal)
        except rospy.ROSInterrupException: pass
rospy.init_node('send_goal',anonymous=True)
rospy.Subscriber('/camshift/track_box',RotatedRectStamped,cb)
rospy.spin()
