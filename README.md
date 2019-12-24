# ToDoList by ASP.NET Core api + VUE

本"项目"(Demo)为学校asp课设，使用`ASP.NET Core api` 和 `VUE`搭建，下面给出具体文档和如何写的项目。

![完成事项](https://i.loli.net/2019/12/24/n2TcuOt9XGpHvds.png)

![新增事项+数据显示](https://i.loli.net/2019/12/24/e2MaYvRLSntTbPd.png)

![空白无数据](https://i.loli.net/2019/12/24/R1E9QnyLKI7gc4u.png)

![翻页操作](https://i.loli.net/2019/12/24/XTjquKUHg2dPwNZ.png)

![数据库](https://i.loli.net/2019/12/23/PpiJjIthxSAr781.png)

![api](https://i.loli.net/2019/12/23/upmeLzSMVD8h2WP.png)

## 服务端开发

### 开发

1. clone Project
2. change Mysql Info in file: `todos-Server/DBConnection.cs`
3. import Mysql sql file(`todos-Server/todoList.sql`) to local Mysql
4. start development ↓ ~

```bash
cd todos-Server
dotnet restore # 按照依赖
dotnet watch run # 启动热更新开发模式
```

### 主要文件解释

没有标注的目录没有研究或没有写几行代码，为默认生成的文件。

```bash
/Volumes/Hi/demoS/todoList/todos-Server

├── Controllers
|  └── todosController.cs # 控制器文件 - 里面有路由 和 请求方法等的设置
├── DBConnection.cs # 数据库连接的单例模式封装
├── Models
|  └── TodoItem.cs # 数据库操作 - 里面有基本的增删改查语句， 由Controllers调用
├── Program.cs
├── Properties
|  └── launchSettings.json
├── Startup.cs
├── apiDocs.html # 接口文档
├── appsettings.Development.json
├── appsettings.json
├── todoList.sql # 数据库文件
└── todos-Server.csproj # 项目依赖，执行dotnet restore之后，会按照依赖在obj目录
```

### 怎么完成的/坑点

1. 阅览了部分官方文档，选择了api的开发模式（前后端分离），因为不想写服务端。

文档链接： [ASP.NET文档](https://docs.microsoft.com/zh-cn/aspnet/?view=aspnetcore-3.1#pivot=core)

2. 参考了一个github的仓库，怎么用asp操作mysql数据库（用sql语句的方式，不然课设文档没能写的内容。）

仓库地址： [CsharpApiTest](https://github.com/lgleto/CsharpApiTest)

3. 如何初始化一个项目。

```bash
dotnet new webapi -o todos-Server --no-https
```

一行命令搞定，初始化了一个不使用https的api基本目录。


## 前端内容

前端基于VUE，使用Element-UI，基于VUE-cli生成初始化仓库。

### 开发/运行

```bash
cd todos-fe
npm install
npm run serve
```
