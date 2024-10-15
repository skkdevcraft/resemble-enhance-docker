# Resemble-Enhance

This is a remarkable script for enhancing and denoising audio files.

It can make otherwise-unusable audio recordings suitable for sharing with others or even incorporating into a publishable video. (e.g. audio recorded in a noisy cafe environment with street noise or loud echo, as well as multiple speakers)

This image is based on the **pytorch Docker image,** and simply installs the `resemble-enhance` command using `pip install resemble-enhance`.

The image also incorporates a useful script for prepping the audio files.

## How to use

These instructions assume that you are using a remote GPU instance (consider using **vast.ai** with the template based on this docker image).

Use the _SCP URL_ or any other method to transfer the input audio files (in any audio format) to the `/workspace/input` folder inside of the instance.

After that, use the _SSH URL_ to log into the instance and use the following commands, based on your needs.

## Prep the Audio

If you transferred the audio files in a format other than `WAV` then you will need to convert the audio files first. You can conveniently do this on the GPU instance using the provided `convert_audio.sh` script, as follows:
```bash
cd /workspace
./convert_audio.sh
```

... then follow the instructions.

## Enhance the Audio

To enhance the audio, you can conveniently use the provided `enhance.sh` script, as follows:
```bash
cd /workspace
./enhance.sh
```

The enhanced audio files can be found in the folder `/workspace/output_enhance` inside the instance after the completion of the command.

## Denoise the Audio

To denoise the audio (without necessarily enhancing it), you can conveniently use the provided `denoise.sh` script, as follows:
```bash
cd /workspace
./denoise.sh
```

The denoised audio files can be found in the folder `/workspace/output_denoise` inside the instance after the completion of the command.

## More information

To find more information about resemble-enhance please check out the resemble-enhance [GitHub repository](https://github.com/resemble-ai/resemble-enhance) and try to corroborate what you read there with the contents of the `enhance.sh` and `denoise.sh` scripts.

This same documentation is also offered for the vast.ai template using this image.

## Feedback

Please visit the repository of this docker image which also serves as the issue tracker for the image and the _vast.ai_ template [here](https://github.com/diraneyya/resemble-enhance-docker).

The image is hosted on Docker hub at [orwa84/resemble-enhance](https://hub.docker.com/r/orwa84/resemble-enhance).