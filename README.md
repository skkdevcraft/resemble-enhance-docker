# Resemble-Enhance

```bash
docker build -t audio-enhance .
```

```bash
docker run --gpus all -it --rm -v ./input:/workspace/input -v ./output:/workspace/output_enhance audio-enhance bash
```