#!/bin/bash
​
# ========================================================= 
# Variables
# =========================================================
SENSOR_ID=0
DEVICE=0
VIDEOSRC=v4l2src
OUTPUT=capture.mp4
PIPELINE="gst-launch-1.0 $VIDEOSRC ! videoscale  ! videoconvert ! videorate  ! x264enc ! avimux ! autovideosink -e"
​
# ========================================================= 
# Parse command line parameters
# ========================================================= 
​
while [[ $# -gt 0 ]]
do
    case $1 in
        -f=*|--framerate=*)
            FRAMERATE=$1
            shift
            ;;
        -h=*|--height=*)
            HEIGHT=$1
            shift
            ;;
        -w=*|--width=*)
            WIDTH=$1
            shift
            ;;
        -o=*|--outputfile=*)
            OUTPUTFILE=$1
            shift
            ;;
        *)
            echo "Unknown parameter: $1"
            exit 1
            ;;
    esac
done
​
​
# # ========================================================= 
# # gstreamer command
# # ========================================================= 
​
# if [ "$HEIGHT" = 0 ]; then
#     echo -e "No height specified. Exit.\n"
#     usage
#     exit 1
# fi
​
# if [ "$WIDTH" = 0 ]; then
#     echo -e "No width specified. Exit.\n"
#     usage
#     exit 1
# fi
​
# if [ "$FRAMERATE" = 0 ]; then
#     echo -e "No frame rate specified. Exit.\n"
#     usage
#     exit 1
# fi
​
# if [ "$OUTPUTFILE" = 0 ]; then
#     echo -e "No output file specified. Exit.\n"
#     usage
#     exit 1
# fi
​
echo "fps: " $FRAMERATE
echo "resolution: " $HEIGHT * $WIDTH
echo "filename: " $OUTPUTFILE
​
​
​
#  PIPELINE="gst-launch-1.0 $VIDEOSRC device=$DEVICE ! video/x-raw,format=BGRx ! videoscale ! video/x-raw,width=$WIDTH,height=$HEIGHT ! videoconvert ! videorate ! video/x-raw,framerate=$FRAMERATE/1 ! x264enc ! avimux ! filesink location="$OUTPUTFILE" -e"
​
​
eval "$PIPELINE"