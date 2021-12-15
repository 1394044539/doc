## 一、基本命令

### yum

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

### 1、基本命令

1.1 关机和重启
关机
    shutdown -h now        立刻关机
    shutdown -h 5        5分钟后关机
    poweroff            立刻关机
重启
    shutdown -r now        立刻重启
    shutdown -r 5        5分钟后重启
    reboot                立刻重启

1.2 帮助命令
--help命令
  shutdown --help：
  ifconfig  --help：查看网卡信息

man命令（命令说明书） 
  man shutdown
  注意：man shutdown打开命令说明书之后，使用按键q退出

### 2、目录操作命令

2.1 目录切换 cd
命令：cd 目录

cd /        切换到根目录
cd /usr        切换到根目录下的usr目录
cd ../        切换到上一级目录 或者  cd ..
cd ~        切换到home目录
cd -        切换到上次访问的目录

2.2 目录查看 ls [-al]
命令：ls [-al]

ls                查看当前目录下的所有目录和文件
ls -a            查看当前目录下的所有目录和文件（包括隐藏的文件）
ls -l 或 ll       列表查看当前目录下的所有目录和文件（列表查看，显示更多信息）
ls /dir            查看指定目录下的所有目录和文件   如：ls /usr

2.3 目录操作【增，删，改，查】
2.3.1 创建目录【增】 mkdir
命令：mkdir 目录

mkdir    aaa            在当前目录下创建一个名为aaa的目录
mkdir    /usr/aaa    在指定目录下创建一个名为aaa的目录

2.3.2 删除目录或文件【删】rm
命令：rm [-rf] 目录

删除文件：
rm 文件        删除当前目录下的文件
rm -f 文件    删除当前目录的的文件（不询问）

删除目录：
rm -r aaa    递归删除当前目录下的aaa目录
rm -rf aaa    递归删除当前目录下的aaa目录（不询问）

