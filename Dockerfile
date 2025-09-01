FROM pytorch/pytorch:2.1.1-cuda12.1-cudnn8-runtime

# the resemble-enhance download script uses `git lfs pull` to
# download the model from huggingface, which will fail unless 
# this is installed.
RUN apt update && apt install -y git-lfs

WORKDIR /workspace

RUN mkdir input
RUN pip install resemble-enhance --upgrade

ADD . .
RUN chmod +x convert_audio.sh enhance.sh denoise.sh
