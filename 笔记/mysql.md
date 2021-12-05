## 配置mysql

免安装版本

- ### **8.0及以上**

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

- ### **8.0以下**

1、在安装目录下创建并配置my.ini，创建data空文件夹

ps：这里建议配置的时候将文件编码改成ANSI格式，避免以后增加或进行其他配置时出问题

```ini
[mysql]
# 设置mysql客户端默认字符集
default-character-set=utf8
[mysqld]
#设置3306端口
port = 3306
# 设置mysql的安装目录
basedir=D:/program/environment/MySql/mysql-5.7.19-winx64
# 设置mysql数据库的数据的存放目录
datadir=D:/program/environment/MySql/mysql-5.7.19-winx64/data
# 允许最大连接数
max_connections=200
# 服务端使用的字符集默认为8比特编码的latin1字符集
character-set-server=utf8
# 创建新表时将使用的默认存储引擎
default-storage-engine=INNODB
# 缓存查询
explicit_defaults_for_timestamp=true
```

2、环境变量配置（可配置可不配置）

在环境变量的PATH中增加 “安装路径+/bin”

3、初始化mysql

以管理员身份打开cmd，进入mysql的安装目录

输入命令：mysqld --install;

成功会提示：Service successfully installed

2）初始化mysql：

输入命令：mysqld --initialize --user=root --console

此时会创建data文件夹，并打印日志，找到最后几行root@localhost后有一串字符，这是<span style='color:red'>mysql的初始密码</span>，后面要用到。如果正常打印则初始化成功

3）启动mysql：

输入命令：net start mysql; 

mysql会启动服务，提示mysql服务正在启动，mysql服务启动成功（关闭命令：net stop mysql）

4）进入mysql：

这一步主要是为了修改root的初始配置和<span style='color:red'>密码</span>

输入命令：mysql -u root -p;

进入mysql，提示输入密码，输入之前mysql的初始密码（如果这里忘记初始密码，可以手动删除data文件，然后回到第2步；或在my.ini中[mysqld] 添加skip-grant-tables跳过密码验证）

5）修改密码

set password for root@localhost=password('你的密码');



## mysql的特性等

### 一、事务

1、事务的四个特征（ACID）

- 1、原子性（Atomicity）

原子性是指事务包含的所有操作要么全部成功，要么全部失败回滚，因此事务的操作如果成功就必须要完全应用到数据库，如果操作失败则不能对数据库有任何影响。

- 2、一致性（Consistency）

一致性是指事务必须使数据库从一个一致性状态变换到另一个一致性状态，也就是说一个事务执行之前和执行之后都必须处于一致性状态。举例来说，假设用户A和用户B两者的钱加起来一共是1000，那么不管A和B之间如何转账、转几次账，事务结束后两个用户的钱相加起来应该还得是1000，这就是事务的一致性。

- 3、隔离性（Isolation）

隔离性是当多个用户并发访问数据库时，比如同时操作同一张表时，数据库为每一个用户开启的事务，不能被其他事务的操作所干扰，多个并发事务之间要相互隔离。关于事务的隔离性数据库提供了多种隔离级别，稍后会介绍到。

- 4、持久性（Durability）

持久性是指一个事务一旦被提交了，那么对数据库中的数据的改变就是永久性的，即便是在数据库系统遇到故障的情况下也不会丢失提交事务的操作。例如我们在使用JDBC操作数据库时，在提交事务方法后，提示用户事务操作完成，当我们程序执行完成直到看到提示后，就可以认定事务已经正确提交，即使这时候数据库出现了问题，也必须要将我们的事务完全执行完成。否则的话就会造成我们虽然看到提示事务处理完毕，但是数据库因为故障而没有执行事务的重大错误。这是不允许的。

2、并发问题

- 1、脏读：事务A读取了事务B更新的数据，然后B回滚操作，那么A读取到的数据是脏数据

- 2、不可重复读：事务 A 多次读取同一数据，事务 B 在事务A多次读取的过程中，对数据作了更新并提交，导致事务A多次读取同一数据时，结果 不一致。

- 3、幻读：系统管理员A将数据库中所有学生的成绩从具体分数改为ABCDE等级，但是系统管理员B就在这个时候插入了一条具体分数的记录，当系统管理员A改结束后发现还有一条记录没有改过来，就好像发生了幻觉一样，这就叫幻读。

3、隔离级别

