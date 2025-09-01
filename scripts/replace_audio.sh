#!/bin/bash
set -e
# set -x -v 

# Check if input file is provided
if [ $# -lt 1 ]; then
  echo "Usage: $0 <video_file>"
  exit 1
fi

INPUT_FILE="$1"
BASENAME=$(basename "$INPUT_FILE")
FILENAME="${BASENAME%.*}"

# Create necessary directories
mkdir -p audio_only output_enhance output

# Step 1: Extract audio
echo "[INFO] Extracting audio..."
ffmpeg -y -i "$INPUT_FILE" -q:a 0 -map a "audio_only/audio.wav"

# Step 2: Enhance audio with external script
echo "[INFO] Enhancing audio..."
resemble-enhance audio_only output_enhance

# Step 3: Merge enhanced audio back into original video
echo "[INFO] Combining enhanced audio with original video..."
ffmpeg -y -i "$INPUT_FILE" -i "output_enhance/audio.wav" \
  -c:v copy -map 0:v:0 -map 1:a:0 -shortest "output/${FILENAME}.mp4"

echo "[INFO] Done! Final video saved at output/${FILENAME}.mp4"
