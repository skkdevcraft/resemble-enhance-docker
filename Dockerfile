FROM pytorch/pytorch:2.1.1-cuda12.1-cudnn8-runtime

WORKDIR /workspace

RUN mkdir input
RUN pip install resemble-enhance --upgrade

ADD . .
RUN chmod +x convert_audio.sh enhance.sh denoise.sh

ENTRYPOINT [ "sh", "-c", "sleep infinity" ]

