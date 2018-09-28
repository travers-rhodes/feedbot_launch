# Feedbot Code

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

Install jsonpickle by running the following (we could do it with rosdep, but you'd need to add a config file to say where to find it)
```
pip install -U jsonpickle
```

now, you should be able to catkin_make from ~/domus_ws successfully.

### Test barebones installation
To test the code, run
```
source devel/setup.bash
roslaunch feedbot_launch default.launch sim:=true
```

## Full installation:
Follow the steps above, but use the `https://raw.githubusercontent.com/travers-rhodes/rosinstalls/master/domus.rosinstall` rosinstall file instead of the domus_barebones one. 

Install the NiryoOne desktop application so you can command the robot to calibrate and leave learning mode and otherwise check its status.

In addition, you need to install the Ueye camera driver and caffe (and pcl?).

### Install Niryo One Studio (Desktop Application)
This is available from https://niryo.com/download/

### Ueye Camera-related
You also need to download the IDE at https://www.ids-imaging.us/download-ueye-lin64.html
You have to create a free account in order to download it

unzip and run the USB installer 
```
sudo ./ueyesdk-setup-4.90.06-usb-amd64.gz.run
```
and note the output
`To uninstall, run '/usr/local/share/ueye/bin/ueyed_install-usb uninstall'.`

You need to restart after installation.

### Additional installation requirements
Install caffe by following the steps at http://caffe.berkeleyvision.org/install_apt.html (use cmake from http://caffe.berkeleyvision.org/installation.html)
I chose the branch at https://github.com/BVLC/caffe/tree/intel because it is supposed to be super speedy on cpu only.
Hrm...on ada_desktop, installing LMDB too because was seeing error that couldn't be found. https://lmdb.readthedocs.io/en/release/ (or, more likely, the problem was just I forgot to install the 14.04 dependencies listed on the install docs...)
Also, you need to create the "proto" files manually https://github.com/muupan/dqn-in-the-caffe/issues/3
