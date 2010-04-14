#/****************************************************************
# *
# * Copyright (c) 2010
# *
# * Fraunhofer Institute for Manufacturing Engineering	
# * and Automation (IPA)
# *
# * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# *
# * Project name: care-o-bot
# * ROS stack name:
# * ROS package name:
# * Description: This Makefile helps to build the care-o-bot repository. Define
# *     all packages you want to build in the variable PACKAGES_TO_BUILD.
# * Usage:
# *     run 'make or make all' to build all packages listed below
# *     run 'make ros' to build all packages listed below with the recursive build system of ros
# *     run 'make ros-ignore-errors' to build all packages listed below with the recursive build system of ros ignoring errored builds
# *     run 'make ros-preclean' to build all packages listed below with the recursive build system of ros with the pre-clean option
# *     run 'make ros-deps' to install all system dependencies for the packages listed below
# *     run 'make clean' to clean up all packages listed below
# *
# * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# *			
# * Author: Florian Weisshardt, email:florian.weisshardt@ipa.fhg.de
# * Supervised by: Florian Weisshardt, email:florian.weisshardt@ipa.fhg.de
# *
# * Date of creation: Jan 2010
# * ToDo:
# *
# * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# *
# * Redistribution and use in source and binary forms, with or without
# * modification, are permitted provided that the following conditions are met:
# *
# *     * Redistributions of source code must retain the above copyright
# *       notice, this list of conditions and the following disclaimer.
# *     * Redistributions in binary form must reproduce the above copyright
# *       notice, this list of conditions and the following disclaimer in the
# *       documentation and/or other materials provided with the distribution.
# *     * Neither the name of the Fraunhofer Institute for Manufacturing 
# *       Engineering and Automation (IPA) nor the names of its
# *       contributors may be used to endorse or promote products derived from
# *       this software without specific prior written permission.
# *
# * This program is free software: you can redistribute it and/or modify
# * it under the terms of the GNU Lesser General Public License LGPL as 
# * published by the Free Software Foundation, either version 3 of the 
# * License, or (at your option) any later version.
# * 
# * This program is distributed in the hope that it will be useful,
# * but WITHOUT ANY WARRANTY; without even the implied warranty of
# * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# * GNU Lesser General Public License LGPL for more details.
# * 
# * You should have received a copy of the GNU Lesser General Public 
# * License LGPL along with this program. 
# * If not, see <http://www.gnu.org/licenses/>.
# *
# ****************************************************************/

#--------------------------------------------------------------------
# list all packages here
PACKAGES_APPS=\
cob_teleop\
cob_dashboard\
cob_2dslam\
cob_2dnav\
cob_simpledrive

PACKAGES_COMMON=\
cob_msgs\
cob_srvs\
cob_actions\
cob_vision_utils\
cob_utilities

PACKAGES_DRIVER=\
cob_sick_s300\
cob_hokuyo\
cob_sdh\
cob_camera_sensors\
cob_powercube_chain\
cob_arm\
cob_torso\
cob_platform\
cob_relayboard\
cob_base_drive_chain\
cob_generic_can\
cob_canopen_motor\
cob_drive_identification\
cob_tf_broadcaster\
#cob_camera_axis\

PACKAGES_EXTERN=\
libm5api\
libntcan\
libpcan\
libwm4

PACKAGES_SIMULATION=\
cob_defs\
cob_ogre\
cob_gazebo
#--------------------------------------------------------------------

PACKAGES_TO_BUILD=$(PACKAGES_APPS) $(PACKAGES_COMMON) $(PACKAGES_DRIVER) $(PACKAGES_EXTERN) $(PACKAGES_SIMULATION)

all:
	make ros
ros:
	rosmake $(PACKAGES_TO_BUILD)

ros-ignore-errors:
	rosmake $(PACKAGES_TO_BUILD) -r -v

ros-pre-clean:
	rosmake $(PACKAGES_TO_BUILD) -s --pre-clean
	
ros-deps:
	rosdep install $(PACKAGES_TO_BUILD)

clean:
	@for dir in $(PACKAGES_TO_BUILD); do \
		$(MAKE) -C $$(rospack find $$dir) clean; \
		done
