#!/usr/bin/env bash

pushd ~/feedBotCode/src/do_matlab_ros
#matlab -nodisplay -nodesktop -r "try, run KinectInteraction.m; end; quit"
matlab -nodisplay -nodesktop -r "run KinectInteraction.m"
popd
