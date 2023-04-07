import os
root="C:\\Users\\DennisSun\\scripts\\"
files=[]
for dirpath,dirnames,filenames in os.walk(root):
   for file in filenames:
      files.append(os.path.join(dirpath,file))
b=[]
ContainString=input("请输入文件包含的内容：")
for file in files:
    f=open(str(file),'r',encoding='utf-8',errors='ignore')
    if(ContainString in f.read()):
      b.append(file)
print(b)
