

rem Running this block will generate final annotations for training & validation, as well as config file.

rem 选择是否加入辅助训练数据：/ Choose whether to add auxiliary data: 

rem 辅助训练数据是从预训练的大数据集抽样得到的，作用在于防止模型在标注不准确的数据上形成错误映射。

rem Auxiliary data is to prevent overfitting when the audio samples are small or with low quality. 

rem 以下情况请勾选：  

rem 总样本少于100条/样本质量一般或较差/样本来自爬取的视频  

rem 以下情况可以不勾选：  

rem 总样本量很大/样本质量很高/希望加速训练/只有二次元角色  

rem 底模采样率可能与辅助数据不同，需要重采样
python preprocess_v2.py --add_auxiliary_data True --languages "CJE"

pause