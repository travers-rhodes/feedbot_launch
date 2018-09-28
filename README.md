# feedbot_launch

## Barebones installation:
create a folder  ~/domus_ws/, create a src folder in that folder
```
mkdir -p ~/domus_ws/src
```
source /opt/ros/kinetic/setup.bash

run catkin_make inside ~/domus_ws

use wstool to clone the needed repositories:

```
cd ~/domus_ws/src
wstool init
wstool merge https://raw.githubusercontent.com/travers-rhodes/rosinstalls/master/domus_barebones.rosinstall
wstool up
```

then, install all the ros package dependencies by running (from the ~/domus_ws folder):

```
rosdep update
rosdep install --from-paths src --ignore-src -r -y 
```

(note that if your default "python" is python2, and your "pip" is python3, then you'll need to install your python packages manually)

now, you should be able to catkin_make from ~/domus_ws successfully.

To test the code, run
```
source devel/setup.bash
roslaunch feedbot_launch default.launch sim:=false
```
