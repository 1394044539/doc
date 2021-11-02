一、基本命令

1、yum

安装软件(以foo-x.x.x.rpm为例）：yum install foo-x.x.x.rpm

删除软件：yum remove foo-x.x.x.rpm或者yum erase foo-x.x.x.rpm

升级软件：yum upgrade foo或者yum update foo

查询信息：yum info foo

搜索软件（以包含foo字段为例）：yum search foo

显示软件包依赖关系：yum deplist foo

常用功能：

- -q 静默执行
- -t 忽略错误
- -R[分钟] 设置等待时间
- -y 自动应答yes
- --skip-broken 忽略依赖问题
- --nogpgcheck 忽略GPG验证

二、Linux基本配置





CentOS 有个很方便的软件安装工具yum，但是默认安装完CentOS，系统里使用的是国外的CentOS更新源，

这就造成了我们使用默认更新源安装或者更新软件时速度很慢的问题，甚至更新失败。
为了使用yum工具能快速的安装更新软件，我们需要将默认的yum更新源配置为国内的更新源。



查看密码

grep 'password' /var/log/mysqld.log

docker run -p 3306:3306 --name mysql02 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.5

```
wget http://repo.mysql.com/MySQL-server-5.5.15-1.linux2.6.x86_64.rpm
```

阿里云的源

```
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo 
```

或者网易云的源

```
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
yum clean all
yum makecache
```

三、配置各种环境

1、配置jdk

2、配置maven

3、配置git

4、配置