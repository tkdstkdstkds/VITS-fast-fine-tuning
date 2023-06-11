@echo off

mkdir pretrained_models

set D_0Model=./pretrained_models/D_0.pth
set D_0ModelURL=https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/D_trilingual.pth
if exist "%D_0Model%" (
    echo %D_0Model% already exists. Skipping download.
) else (
    curl -L -o "%D_0Model%" "%D_0ModelURL%"
)

set G_0Model=./pretrained_models/G_0.pth
set G_0ModelURL=https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/pretrained_models/G_trilingual.pth
if exist "%G_0Model%" (
    echo %G_0Model% already exists. Skipping download.
) else (
    curl -L -o "%G_0Model%" "%G_0ModelURL%"
)

set speakerConfig=./configs/finetune_speaker.json
set speakerConfigURL=https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer/resolve/main/configs/uma_trilingual.json
if exist "%speakerConfig%" (
    echo %speakerConfig% already exists. Skipping download.
) else (
    curl -L -o "%speakerConfig%" "%speakerConfigURL%"
)

pause