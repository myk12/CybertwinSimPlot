import numpy as np

# 生成一些随机的箱线图数据
np.random.seed(42)
data1 = np.random.normal(loc=0.5, scale=0.1, size=100)
data2 = np.random.normal(loc=0.7, scale=0.2, size=100)
data3 = np.random.normal(loc=0.4, scale=0.15, size=100)

# 将数据保存到文件中
with open('boxplot_data.txt', 'w') as f:
    for value in data1:
        f.write(f'Data1 {value}\n')
    for value in data2:
        f.write(f'Data2 {value}\n')
    for value in data3:
        f.write(f'Data3 {value}\n')