全部删除：
rm -rf *    将当前目录下的所有目录和文件全部删除
rm -rf /*    【自杀命令！慎用！慎用！慎用！】将根目录下的所有文件全部删除

注意：rm不仅可以删除目录，也可以删除其他文件或压缩包，为了方便大家的记忆，无论删除任何目录或文件，都直接使用 rm -rf 目录/文件/压缩包

2.3.3 目录修改【改】mv 和 cp
一、重命名目录
    命令：mv 当前目录  新目录
    例如：mv aaa bbb    将目录aaa改为bbb
    注意：mv的语法不仅可以对目录进行重命名而且也可以对各种文件，压缩包等进行    重命名的操作

二、剪切目录
    命令：mv 目录名称 目录的新位置
    示例：将/usr/tmp目录下的aaa目录剪切到 /usr目录下面     mv /usr/tmp/aaa /usr
    注意：mv语法不仅可以对目录进行剪切操作，对文件和压缩包等都可执行剪切操作

三、拷贝目录
    命令：cp -r 目录名称 目录拷贝的目标位置   -r代表递归
    示例：将/usr/tmp目录下的aaa目录复制到 /usr目录下面     cp /usr/tmp/aaa  /usr
    注意：cp命令不仅可以拷贝目录还可以拷贝文件，压缩包等，拷贝文件和压缩包时不    用写-r递归

2.3.4 搜索目录【查】find
命令：find 目录 参数 文件名称
示例：find /usr/tmp -name 'a*'    查找/usr/tmp目录下的所有以a开头的目录或文件

### 3、文件操作命令

3.1 文件操作【增，删，改，查】
3.1.1 新建文件【增】touch
命令：touch 文件名
示例：在当前目录创建一个名为aa.txt的文件        touch  aa.txt

3.1.2 删除文件 【删】 rm
命令：rm -rf 文件名

3.1.3 修改文件【改】 vi或vim
【vi编辑器的3种模式】
    基本上vi可以分为三种状态，分别是命令模式（command mode）、插入模式（Insert mode）和底行模式（last line mode），各模式的功能区分如下：
1) 命令行模式command mode）
      控制屏幕光标的移动，字符、字或行的删除，查找，移动复制某区段及进入Insert mode下，或者到 last line mode。
      命令行模式下的常用命令：
      【1】控制光标移动：↑，↓，j
      【2】删除当前行：dd 
      【3】查找：/字符
      【4】进入编辑模式：i o a
      【5】进入底行模式：:
      
2) 编辑模式（Insert mode）
      只有在Insert mode下，才可以做文字输入，按「ESC」键可回到命令行模式。
      编辑模式下常用命令：
      【1】ESC 退出编辑模式到命令行模式；
      
3) 底行模式（last line mode）
     将文件保存或退出vi，也可以设置编辑环境，如寻找字符串、列出行号……等。
     底行模式下常用命令：
     【1】退出编辑：   :q
     【2】强制退出：   :q!
     【3】保存并退出：  :wq

打开文件

命令：vi 文件名
示例：打开当前目录下的aa.txt文件     vi aa.txt 或者 vim aa.txt

注意：使用vi编辑器打开文件后，并不能编辑，因为此时处于命令模式，点击键盘i/a/o进入编辑模式。

编辑文件

使用vi编辑器打开文件后点击按键：i ，a或者o即可进入编辑模式。

i:在光标所在字符前开始插入
a:在光标所在字符后开始插入
o:在光标所在行的下面另起一新行插入

保存或者取消编辑

保存文件：

第一步：ESC  进入命令行模式
第二步：:     进入底行模式
第三步：wq     保存并退出编辑

取消编辑：

第一步：ESC  进入命令行模式
第二步：:     进入底行模式
第三步：q!     撤销本次修改并退出编辑

3.1.4 文件的查看【查】
文件的查看命令：cat/more/less/tail

cat：看最后一屏

示例：使用cat查看/etc/sudo.conf文件，只能显示最后一屏内容
cat sudo.conf

more：百分比显示

示例：使用more查看/etc/sudo.conf文件，可以显示百分比，回车可以向下一行，空格可以向下一页，q可以退出查看
more sudo.conf

less：翻页查看

示例：使用less查看/etc/sudo.conf文件，可以使用键盘上的PgUp和PgDn向上    和向下翻页，q结束查看
less sudo.conf

tail：指定行数或者动态查看

示例：使用tail -10 查看/etc/sudo.conf文件的后10行，Ctrl+C结束  
tail -10 sudo.conf

3.2 权限修改
rwx：r代表可读，w代表可写，x代表该文件是一个可执行文件，如果rwx任意位置变为-则代表不可读或不可写或不可执行文件。

示例：给aaa.txt文件权限改为可执行文件权限，aaa.txt文件的权限是-rw-------

第一位：-就代表是文件，d代表是文件夹
第一段（3位）：代表拥有者的权限
第二段（3位）：代表拥有者所在的组，组员的权限
第三段（最后3位）：代表的是其他用户的权限

   421  421  421

-  rw-   ---     ---

命令：chmod +x aaa.txt
或者采用8421法
命令：chmod 100 aaa.txt

### 4、压缩文件操作

4.1 打包和压缩
Windows的压缩文件的扩展名  .zip/.rar
linux中的打包文件：aa.tar      
linux中的压缩文件：bb.gz    
linux中打包并压缩的文件：.tar.gz

Linux中的打包文件一般是以.tar结尾的，压缩的命令一般是以.gz结尾的。
而一般情况下打包和压缩是一起进行的，打包并压缩后的文件的后缀名一般.tar.gz。

命令：tar -zcvf 打包压缩后的文件名 要打包的文件
其中：z：调用gzip压缩命令进行压缩
  c：打包文件
  v：显示运行过程
  f：指定文件名

示例：打包并压缩/usr/tmp 下的所有文件 压缩后的压缩包指定名称为xxx.tar
tar -zcvf ab.tar aa.txt bb.txt 
或：tar -zcvf ab.tar  *

4.2 解压
命令：tar [-zxvf] 压缩文件    
其中：x：代表解压
示例：将/usr/tmp 下的ab.tar解压到当前目录下



示例：将/usr/tmp 下的ab.tar解压到根目录/usr下
tar -xvf ab.tar -C /usr------C代表指定解压的位置



### 5、查找命令

5.1 grep
grep命令是一种强大的文本搜索工具

使用实例：

ps -ef | grep sshd  查找指定ssh服务进程 
ps -ef | grep sshd | grep -v grep 查找指定服务进程，排除gerp身 
ps -ef | grep sshd -c 查找指定进程个数 
5.2 find
find命令在目录结构中搜索文件，并对搜索结果执行指定的操作。 

find 默认搜索当前目录及其子目录，并且不过滤任何结果（也就是返回所有文件），将它们全都显示在屏幕上。

使用实例：

find . -name "*.log" -ls  在当前目录查找以.log结尾的文件，并显示详细信息。 
find /root/ -perm 600   查找/root/目录下权限为600的文件 
find . -type f -name "*.log"  查找当目录，以.log结尾的普通文件 
find . -type d | sort   查找当前所有目录并排序 
find . -size +100M  查找当前目录大于100M的文件
5.3 locate
locate 让使用者可以很快速的搜寻某个路径。默认每天自动更新一次，所以使用locate 命令查不到最新变动过的文件。为了避免这种情况，可以在使用locate之前，先使用updatedb命令，手动更新数据库。如果数据库中没有查询的数据，则会报出locate: can not stat () `/var/lib/mlocate/mlocate.db': No such file or directory该错误！updatedb即可！

yum -y install mlocate 如果是精简版CentOS系统需要安装locate命令

使用实例：

updatedb
locate /etc/sh 搜索etc目录下所有以sh开头的文件 
locate pwd 查找和pwd相关的所有文件
5.4 whereis
whereis命令是定位可执行文件、源代码文件、帮助文件在文件系统中的位置。这些文件的属性应属于原始代码，二进制文件，或是帮助文件。

使用实例：

whereis ls    将和ls文件相关的文件都查找出来
5.5 which
which命令的作用是在PATH变量指定的路径中，搜索某个系统命令的位置，并且返回第一个搜索结果。

使用实例：

which pwd  查找pwd命令所在路径 
which java  查找path中java的路径 

### 6、su、sudo

6.1 su
su用于用户之间的切换。但是切换前的用户依然保持登录状态。如果是root 向普通或虚拟用户切换不需要密码，反之普通用户切换到其它任何用户都需要密码验证。

su test:切换到test用户，但是路径还是/root目录
su - test : 切换到test用户，路径变成了/home/test
su : 切换到root用户，但是路径还是原来的路径
su - : 切换到root用户，并且路径是/root
su不足：如果某个用户需要使用root权限、则必须要把root密码告诉此用户。

退出返回之前的用户：exit

6.2 sudo
sudo是为所有想使用root权限的普通用户设计的。可以让普通用户具有临时使用root权限的权利。只需输入自己账户的密码即可。

进入sudo配置文件命令：

vi /etc/sudoer或者visudo
案例：
允许hadoop用户以root身份执行各种应用命令，需要输入hadoop用户的密码。
hadoop  ALL=(ALL)   ALL 

案例：
只允许hadoop用户以root身份执行ls 、cat命令，并且执行时候免输入密码。 
配置文件中： 
hadoop  ALL=NOPASSWD:  /bin/ls, /bin/cat 

### 7、系统服务

service iptables status  --查看iptables服务的状态
service iptables start  --开启iptables服务
service iptables stop  --停止iptables服务
service iptables restart  --重启iptables服务

chkconfig iptables off  --关闭iptables服务的开机自启动
chkconfig iptables on  --开启iptables服务的开机自启动

### 8、网络管理

8.1 主机名配置
[root@node1 ~]# vi /etc/sysconfig/network
NETWORKING=yes
HOSTNAME=node1
8.2 IP 地址配置
[root@node1 ~]# vi /etc/sysconfig/network-scripts/ifcfg-eth0
8.3 域名映射
/etc/hosts文件用于在通过主机名进行访问时做ip地址解析之用。所以，你想访问一个什么样的主机名，就需要把这个主机名和它对应的ip地址。

[root@node1 ~]# vi /etc/hosts

在最后加上

192.168.52.201  node1
192.168.52.202  node2
192.168.52.203  node3

### 9、定时任务指令crontab 配置

crontab是Unix和Linux用于设置定时任务的指令。通过crontab命令，可以在固定间隔时间,执行指定的系统指令或shell脚本。时间间隔的单位可以是分钟、小时、日、月、周及以上的任意组合。

crontab安装：

yum install crontabs
服务操作说明：

service crond start   ## 启动服务 
service crond stop    ## 关闭服务 
service crond restart ## 重启服务
9.1 命令格式
crontab [-u user] file

crontab [-u user] [ -e | -l | -r ]

参数说明：

-u user：用来设定某个用户的crontab服务  

file：file是命令文件的名字,表示将file做为crontab的任务列表文件

并载入crontab。

-e：编辑某个用户的crontab文件内容。如果不指定用户，则表示编辑当前

用户的crontab文件。

-l：显示某个用户的crontab文件内容。如果不指定用户，则表示显示当前

用户的crontab文件内容。

-r：删除定时任务配置，从/var/spool/cron目录中删除某个用户的crontab

文件，如果不指定用户，则默认删除当前用户的crontab文件。

命令示例：

crontab file [-u user] ## 用指定的文件替代目前的crontab
crontab -l [-u user]  ## 列出用户目前的crontab
crontab -e [-u user]  ## 编辑用户目前的crontab
9.2 配置说明、实例
命令：*   *    *   *   *   command  

解释：分  时  日  月  周  命令

第1列表示分钟1～59 每分钟用*或者 */1表示    

