#!/usr/bin/python

import time
from random import *

import roslib
roslib.load_manifest('cob_script_server')
import rospy

from simple_script_server import script

class NavTest(script):

	def Initialize(self):
		self.sss.init("base")	

	def Run(self):
		i = 1
		while self.sss.parse==False:
			print "test nr=",i
			self.sss.move("base","order")
			self.sss.move("base","home")
			i = i+1
		
if __name__ == "__main__":
	SCRIPT = NavTest()
	SCRIPT.Start()
