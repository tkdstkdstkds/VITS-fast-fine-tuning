@echo off

set sampleAudioName=sampled_audio4ft_v2.zip
set sampleAudioURL=https://huggingface.co/datasets/Plachta/sampled_audio4ft/resolve/main/sampled_audio4ft_v2.zip

if exist "%sampleAudioName%" (
    echo %sampleAudioName% already exists. Skipping download.
) else (
    curl -L -o "%sampleAudioName%" "%sampleAudioURL%"
)

set sampleAudioFolder=%sampleAudioName:_v2.zip=%
if exist "%sampleAudioFolder%" (
    echo %sampleAudioFolder% already exists. Skipping tar.
) else (
    tar -xf %sampleAudioName%
)

mkdir video_data
mkdir raw_audio
mkdir denoised_audio
mkdir custom_character_voice
mkdir segmented_character_voice

pause