第2列表示小时0～23（0表示0点）

第3列表示日期1～31  

第4列表示月份1～12  

第5列标识号星期0～6（0表示星期天）  

第6列要运行的命令

配置实例：

先打开定时任务所在的文件：
crontab -e

每分钟执行一次date命令 
*/1 * * * * date >> /root/date.txt

每晚的21:30重启apache。 
30 21 * * * service httpd restart

每月1、10、22日的4 : 45重启apache。  
45 4 1,10,22 * * service httpd restart

每周六、周日的1 : 10重启apache。 
10 1 * * 6,0 service httpd restart

每天18 : 00至23 : 00之间每隔30分钟重启apache。
0,30   18-23    *   *   *   service httpd restart
晚上11点到早上7点之间，每隔一小时重启apache

*  23-7/1    *   *   *   service httpd restart

### 10、其他命令

10.1 查看当前目录：pwd
命令：pwd     查看当前目录路径

10.2 查看进程：ps -ef
命令：ps -ef    查看所有正在运行的进程

10.3 结束进程：kill
命令：kill pid 或者 kill -9 pid(强制杀死进程)           pid:进程号

10.4 网络通信命令：
ifconfig：查看网卡信息

命令：ifconfig 或 ifconfig | more

ping：查看与某台机器的连接情况

