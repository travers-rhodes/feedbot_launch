#!/usr/bin/env bash

pushd ~/code/feedBotCode/src/do_matlab_ros
matlab -nodisplay -nodesktop -r "try, run KinectInteraction.m; end; quit"
popd
