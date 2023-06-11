

echo "數據格式參考 https://github.com/Plachtaa/VITS-fast-fine-tuning/blob/main/DATA.MD"
echo "运行该单元格会对所有上传的数据进行自动去背景音&标注。"
echo "由于需要调用Whisper和Demucs，运行时间可能较长。 "

echo "Running this codeblock will perform automatic vocal seperation & annotation. "
echo "Since this step uses Whisper & Demucs, it may take a while to complete."
echo "将所有视频（无论是上传的还是下载的，且必须是.mp4格式）抽取音频"
rem python scripts/video2audio.py

echo "将所有音频（无论是上传的还是从视频抽取的，必须是.wav格式）去噪"
rem python scripts/denoise_audio.py

echo "分割并标注长音频"
python scripts/long_audio_transcribe.py --languages "CJE" --whisper_size large

echo "标注短音频"
python scripts/short_audio_transcribe.py --languages "CJE" --whisper_size large

echo "底模采样率可能与辅助数据不同，需要重采样"
python scripts/resample.py

pause