命令：ping ip

netstat -an：查看当前系统端口

命令：netstat -an

搜索指定端口
命令：netstat -an | grep 8080

10.5 配置网络
命令：setup

10.6 重启网络
命令：service network restart

10.7 切换用户
命令：su - 用户名

10.8 关闭防火墙
命令：chkconfig iptables off

或者：

 iptables -L;
 iptables -F;
 service iptables stop
10.9 修改文件权限
命令：chmod 777

10.10 清屏
命令：ctrl + l

10.11 vi模式下快捷键
esc后:

保存并退出快捷键：shift+z+z

光标跳到最后一行快捷键：shift+g

删除一行：dd

复制一行内容：y+y

粘贴复制的内容：p

## 二、Linux基本配置

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

## 三、Shell脚本

### 1、选择解释器

在shell脚本中，#表示注释，而#! 表示引用，用来定义使用哪种sh解释器来解释脚本，一般文件第一行都需要输入下面的内容。

```sh
#!bin/bash
```

**这里解释一下#!bin/bash和#!/bin/sh的区别：**

#!/bin/sh就相当于#!/bin/bash--posix，posix相当于一种规范，具体可以百度

### 2、数据类型

shell脚本中只有三种数据类型：

- 字符串：<a href='#shell-string'>详解</a>
- 整型：<a href='#shell-integer'>详解</a>
- 数组：<a href='#shell-array'>详解</a>

### 3、变量

**定义变量：**

常规的定义变量的三种方式

```sh
variable=value
variable='value'
variable="value"
```

解释：

- 因为shell脚本的特殊性，用常规方法定义的变量都是**字符串**，整型和数组在后面会有解释

- variable 是变量名，value 是赋给变量的值

- 如果value中间含有空格，则必须用引号包裹住

- “＝”号左右**不能有空格**，shell对空格这一块比其他语言严格，需要注意

- 变量名必须以字母或者下划线开头，由数字、字母、下划线组成，不能使用 Shell 里的关键字

- 单引号和双引号的区别：单引号里面的内容全部看做写死的字符串，而双引号会解析内部的变量

  ```sh
  name="zhangsan"
  value1='姓名：${name}'
  value2="姓名：${name}"
  echo $value1 # 结果为：姓名：${name}
  echo $value2 # 结果为：姓名：zhangsan
  ```

**使用变量：**

常规使用变量的两种方法

```sh
echo $author
echo ${author}
```

解释：

- {}可以加可以不加，主要是为了区分边界，建议**全加上**，不加的点外卖没有餐具
- 字符串拼接变量在字符串那边详解

**修改变量：**

直接修改即可，赋值时不需要$

```sh
url="123"
echo ${url}
url="456"
echo ${url}
```

### 4、替换

将某条语句执行结果放到某个变量中，有两种方式可以完成命令替换，一种是反引号`` ``，一种是$()

```sh
variable=`commands`
variable=$(commands)
```

解释：

- 建议都用$()，不用的斗地主3456没有7
- 经典用法比如说time=$(date)，result=$(curl url)，都需要用替换来进行，直接time=date，会被当做赋值

### 5、特殊变量

shell脚本有几种传参的方式，下面慢慢讲

| 变量      | 含义                                                         |
| --------- | ------------------------------------------------------------ |
| $0        | 当前脚本的文件名。                                           |
| $n（n≥1） | 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是 $1，第二个参数是 $2。 |
| $#        | 传递给脚本或函数的参数个数。                                 |
| $*        | 传递给脚本或函数的所有参数。                                 |
| $@        | 传递给脚本或函数的所有参数。当被双引号`" "`包含时，$@ 与 $* 稍有不同 |
| $?        | 上个命令的退出状态，或函数的返回值                           |
| $$        | 当前 Shell 进程 ID。对于 Shell 脚本，就是这些脚本所在的进程 ID。 |

- $0：文件名

  ```sh
  #假设文件名交test.sh，它就输出test.sh
  echo ${0}
  ```

- $n：参数位置

  按照位置进行传参

  ```sh
  echo ${1}
  echo ${2}
  ```

  假设文件名是test.sh，输入命令

  ```shell
  sh test.sh 123 456
  123
  456
  ```

  注意的点：

  - 执行shell脚本时，参数之间用空格区分
  - 如果参数带有空格，请用""进行包裹
  - 对于参数中间有引号的，如json数据这种，用''拼接，但是不建议传这种复杂参数，很烦。。。
  - 不能自定义参数名字，通过key->value的方法进行传值

- $#：参数个数

- $*：所有参数

  在使用$*时，如果加上了""，会把所有参数当做一个字符串，简而言之不能循环

- $@：所有参数

  在使用$@时，如果加上了""，会把每一个参数都当做一个单独的字符串，可以通过循环的方式遍历，相当于自己是一个数组

