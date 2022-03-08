# 一、安装配置PHP环境

# 二、语法

## 1、php脚本

php脚本以**\<?php**开始，以 **?>**结束

```php
<?php
//操作
?>
```

php有两种输出指令

- echo
- print

## 2、变量

（1）规则：

- 变量以 $ 符号开始，后面跟着变量的名称
- 变量名必须以字母或者下划线字符开始
- 变量名只能包含字母、数字以及下划线（A-z、0-9 和 _ ）
- 变量名不能包含空格
- 变量名是区分大小写的（$y 和 $Y 是两个不同的变量）

（2）作用域：

4种作用域：

- local：局部，默认即为local

  ```php
  <?php
  function test(){
  	$a = 15
  }
  ?>
  ```

- global：全局

  ```php
  <?php
  $x=5
  $y=10
  function test(){
  	global $x,$y
  }
  ?>
  ```

  php中并不是在定义时使用global关键字定义全局变量，而是在使用时加上global代表取得是全局的变量

  php还会把global变量放到**$GLOBALS[变量名]**的数组中，同样可以直接取

- static：静态

  ```php
  <?php
  function test() {
      static $x=0;
      echo $x . " ";
      $x++;
  }
  
  test();
  test();
  test();
  test();
  //结果：0 1 2 3
  ?>
  ```

  static变量只会在第一次初始化的时候赋值，后面则不会重新赋值，而是直接取静态作用域中的参数

- parameter：函数参数作用域

## 3、数据类型

（1）String(字符串)

（2）Integer(整型)

（3）Float(浮点型)

（4）Boolean(布尔)

（5）Array(数组)

（6）Object(对象)

（7）NULL(空)

## 4、常量

使用define进行定义

```php
define ( string $name , mixed $value [, bool $case_insensitive = false ] )
```

- name：参数名
- value： 参数值
- $case_insensitive：大小写是否敏感，默认大小写敏感，为false

## 5、String

描述：

函数：

（1）strlen：

描述：获取字符串长度

语法：

```php
strlen(string)
```

注意点：

- 中文要使用mb_strlen()方法

（2）strpos：

描述：查询指定字符串开始的下标位置

语法：

```php
strpos(string,find,start)
```

- string：被搜索的字符串
- find：被查询的字符
- start：开始的位置

注意点：

- 如果没有找到会返回false

  

# 三、java转php速通(论三天学会php)

| 描述                                                 | JAVA                    | PHP                                                          |
| ---------------------------------------------------- | ----------------------- | ------------------------------------------------------------ |
| 调用，java用‘.’，php使用‘->’                         | user.getName()          | user->getName()                                              |
| 拼接字符串                                           | "hello"+"java"          | "hello"."php"                                                |
| 字符串长度                                           | "str".length            | strlen("str")                                                |
| 拿到字符串第一次出现的位置，在php中不存在返回false   | "str".indexOf("s")      | strpos("str","s")                                            |
| 拿到字符串最后一次出现的位置，在php中不存在返回false | "str".lastIndexOf("s")  | strrpos("str","s")                                           |
| 判断字符串是否存在于另一个字符串                     | “str”.contains("s")     | 没有，一般用strstr(),或者上面的两个方法判断                  |
| 判断非空，php中不为null返回true                      | isNotBlack()            | isset(obj)                                                   |
| 销毁属性                                             | 没有，一般set为null     | unset("参数名")                                              |
| 判空                                                 | isBlack()               | empty(obj)；与!isset($var) \|\| $var==false等价。“”、0、0.0、“0”、null、false、array()、声明了没有赋值的变量 |
| 打印                                                 | System.out.println("")  | a()、var_dump()、printf()                                    |
| 终止                                                 | exit()                  | die()                                                        |
| 获取数组长度                                         | list.size()或arr.length | count($arr)                                                  |
| 数组中是否存在某个值                                 | contains("")            | in_array("值","数组")                                        |
| 数组中是否存在某个key，php中的数组相当于java中的map  | map.containsKey("")     | array_key_exists("key值","数组")                             |
| 添加值到数组中                                       | list.add("值")          | array_push("数组","值")或arr[] = item，建议用第二种，效率高  |

- 数组字符串互相转换
  - 字符串转数组：explode($param,$arr)
  - 数组转字符串：implode($param,$arr)