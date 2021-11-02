### 1、配置mysql

免安装版本

- 8.0及以上

免安装版本，解压到任意目录即可，然后按照以下步骤来

1、配置my.ini

将文件放到mysql的安装目录下

ps：这里建议配置的时候将文件编码改成ANSI格式，避免以后增加或进行其他配置时出问题

```ini
[mysqld]
# mysql的安装位置
basedir ="D:\mysql\mysql-8.0.12-winx64"
# mysql数据的存放目录
datadir ="D:\mysql\mysql-8.0.12-winx64\data"
# mysql的端口号
port=3306
# 服务id，在集群时注意不能重复
server_id =10
# 允许最大连接数
max_connections = 200
# 开启查询缓存
explicit_defaults_for_timestamp = true
# sql模式
sql_mode = NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
### 参数解释
# ONLY_FULL_GROUP_BY
# 对于GROUP BY聚合操作，如果在SELECT中的列，没有在GROUP BY中出现，那么这个SQL是不合法的，因为列不在GROUP BY从句中
# NO_AUTO_VALUE_ON_ZERO
# 该值影响自增长列的插入。默认设置下，插入0或NULL代表生成下一个自增长值。如果用户希望插入的值为0，而该列又是自增长的，那么这个选项就有用了。
# STRICT_TRANS_TABLES
# 在该模式下，如果一个值不能插入到一个事务中，则中断当前的操作，对非事务表不做限制
# NO_ZERO_IN_DATE
# 在严格模式下，不允许日期和月份为零
# NO_ZERO_DATE
# 设置该值，mysql数据库不允许插入零日期，插入零日期会抛出错误而不是警告
# ERROR_FOR_DIVISION_BY_ZERO
# 在insert或update过程中，如果数据被零除，则产生错误而非警告。如果未给出该模式，那么数据被零除时Mysql返回NULL
# NO_AUTO_CREATE_USER
# 禁止GRANT创建密码为空的用户
# NO_ENGINE_SUBSTITUTION
# 如果需要的存储引擎被禁用或未编译，那么抛出错误。不设置此值时，用默认的存储引擎替代，并抛出一个异常
# PIPES_AS_CONCAT
# 将"||"视为字符串的连接操作符而非或运算符，这和Oracle数据库是一样是，也和字符串的拼接函数Concat想类似
# ANSI_QUOTES
# 启用ANSI_QUOTES后，不能用双引号来引用字符串，因为它被解释为识别符

# 设置字符集为utf8
loose-default-character-set = utf8
### 数据库的八种字符集设置
# 主要用来设置客户端使用的字符集。
# character_set_client
# 主要用来设置连接数据库时的字符集，如果程序中没有指明连接数据库使用的字符集类型则按照这个字符集设置。
# character_set_connection
# 主要用来设置默认创建数据库的编码格式，如果在创建数据库时没有设置编码格式，就按照这个格式设置。
# character_set_database
# 文件系统的编码格式，把操作系统上的文件名转化成此字符集，即把 character_set_client转换character_set_filesystem， 默认binary是不做任何转换的。
# character_set_filesystem
# 数据库给客户端返回时使用的编码格式，如果没有指明，使用服务器默认的编码格式。
# character_set_results
# 服务器安装时指定的默认编码格式，这个变量建议由系统自己管理，不要人为定义。
# character_set_server
# 数据库系统使用的编码格式，这个值一直是utf8，不需要设置，它是为存储系统元数据的编码格式。
# character_set_system
# 这个变量是字符集安装的目录。
# character_sets_dir
	
[client]
# 客户端端口和字符集
port=3306
default-character-set=gbk
[mysql]
default-character-set=utf8
```

2、环境变量配置（可配置可不配置）

在环境变量的PATH中增加 “安装路径+/bin”

3、初始化mysql

1）安装mysql：

以管理员身份打开cmd，进入mysql的安装目录

输入命令：mysqld --install;

成功会提示：Service successfully installed

**可能出现的问题：**

- 本人安装的时候弹出了“ 由于找不到vcruntime140_1.dll,无法继续执行代码”提示，这里需要去下载vcruntime140_1.dll文件，放到`C:\Windows\System32`下
- 因为之前有一个5版本的mysql，已经初始化一个服务叫MYSQL，直接运行这个命令可能会提示服务已存在，这个时候需要在按照的时候换个名字，例：mysqld --install mysql8;

2）初始化mysql：

输入命令：mysqld --initialize --user=root --console

此时会创建data文件夹，并打印日志，找到最后几行root@localhost后有一串字符，这是<span style='color:red'>mysql的初始密码</span>，后面要用到。如果正常打印则初始化成功

3）启动mysql：

输入命令：net start mysql; 

mysql会启动服务，提示mysql服务正在启动，mysql服务启动成功（关闭命令：net stop mysql）

4）进入mysql：

这一步主要是为了修改root的初始配置和<span style='color:red'>密码</span>

输入命令：mysql -u root -p;

进入mysql，提示输入密码，输入之前mysql的初始密码（如果这里忘记初始密码，可以手动删除data文件，然后回到第2步）

5）修改密码（此处为8.0，和8以下的版本不一样）

输入命令：alter user 'root'@'localhost' identified by '自己想要的密码';

或：\# mysqladmin -u root -p'Root@12345' password '自己想要的密码'(本人没有试过这个命令)

6）可视化工具连接数据库

注意端口要对应上就行

ps：本人使用sqlyog的时候遇到了连接不上的问题，plugin caching_sha2_password could not be loaded，这个原因是因为加密规则的问题，可以以此执行下面的命令

```
#打开cmd进入mysql
mysql -u root -p 

#修改加密规则 
ALTER USER 'root'@'localhost' IDENTIFIED BY '自己的密码' PASSWORD EXPIRE NEVER; 
#更新一下用户的密码 
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '自己的密码'; 
#刷新权限
FLUSH PRIVILEGES; 
#重置密码，这里可以不需要
alter user 'root'@'localhost' identified by '自己的密码';
```

### 2、mysql语法与随手笔记

1、特殊的insert用法：插入其他表中一样的数据

```mysql
insert into table(字段1，字段2)
select 字段1,字段2
from table
```

2、按照map进行更新

1）mysql语法：

```mysql
update table
set 字段1=值
where (
	(字段2 = 'key1' and 字段3 in ('value11','value12')) or
    (字段2 = 'key2' and 字段3 in ('value21','value22'))
)	
```

2）mybtais语法:

```xml
update table
set 字段1=值
where
<foreach collection='map' index='key' item='value' open='(' close=')' separator='or' >
	(字段1 = #{key} and 字段2 in
    	<foreach collection='value' item='值' open='(' close=')' separator=','>	
    		#{值}
    	</foreach>
    )
</foreach>
```

