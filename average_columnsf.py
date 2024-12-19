import numpy as np

file_name = "paste_finf.txt"

with open(file_name, 'r') as f:
    lines = f.readlines()

data = []
for line in lines:
    if not line.startswith("file_name"):
        values = [float(i) for i in line.strip().split(",")[1:] if i.strip() != '']
        if values:
            data.append(values)

data = np.array(data)

column_averages = np.mean(data, axis=0)

print("Column Averages:")
for i, avg in enumerate(column_averages):
    print(f"Column {i+1}: {avg:.5f}")



