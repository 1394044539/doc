安装步骤

1、双击node的安装包进行安装，一直下一步就行，有一个设置会自己吧node放到环境变量中去

2、设置自定义的数据目录

这里建议先把目录建好，用管理员账号进入cmd

```bat
npm config set prefix "C:\node\node_global"
npm config set cache "C:\node\node_cache"
```

3、设置淘宝镜像

```
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

