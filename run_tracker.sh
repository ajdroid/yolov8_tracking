DO_SEG=false
MODEL_SIZE=x #n, s, m, l, x
# construct model name
MODEL_NAME="yolov8"
MODEL_NAME=${MODEL_NAME}${MODEL_SIZE}

if [ $DO_SEG = true ] ; then
    MODEL_NAME=${MODEL_NAME}-seg
fi

# tracker type
TRACKER="deepocsort"

RUN_NAME=${MODEL_NAME}+${TRACKER}

# append the .pt
MODEL_NAME=${MODEL_NAME}.pt

#data source
# PROJECT="runs/track"
# SOURCE=/home/abhijatbiswas/datasets/avtfcw-videos/front_test.mp4

PROJECT="runs/UNINEXT-comparison"
SOURCE=/home/abhijatbiswas/gitstuff/UNINEXT/datasets/bdd/images/track/val/b1c9c847-3bda4659/

# run command
# echo "

# export PYTHONPATH=${PYTHONPATH}:./

python examples/track.py --source ${SOURCE} \
--save \
--yolo-model ${MODEL_NAME} \
--tracking-method ${TRACKER} --project ${PROJECT} --name ${RUN_NAME} \
--device 0
# "