#!/bin/bash

# extract 
input_folder='/home/abhijatbiswas/datasets/avtfcw-videos/videos/'

list=`find ${input_folder} -name '*.mp4'`

extract_traffic_videos() {
    output_folder='/home/abhijatbiswas/datasets/avtfcw-videos/traffic_videos/'
    file="$1"
    filename=$(basename "$file" .mp4)
    output_filename="${output_folder}/${filename}_traffic.mp4"

    ffmpeg -i "$file" -filter_complex "[0:v]crop=iw/2:ih/2:0:0[cropped];[cropped]crop=iw:ih-115:0:40" "$output_filename"
}

export -f extract_traffic_videos

find "${input_folder}" -type f -name "*.mp4" | parallel -j 16 extract_traffic_videos {}