- $?

  有两种用法：

  - 获取命令的退出状态

    在执行任意一个命令后，都可以使用$?获取上一条命令的退出状态，如下

    ```shell
    [mozhiyan@localhost demo]$ bash ./test.sh 100  
    [mozhiyan@localhost demo]$ echo $?
    0
    ```

  - 获取函数的返回值

    ```sh
    #!/bin/bash
    #得到两个数相加的和
    function add(){
        return `expr $1 + $2`
    }
    add 23 50  #调用函数
    echo $?  #获取函数返回值
    ```

- $$：获取当前脚本的进程id

### 6、<span id='shell-string'>字符串</span>

在变量中写过，常规的三种赋值方法，三种的区别也在变量中讲过，所以这里直接讲一下字符串的使用规则和一些方法

```sh
variable=value
variable='value'
variable="value"
```

**字符串拼接：**

因为字符串的定义方式和引用方式有些随意，拼接起来特别容易出现各种各样的问题，需要注意一下

```sh
#!/bin/bash
name="Shell"
url="http://c.biancheng.net/shell/"
str1=$name$url  #中间不能有空格
str2="$name $url"  #如果被双引号包围，那么中间可以有空格
str3=$name": "$url  #中间可以出现别的字符串
str4="$name: $url"  #这样写也可以
str5="${name}Script: ${url}index.html"  #这个时候需要给变量名加上大括号
```

关于引号嵌套的问题：

需要灵活运用单引号进行定义，假设数据为一串json数据

```sh
json='{
	"name":"zhangsan",
	"age":"23",
}'
echo "${json}"
```

类似的情况就需要灵活运用单引号，双引号和{}

**字符串长度：**

在变量前面加上#号，然后用{}包裹起来

```sh
${#string_name}
```

**字符串截取：**

一共有8中方法，主要对后面四个稍微进行举例讲解