- 读未提交：最低级别，任何情况都无法保证
- 读已提交：可避免脏读的发生。
- 可重复读：可避免脏读、不可重复读的发生。
- 串行化（序列化）：可避免脏读、不可重复读、幻读的发生。

4、乐观锁和悲观锁

- 乐观锁：认为在任何情况下都不会有人修改，更新的时候会判断一下在此期间别人有没有去更新这个数据，适用于多读的情况下，CAS算法
  - CAS算法，有VAB三个值，认为V位置上的原值是A，新值是B，判断是否与原值一样吧
  - ABA现象：如果A被改成了B又被改成了A，CAS算法不知道，为了防止这种情况，每次会带上一个版本号，再对比版本号是否一致
- 悲观锁：认为任何情况下都会有人修改数据，会在拿数据的时候上锁，适用于多写的情况下

### 二、索引

索引就是一种数据结构

创建索引的语句：

create index 索引名 on 表面(列名(长度))

alter table 表名 add index 索引名(列名(长度))

#### 1、常见的数据结构

- 二叉树：左边的数永远比中间的小，右边的数永远比中间大

  存在的问题：让数据按照顺序排列，二叉树会退化成链表，查询效率边为O(n)

- 红黑树：平衡的二叉树，会自定调整高度，当一边过高之后，会自动进行一个左旋或者右旋

  存在的问题：数据量增多以后，树的高度会非常高，查询效率为O(logn)，按顺序存储的情况下下效率增加一倍

- hash表：**一维数组+链表**

  会对key值进行hash运算，根据运算出来的结果去内存中查询，虽然他的查询效率为O(1)，查询速度比B+Tree快得多，但是一般索引不使用b+Tree

  不使用hash数据结构的原因：

  - hash冲突问题，如果存在hash冲突，则需要对链表进行循环查找，此时效率会变低
  - **不支持范围查找**

- b Tree：红黑树存在高度问题，b Tree在一个节点上多分配了部分的空间，横向排列，使得在同一高度的情况下，存储更多的数据

- b+Tree（**Mysql使用的就是B+Tree**）：b Tree的变种，非叶子节点不存储数据，只存储索引（冗余索引：吧当前节点的第一个索引提到父节点上面去），叶子节点间用指针进行连接。

  - 每一个节点都会保持递增顺序

  - 在b+tree中，这里每一个非叶子节点类似 “索引|地址|索引|地址|索引|地址” 这种形式，mysql给每一个节点存放的空间为16kb，然后每一个地址存放的大小为6B，可以算出一个节点有多少索引元素。

  - 叶子节点类似“索引|data 索引|data”，叶子节点中会存放data数据，这个data一般不会超过1kb，所以一个叶子节点大概会存放16个索引元素。且每个叶子节点之间都是双向链表
  - 查找的时候，类似二分法查找，找到最后一个节点
  - mysql 中，非叶子节点一般是直接存在内存中，只有叶子节点才需要进行io操作，所以效率特别高

#### 2、存储类型

- MyISAM：索引文件（MYI）和数据文件（MYD）是分离的（这个一般就叫非聚集索引）

  - MYI中的叶子节点存储的是磁盘地址
  - 查询过程：如果是索引字段，先去MYI文件中找到索引数据所存在的磁盘地址，在去MYD文件中去找按照磁盘地址，定位数据。

  - **不支持事务**

- innoDB：索引文件和数据文件放在一起（idb）（聚集索引）

  - 叶子节点存储的不是磁盘地址，而是直接存储的是数据元素
  - innoDB必须建立主键，推荐使用整型自增的主键，因为整型比大小比uuid快，至于为什么需要自增，需要了解<span style="color:blue">hash索引</span>，如果不是自增，底层在维护B+Tree的时候，可能需要进行大规模的分裂，影响性能。而且整型的占用存储空间小
  - 如果没有建立主键：
    - innodb会自动去表中按列查找没有重复的列，去建立一张索引文件；
    - 如果没有重复列，会自动生成一列数据来建立索引，一般不推荐，不在数据库里面做操作

#### 3、联合索引

按照字段顺序，依次比较字段能否比较大小，能比较就按照当前字段进行排序，不能就继续比较下一个，底层实际上还是一个B+Tree

- 最左前缀法则：

  ​	联合索引查询想要走索引，必须要从最左边的索引字段开始查询



## mysql语法与随手笔记

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

