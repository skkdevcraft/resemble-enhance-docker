# Resemble-Enhance

### Build the image
```bash
docker build -t audio-enhance .
```

### Start a shell into the container
```bash
docker run --gpus all -it --rm -v ./input:/workspace/input -v ./output:/workspace/output audio-enhance bash
```

### Enhance the audio of a video file:
```
./replace_audo.sh ./input/original.mp4
```