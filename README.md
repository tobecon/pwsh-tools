# pwsh-tools

## 这里有一些小函数, 用来管理你电脑上的项目, 


### 开始之前, 你需要设置一些环境变量

- 1. 将 VisualStudio 放在环境变量的 Path 中,比如我的vs 安装路径, C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE

### 一些命令说明

- pcd , 用来切换到项目文件夹
- pvs , 用来打开文件夹下的解决方案
- pcmd , 用来执行确定的解决方案
- gitvv , 用来执行git remote -v 命令
- pcode , 用VS Code 打开文件夹

### 如何使用 1 

- 确保你电脑上有 VS Code , 并且是默认安装.
- 打开一个 powershell 命令行, 然后执行 Code $profile
- 把本目录下面的 profile.ps1 粘贴进去. 然后保存. 

### 如何使用 2

- 在powershell 里面执行 code ~/.projlist 
- 然后在里面写上你的项目目录 信息, 类似下面这样
- 第一列是你项目的短名称,尽可能的短. 这样启动时键入的更快, 
- 第二列是你项目的根目录. 如果想要使用pvs 打开解决方案. 确保sln 文件也在文件夹内. 
- 第三列是是否以管理员权限启动 VisualStudio . 这是为了有些.net IIS 项目需要管理员权限.

```
Name,Path,RequireAdmin
blog, D:\codmowa\codmowa,false
redis-dev,D:\Netsdl\redis\redis\start.bat,false
```

### 如何使用 3
 - 直接键入 pcd blog, pcmd redis-dev 等等. 就可以了