| 格式                       | 说明                                                         |
| -------------------------- | ------------------------------------------------------------ |
| ${string: start :length}   | 从 string 字符串的左边第 start 个字符开始，向右截取 length 个字符。 |
| ${string: start}           | 从 string 字符串的左边第 start 个字符开始截取，直到最后。    |
| ${string: 0-start :length} | 从 string 字符串的右边第 start 个字符开始，向右截取 length 个字符。 |
| ${string: 0-start}         | 从 string 字符串的右边第 start 个字符开始截取，直到最后。    |
| ${string#*chars}           | 从 string 字符串第一次出现 chars 的位置开始，截取 chars 右边的所有字符。 |
| ${string##*chars}          | 从 string 字符串最后一次出现 chars 的位置开始，截取 chars 右边的所有字符。 |
| ${string%chars*}           | 从 string 字符串第一次出现 chars 的位置开始，截取 chars 左边的所有字符。 |
| ${string%%chars*}          | 从 string 字符串最后一次出现 chars 的位置开始，截取 chars 左边的所有字符。 |

- 对于chars，都不包括自身
- *是通配符的一种，表示任意长度的字符串

### 7、<span id='shell-integer'>整型</span>

因为shell脚本默认定义字符串，所以定义整型需要用declare -i

```sh
declare -i num=3
```

- 其实很多时候不需要这样进行赋值，强行定义成整型主要是对数字运算更为方便，但其实我们很多时候用特点的方法进行运算，这个放到后面去说明
- 整型变量不允许被赋值为字符串，如果整型数被赋值为字符或不带空格的字符串时，系统不会报错，并且整型变量实际被赋值为0
- 整型数被赋值为带空格的字符串时，系统将报错

### 8、<span id='shell-array'>数组</span>

**定义：**

常规定义数组的方法，把数组用（）包裹起来，用空格进行分割

```sh
array_name=(ele1 ele2 ele3 elen)
```

shell中的数组是弱类型，可以随意放字符串和整型，但是只支持一维数组

```sh
arr=(20 56 "123")
```

shell中的数组定义方式比较随意，长度也不做限制，可以在任意index下加入数据，如下数组的长度只有3，且只有该下标下才有，ages[0]下实际是空的

```sh
ages=([3]=24 [5]=19 [10]=12)
```

**使用：**

和大部分语言一样，用arr[index]即可

```sh
${array_name[index]}
```

两种特殊的取出方法，可以获取全部的数据，*取出来的值被当做一整个字符串，而@取出来的值可以循环

```sh
${nums[*]}
${nums[@]}
```

**数组的长度：**

需要用到上面的两种取值方法，并且在参数名前面加上#，这里是针对数组的特殊用法，和取字符串长度很像${#string_name}

```sh
${#array_name[@]}
${#array_name[*]}
```

**数组拼接：**

直接往里面拼就行，可以直接写变量，可以直接写值，注意中间的空格不能少

```sh
array_new=(${array1[*]}  ${array2[*]})
array_new=(${array_new[*]}  1)
```

**删除数组：**

unset 关键字

```sh
unset array_name[index] #删除下标中的元素
unset array_name #删除整个数组
```

### 9、关联数组

关联数组和普通数组的各种方法都是一样的，唯一的区别是，他类似一个map，下标为自定的字符串，通过key->value组合的数据结构

```sh
#定义declare -A来定义
declare -A color=(["red"]="#ff0000", ["green"]="#00ff00", ["blue"]="#0000ff")
```

### 10、内建命令（重要）

内建命令就是Linux本身的命令，而不是由外部文件执行的命令，**内建命令可以在shell脚本中直接编写**，并且是关键字不允许被当做变量名定义

比如cd是切换目录，ipconfig是查看ip，但是前者是内建命令，后者则是一个可执行文件，可以用**type**命令来判断是否为内建命令

```shell
[root@localhost ~]# type cd
cd is a Shell builtin
[root@localhost ~]# type ifconfig
ifconfig is /sbin/ifconfig
```

列出大部分的内建命令

| 命令      | 说明                                                  |
| --------- | ----------------------------------------------------- |
| :         | 扩展参数列表，执行重定向操作                          |
| .         | 读取并执行指定文件中的命令（在当前 shell 环境中）     |
| alias     | 为指定命令定义一个别名，比如alias ll='ls -l           |
| bg        | 将作业以后台模式运行                                  |
| bind      | 将键盘序列绑定到一个 readline 函数或宏                |
| break     | 退出 for、while、select 或 until 循环                 |
| builtin   | 执行指定的 shell 内建命令                             |
| caller    | 返回活动子函数调用的上下文                            |
| cd        | 将当前目录切换为指定的目录                            |
| command   | 执行指定的命令，无需进行通常的 shell 查找             |
| compgen   | 为指定单词生成可能的补全匹配                          |
| complete  | 显示指定的单词是如何补全的                            |
| compopt   | 修改指定单词的补全选项                                |
| continue  | 继续执行 for、while、select 或 until 循环的下一次迭代 |
| declare   | 声明一个变量或变量类型。                              |
| dirs      | 显示当前存储目录的列表                                |
| disown    | 从进程作业表中刪除指定的作业                          |
| echo      | 将指定字符串输出到 STDOUT                             |
| enable    | 启用或禁用指定的内建shell命令                         |
| eval      | 将指定的参数拼接成一个命令，然后执行该命令            |
| exec      | 用指定命令替换 shell 进程                             |
| exit      | 强制 shell 以指定的退出状态码退出                     |
| export    | 设置子 shell 进程可用的变量                           |
| fc        | 从历史记录中选择命令列表                              |
| fg        | 将作业以前台模式运行                                  |
| getopts   | 分析指定的位置参数                                    |
| hash      | 查找并记住指定命令的全路径名                          |
| help      | 显示帮助文件                                          |
| history   | 显示命令历史记录                                      |
| jobs      | 列出活动作业                                          |
| kill      | 向指定的进程 ID(PID) 发送一个系统信号                 |
| let       | 计算一个数学表达式中的每个参数                        |
| local     | 在函数中创建一个作用域受限的变量                      |
| logout    | 退出登录 shell                                        |
| mapfile   | 从 STDIN 读取数据行，并将其加入索引数组               |
| popd      | 从目录栈中删除记录                                    |
| printf    | 使用格式化字符串显示文本                              |
| pushd     | 向目录栈添加一个目录                                  |
| pwd       | 显示当前工作目录的路径名                              |
| read      | 从 STDIN 读取一行数据并将其赋给一个变量               |
| readarray | 从 STDIN 读取数据行并将其放入索引数组                 |
| readonly  | 从 STDIN 读取一行数据并将其赋给一个不可修改的变量     |
| return    | 强制函数以某个值退出，这个值可以被调用脚本提取        |
| set       | 设置并显示环境变量的值和 shell 属性                   |
| shift     | 将位置参数依次向下降一个位置                          |
| shopt     | 打开/关闭控制 shell 可选行为的变量值                  |
| source    | 读取并执行指定文件中的命令（在当前 shell 环境中）     |
| suspend   | 暂停 Shell 的执行，直到收到一个 SIGCONT 信号          |
| test      | 基于指定条件返回退出状态码 0 或 1                     |
| times     | 显示累计的用户和系统时间                              |
| trap      | 如果收到了指定的系统信号，执行指定的命令              |
| type      | 显示指定的单词如果作为命令将会如何被解释              |
| typeset   | 声明一个变量或变量类型。                              |
| ulimit    | 为系统用户设置指定的资源的上限                        |
| umask     | 为新建的文件和目录设置默认权限                        |
| unalias   | 刪除指定的别名                                        |
| unset     | 刪除指定的环境变量或 shell 属性                       |
| wait      | 等待指定的进程完成，并返回退出状态码                  |

#### 10.1 echo

输出语句到控制台上

- echo 命令输出结束后默认会换行，如果不希望换行，可以加上`-n`参数
- echo 不会解析以反斜杠`\`开头的转义字符。比如，`\n`表示换行，echo 默认会将它作为普通字符对待，可以添加-e让转义符生效

#### 10.2 read

read命令的核心是读取，可以读取用户在控制台输入的值，也可以读取文件中的值，这里主要先讲读取控制台输入

基本用法：

```sh
read [-options] [variables] >
```

这里面的'>'符号，可以理解成c++中 cin>> ，意思就是输入，至于options和variables如下表

| 选项options  | 说明variables                                                |
| ------------ | ------------------------------------------------------------ |
| -a array     | 把读取的数据赋值给数组 array，从下标 0 开始。                |
| -d delimiter | 用字符串 delimiter 指定读取结束的位置，而不是一个换行符（读取到的数据不包括 delimiter）。 |
| -e           | 在获取用户输入的时候，对功能键进行编码转换，不会直接显式功能键对应的字符。 |
| -n num       | 读取 num 个字符，而不是整行字符，num达到立即读取结束，不用等待用户按下回车键 |
| -p prompt    | 显示提示信息，提示内容为 prompt。                            |
| -r           | 原样读取（Raw mode），不把反斜杠字符解释为转义字符。         |
| -s           | 静默模式（Silent mode），不会在屏幕上显示输入的字符。当输入密码和其它确认信息的时候，这是很有必要的。 |
| -t seconds   | 设置超时时间，单位为秒。如果用户没有在指定时间内输入完成，那么 read 将会返回一个非 0 的退出状态，表示读取失败。 |
| -u fd        | 使用文件描述符 fd 作为输入源，而不是标准输入，类似于重定向。 |

#### 10.3 exit

exit 命令可以接受一个范围在0~255的整数值作为参数，代表退出状态。如果不指定，默认状态值是 0，一般情况下，退出状态为 0 表示成功，退出状态为非 0 表示执行失败（出错）了。

#### 10.4 declare

定义变量的类型等

```sh
declare [+/-] [aAfFgilprtux] [变量名=变量值]
```

| 选项            | 含义                                                       |
| --------------- | ---------------------------------------------------------- |
| -f [name]       | 列出之前由用户在脚本中定义的函数名称和函数体。             |
| -F [name]       | 仅列出自定义函数名称。                                     |
| -g name         | 在 Shell 函数内部创建全局变量。                            |
| -p [name]       | 显示指定变量的属性和值。                                   |
| -a name         | 声明变量为普通数组。                                       |
| -A name         | 声明变量为关联数组（支持索引下标为字符串）。               |
| -i name         | 将变量定义为整数型。                                       |
| -r name[=value] | 将变量定义为只读（不可修改和删除），等价于 readonly name。 |
| -x name[=value] | 将变量设置为环境变量，等价于 export name[=value]。         |

### 11、运算

shell脚本中不能直接对数据进行运算，因为默认定义的数据都是字符串，除非定义时用declare指定整型可以直接运算，不过一般还是用命令进行计算，这样代码可读性强，不需要翻到上面去看变量是不是整型

常见运算符

| 算术运算符            | 说明/含义                                                |
| --------------------- | -------------------------------------------------------- |
| +、-                  | 加法（或正号）、减法（或负号）                           |
| *、/、%               | 乘法、除法、取余（取模）                                 |
| **                    | 幂运算                                                   |
| ++、--                | 自增和自减，可以放在变量的前面也可以放在变量的后面       |
| !、&&、\|\|           | 逻辑非（取反）、逻辑与（and）、逻辑或（or）              |
| <、<=、>、>=          | 比较符号（小于、小于等于、大于、大于等于）               |
| ==、!=、=             | 比较符号（相等、不相等；对于字符串，= 也可以表示相当于） |
| <<、>>                | 向左移位、向右移位                                       |
| ~、\|、 &、^          | 按位取反、按位或、按位与、按位异或                       |
| =、+=、-=、*=、/=、%= | 赋值运算符，例如 a+=1 相当于 a=a+1，a-=1 相当于 a=a-1    |

常见运算命令

| 运算操作符/运算命令 | 说明                                                         |
| ------------------- | ------------------------------------------------------------ |
| (( ))               | 用于整数运算，效率很高，**推荐使用**。                       |
| let                 | 用于整数运算，和 (()) 类似。                                 |
| $[]                 | 用于整数运算，不如 (()) 灵活。                               |
| expr                | 可用于整数运算，也可以处理字符串。比较麻烦，需要注意各种细节，不推荐使用。 |
| bc                  | Linux下的一个计算器程序，可以处理整数和小数。Shell 本身只支持整数运算，想计算小数就得使用 bc 这个外部的计算器。 |
| declare -i          | 将变量定义为整数，然后再进行数学运算时就不会被当做字符串了。功能有限，仅支持最基本的数学运算（加减乘除和取余），不支持逻辑运算、自增自减等，所以在实际开发中很少使用。不建议使用 |

#### 11.1 (( ))

可以进行整数或逻辑运算

```sh
((表达式))
```

- 使用`$`获取 (( )) 命令的结果
- (( )) 中的变量不需要加上$
- 可以对多个表达式同时进行计算，((a=3+5, b=a+10))，按顺序执行，且变量值会保留，通过$a取
- 如果用$获取多个表达式结果，则只会拿到最后一个表达式的结果，c=$((a=3+5, b=a+10))=18
- 可以进行逻辑运算((a>7))，true为1，false为0

#### 11.2 bc

可以进行小数或逻辑运算，不会，开摆，用到再百度

### 12、逻辑判断

Shell脚本中的判断方法有很多，后续if、while等语句中的condition 就是逻辑表达式，有很多种方法，而且每一种方法有些不同，不能乱用，所以在这里总结一下

**前提：**

- 正常的&&和||符号和大部分语言是一致的
- Shell都不支持'>='和'<='的运算，如需使用，请单独写=和>/<然后用或运算符连接

**使用(())进行运算：**

- (())的特点是效率高，一般只用在数据判断中，也就是整型或小数的数据，也只能用于整型或小数的判断

**使用[]或test进行运算:**

前提：

- []就是test，这两个是一模一样的，区别是在语法规则上有些不同，test写在最前，[]需要将表达式包裹起来

- []和test中间的全部表达式，中间都需要有一个**空格**，这个一定不能少

  ```sh
  [ 1 -eq 2 ]
  test 1 -eq 2
  ```

- []和test比(())优势的地方在于可以比较各种类型的数据甚至文件的信息

比较：

- 整数值比较：[ num1 选项 num2 ]

  - test的数值比较中不允许使用'=','==','>','<'等运算符号

  - | 选 项 | 作 用    |
    | ----- | -------- |
    | -eq   | 等于     |
    | -ne   | 不等于   |
    | -gt   | 大于     |
    | -ge   | 大于等于 |
    | -lt   | 小于     |
    | -le   | 小于等于 |

- 字符比较：[ "string字串1" 选项 "string字串2" ]

  - 字符串一定要用双引号包裹起来

  - | 选 项 | 作 用                                                        |
    | ----- | ------------------------------------------------------------ |
    | ==    | 相等                                                         |
    | =     | 相等                                                         |
    | !=    | 不相等                                                       |
    | -z    | 判空                                                         |
    | -n    | 非空                                                         |
    | \\>   | 判断 str1 是否大于 str2。`\>`是`>`的转义字符，防止`>`被误认为成重定向运算符。 |
    | \\<   | 判断 str1 是否小于 str2。同样，`\<`也是转义字符。            |

  - ==和=的区别：

    当两边字符串都为''的时候，使用==会报错，使用=不会，所以建议直接使用'='

  - 关于判空：

    对于字符串的判空，甚至可以直接使用变量取反进行判断

    ```sh
    [ ! $param ]
    ```

- 文件判断

  - 文件类型判断

    | 选 项       | 作 用                                      |
    | ----------- | ------------------------------------------ |
    | -b filename | 判断文件是否存在，并且是否为块设备文件。   |
    | -c filename | 判断文件是否存在，并且是否为字符设备文件。 |
    | -d filename | 判断文件是否存在，并且是否为目录文件。     |
    | -e filename | 判断文件是否存在。                         |
    | -f filename | 判断文件是否存在，井且是否为普通文件。     |
    | -L filename | 判断文件是否存在，并且是否为符号链接文件。 |
    | -p filename | 判断文件是否存在，并且是否为管道文件。     |
    | -s filename | 判断文件是否存在，并且是否为非空。         |
    | -S filename | 判断该文件是否存在，并且是否为套接字文件。 |

  - 文件权限判断

    | 选 项       | 作 用                                        |
    | ----------- | -------------------------------------------- |
    | -r filename | 判断文件是否存在，并且是否拥有读权限。       |
    | -w filename | 判断文件是否存在，并且是否拥有写权限。       |
    | -x filename | 判断文件是否存在，并且是否拥有执行权限。     |
    | -u filename | 判断文件是否存在，并且是否拥有 SUID 权限。   |
    | -g filename | 判断文件是否存在，并且是否拥有 SGID 权限。   |
    | -k filename | 判断该文件是否存在，并且是否拥有 SBIT 权限。 |

  - 文件比较

    | 选 项                   | 作 用                                                        |
    | ----------------------- | ------------------------------------------------------------ |
    | filename1 -nt filename2 | 判断 filename1 的修改时间是否比 filename2 的新。             |
    | filename -ot filename2  | 判断 filename1 的修改时间是否比 filename2 的旧。             |
    | filename1 -ef filename2 | 判断 filename1 是否和 filename2 的 inode 号一致，可以理解为两个文件是否为同一个文件。这个判断用于判断硬链接是很好的方法 |

## 四、执行shell脚本可能遇到的问题

### 1、windows往Linux上复制文件

可能会报错syntax error near unexpected token `$'\r''，需要输入如下代码

```sh
sed -i 's/\r//g' demo.sh
```
