rem #STEP 4 (>=20 min)
rem 开始微调模型。
rem 训练时长取决于你录入/上传的音频总数。

rem 根据声线和样本质量的不同，所需的训练epochs数也不同。 

rem 你也可以在Tensorboard中预览合成效果，若效果满意可提前停止。  

rem Model fine-tuning
rem Total time cost depends on the number of voices you recorded/uploaded.   

rem Best epoch number varies depending on different uploaded voices / sample quality.

rem You can also preview synthezied audio in Tensorboard, it's OK to shut down training manually if you find the quality is satisfying.

rem if have ModuleNotFoundError: No module named 'monotonic_align.monotonic_align', do following command manually
rem cd monotonic_align
rem mkdir monotonic_align
rem python setup.py build_ext --inplace

python finetune_speaker_v2.py -m "./OUTPUT_MODEL" --max_epochs 500 --drop_speaker_embed True

pause