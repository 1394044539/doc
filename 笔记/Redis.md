## 一、安装Redis

因为Windows有手就行，所以这里只讲一讲Linux

1、下载redis的压缩包

下载链接：http://download.redis.io/releases

找到要下载的版本，将文件名拼接在下载链接后面，如：http://download.redis.io/releases/redis-5.0.10.tar.gz

在Linux下输入命令

```shell
wget http://download.redis.io/releases/redis-5.0.10.tar.gz
```

2、解压下载后的tar包，顺便重命名一下

```shell
tar -zxvf redis-5.0.7.tar.gz redis-5.0.7
```

3、进入安装目录下，执行make进行编译

```shell
make
```

make完之后，src目录下会多出很多的文件，所有启动脚本都在src下

4、修改配置

进入安装目录下vim redis.conf，将本地访问注释掉，将后台启动改为yes，设置一下密码

```conf
# bind 127.0.0.1 #注释掉这一行
daemonize yes #改为yes
requirepass 123   # 设置密码123
```

5、开启服务

进入安装目录下输入命令

```shell
./src/redis-server redis.conf
```

6、进入redis

ps：很多教程会用如下方式进入redis

```shell
./src/redis-cli -h localhost -p 6379 -a 123
```

这种方式redis可能会报错

```
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
```

这个时候我们应该分两步使用redis

```shell
/src/redis-cli -h localhost -p 6379 
```

先进入redis，然后再输入密码

```redis
redis>auth 123
```

