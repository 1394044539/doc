# javaSE

## 一、基础语法

#### **1、jdk、jre和jam**

- jdk是面向开发人员使用的SDK（软件开发工具包），里面有很多的基础jar包；
- JRE是Java Runtime Enviroment是指Java的运行环境，是面向Java程序的使用者，必须要有jre才可以运行jar程序；
- jvm是java虚拟机，内容特别多，需要单独引申，初步理解java就是在jvm上进行运行，.class就是在jvm上运行的文件；此外就是jvm的垃圾回收机制，GC，java创建的对象会储存在内存中，当达到内存达到一定值时jvm就会进行gc，垃圾回收，释放掉多余的内存。

#### 2、基本数据类型

java有8中基本数据类型：byte，short，int，long，float，double，boolean，char

- 整数：byte（1字节）、short（短整型，2字节）、int（基本整型，4字节）、long（长整型，8字节）
- 小数：float（单精度，4字节）、double（双精度，8字节）
- 布尔：boolean（1bit）
- 字符：char（2字节,每个字符都对应着Unicode字符集中的值，该字符可以参与算术运算，使用它的unicode值）

## 二、面对对象

#### 1、面对对象的特征：

- 封装：把属性私有化封装到类中去，只通过方法去访问
- 继承：子继承父类
- 抽象：抽象类
- 多态：多态分操作符的多态和类的多态。 类的多态指父类引用指向子类对象，并且有继承，有重写。

#### 2、访问修饰符

​	访问修饰符共有4个，依次为public、protected、缺省（默认) 、private,这些访问修饰符可以用来修饰变量/常量、方法、类

- public：public修饰的成员(变量/常量，方法，**类**）可以被当前项目中任何包下的任何类访问
- protected:protected修饰的成员(变量/常量，方法），只能被同一个包下的任何类 或者 其他包下该类的子类 访问
- 缺省（默认):默认修饰符修饰的成员(变量/常量，方法，**类**），只能被当前包下的任何类访问
- private:private修饰的成员(变量/常量，方法），只能在当前类中被访问

|           | 当前类 | 同一包下的其他类 | 其他包下的其他类 | 其他包下的子类 |
| --------- | ------ | ---------------- | ---------------- | -------------- |
| public    | √      | √                | √                | √              |
| protected | √      | √                | ×                | √              |
| 缺省/默认 | √      | √                | ×                | ×              |
| private   | √      | ×                | ×                | ×              |

#### 3、继承

接口：

- 接口使用interface关键字定义，变量的访问修饰符为public static final，方法为public abstract（jdk1.8以前）

- jdk1.8以后：

  （1）、默认方法（default method）：JDK 1.8允许给接口添加非抽象的方法实现，但必须使用default关键字修饰；定义了default的方法可以不被实现子类所实现，但只能被实现子类的对象调用；如果子类实现了多个接口，并且这些接口包含一样的默认方法，则子类必须重写默认方法；

  （2）、静态方法（static method）：JDK 1.8中允许使用static关键字修饰一个方法，并提供实现，称为接口静态方法。接口静态方法只能通过接口调用（接口名.静态方法名）。

- 一个类可以实现多个接口，接口也可以实现多个接口

- 不允许实例化

抽象类：

- 当一个类中，某些行为无法给出具体描述时（方法无法给出具体方法体）,此时该行为（方法）应该被标识为抽象（abstract），其所属的类应该被声明为抽象类，该抽象类中的抽象方法延迟到其某个子类来实现.
- 如果一个子类继承了一个抽象父类，则要求该子类必须重写父类中**所有**的抽象方法，如果子类做不到这点，则该子类也必须声明称抽象类，由其下一级子类来给出具体方法实现
- 抽象类不能实例化

他两个的区别：

1、接口的关键是interface，抽象类是abstract 

2、抽象类只能够通过继承extend被使用，接口必须通过实现implement被使用

3、接口在1.8以前不能实现方法，1.8以后加上default修饰符就可以了；抽象类可以提供实现方法

4、子类继承了抽象父类必须重写父类中的所有抽象方法，否则子类也需要为抽象类

#### 4、集合Collection

见连接：https://www.cnblogs.com/jing99/p/7057245.html

最大的集合接口为Collection，在Collection接口下有List和Set集合

- ##### List

  一般list下常用的有ArrayList、LinkedList

  list是有序的集合

  ArrayList：

  - 底层实现方法为数组，初始容量为10
  - 扩容因子为1.5
  - 加载因子为1
  - 查询很快
  - 线程不安全

  vector（被CopyOnWriteArrayLis替代）：

  - 和ArrayList基本一样
  - 扩容因子为2倍
  - 但是是线程安全的

  linkedList：

  - 底层实现为双向链表
  - 插入和删除很快

  如果LinkedList线程不安全：

  方法一:List<String> list = Collections.synchronizedList(new LinkedList<String>());
  方法二:将LinkedList全部换成ConcurrentLinkedQueue

- ##### Set（底层是hashMap，所以各种因子和hashMap是一样的）

  HashSet:不能保证元素能够按照当初添加的顺序迭代出来

  LinkedHashSet:通过为当前结点添加“下一个结点地址”的方式，让各结点在逻辑上保持有序，可以保证按照当初添加的顺序迭代出来

  TreeSet:具有排序功能的Set集合，如果集合中是一些基本类型的值，则按照自然大小排序（从小到大）;如果集合中是一些自定义对象，则需要给出排序规则：

  - 元素类要实现接口Comparable,并实现抽象方法compareTo，给出比较规则，TreeSet会按照给定的比较规则对元素进行排序。

#### 5、Map

Map中存储的内容是**键值对**(key-value)

- HashMap：
  - 底层为数组加链表的形式
  - 1.8以后引入了红黑树，时间复杂度为O(logn)，当hash表的单一链表长度超过 8 个的时候
  - 初始容量为16
  - 加载因子为0.75（不能乱说：**空间换时间**）
  - 扩容因子为2
- Hashtable（似乎被ConcurrentHashMap 替代）：
  - 基本一样，线程安全的
  - **Hashtable 初始容量是11 ，扩容 方式为2N+1;**
- LinkedHashMap：按照插入顺序排序
- treeMap：按照自然顺序排序，或者是按照自定义的顺序排序

## 三、线程

创建线程的方法

- 继承Thread类

- 实现Runnable接口

- 匿名内部类

- 实现Callable接口

- 线程池，这里是个大模块，先放着

  - 四种处理策略：

    1.CallerRunsPolicy 不想丢弃任务，使用本身线程执行。除非线程池已经关闭了。

    2.AbortPolicy 抛出异常RejectedExecutionException，丢弃任务

    3.DiscardPolicy 不抛异常，丢弃任务

    4.DiscardOldestPolicy 丢弃最早的任务，重试执行该任务

## 四、JAVA8新特性

- Lambda：Lambda 允许把函数作为一个方法的参数（函数作为参数传递到方法中）
- 允许我们给接口添加一个非抽象的方法实现，只需要使用 default关键字即可
- 使用:: 关键字进行引用
- 新的时间类：LocalDate、LocalTime、localDateTime

## 五、IO流

1、字符流

- Reader
- Writer

2、字节流

- inputStream
- outputStream

## 六、注解和反射

#### 1、注解（annotation）

- 内置注解

  - Override：重写
  - Deprecated：不建议使用的注解
  - SuppressWarnings：镇压警告，用来镇压上面的Deprecated等

- 元注解

  - Target：用于表示注解可以用在什么地方
  - Retention：什么级别可以生效
  - Document：该注解包含到javadoc中
  - Inherited：子类可以继承父类中的注解

- 反射获取注解

  ORM：对象映射关系，这里通过注解和反射进行映射

#### 2、反射

- 概念：正常我们使用一个对象是引入包名，通过new实例化对象；反射的概念是，对象实例化->反射方法->获得包类

- 先知道类加载的顺序：

  - 三步走：
    - 加载（Load）：将Class文件读入内存，创建一个Class对象
    - 连接（Link）：将类的二进制数据合并到JRE中，这里涉及到JVM，会进行校验，准备和解析，此时，静态变量和常量都已经被加入到内存中，所以调用的时候不会出现类的初始化
    - 初始化（Initialize）：JVM负责对类进行初始化。执行类构造器的cinit()方法，将静态代码块和静态变量进行合并，按照顺序执行

  栈：存放基本类型变量

  堆：存放new出来的对象

  方法区(特殊的堆)：

- 类初始化
  - 主动引用(会发生初始化)
    - new一个类
    - 虚拟器启动的时候，先初始化main方法中所在的类
    - 使用了静态成员或静态方法
    - 使用反射调用
    - 使用子类的时候，发现父类没有被初始化，父类则会被初始化
  - 被动引用(不会发生类的初始化)
    - 子类引用父类的静态变量
    - 通过数组定义类的引用
    - 引用常量
- 类加载器
  - 源程序（.java）->java编译器->转为.class文件->类加载
  - 作用：吧class装进内存的
  - 根加载器->扩展类加载器（jre中的jia包）->系统类加载器（自己写的类）
- 通过反射获取的完整结构
  
  - 各种方法

#### 3、泛型

​	java的一种安全机制，用来约束，避免强制转换，一旦编译完成，所有和泛型有关的类型都会被擦除，反射中加上了新的方法可以获取泛型

泛型一般可以这样使用

```java
public static <T> T test1(class<T>,class){}
public static <T> List<T> test2(class<T>,class){}
public static <T,S> Map<T,S> test3(List<S> list,Class<T> tClass){}  
```

- 返回的泛型要用<>包裹，加上想要返回的泛型对象，对象或是List等都行
- 传入的参数泛型对应想要返回的泛型
- 多个泛型则在<>中用“，”隔开，并且同上一条，传入参数需要对应

## 七、序列化

实现Serializable接口



# JavaEE

## 一、Tomcat

tomcat是一个web服务器

## 二、Servlet

- 生命周期

实例化，初始化（init），提供服务（Service，doGet，doPost），销毁(destroy)，回收

- Servlet是单利的，只会初始化一次，所以构造方法和init方法值也只会访问一次
- 弊端：代码可读性差，特别差，为了解决这个问题，引入了jsp

## 三、JSP

#### 1、本质：

jsp的本质就是Servlet，只是可以在Servlet中可以是写html语言，浏览器访问jsp到服务器，服务器将jsp编译成Servlet后，将html返回到浏览器

#### 2、语法：

1. 静态内容
   就是html,css,javascript等内容
2. 指令
   以<%@开始 %> 结尾，比如<%@page import="java.util.*"%>
3. 表达式 <%=%>
   用于输出一段html
4. Scriptlet
   在<%%> 之间，可以写任何java 代码
5. 声明
   在<%!%> 之间可以声明字段或者方法。但是不建议这么做。
6. 动作
   <jsp:include page="Filename" > 在jsp页面中包含另一个页面。在[包含](https://how2j.cn/k/jsp/jsp-include/576.html)的章节有详细的讲解
7. 注释 <%-- -- %>
   不同于 html的注释 <!-- --> 通过jsp的注释，浏览器也看不到相应的代码，相当于在servlet中注释掉了

- Redirect和Forward：
  - Redirect是间接转发：客户端发起的请求，request生命周期会结束
  - Forward直接转发：服务端发起的请求，会持续request的生命周期

#### 3、Cookie

Cookie是一种浏览器和服务器交互数据的方式。

Cookie是由服务器端创建，但是**不会保存在服务器**。

创建好之后，发送给浏览器。浏览器**保存在用户本地**。

#### 4、JSP有4个作用域，分别是

**pageContext** 当前页面
**requestContext** 一次请求
**sessionContext** 当前会话
**applicationContext** 全局，所有用户共享

#### 5、九个隐式对象

JSP一共有9个隐式对象，分别是
request,response,out

pageContext, session,application

page,config,exception

#### 6、jstl

JSTL JSP Standard Tag Library 标准标签库

引入<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

#### 7、EL表达式

$符号加上参数名，按照pageContext>request>session>application的顺序，从低到高

## 四、HTTP和HTTPS

#### 1、HTTP

HTTP 超文本传输协议 **H**yper **T**ext **T**ransfer **P**rotocol

1、状态码大类

| 状态码 | 说明                                           | 通俗解释                                                     |
| ------ | ---------------------------------------------- | ------------------------------------------------------------ |
| 1xx    | **响应中**——表示请求已经接受，继续处理         | 消息：一般是告诉客户端请求已经收到了，**正在处理，别急**     |
| 2xx    | **成功**——表示请求已经被成功接收、理解、接受。 | 处理成功：一般表示请求收悉、我明白你要的、请求已受理、已经处理完成等信息 |
| 3xx    | **重定向**——要完成请求必须进行更进一步的操作   | 重定向到其它地方：它让客户端再发起一个请求以完成整个处理。   |
| 4xx    | **客户端错误**——请求有语法错误或请求无法实现   | 处理发生错误，责任在客户端：如客户端的请求一个不存在的资源，客户端未被授权，禁止访问等。 |
| 5xx    | **服务器端错误**——服务器未能实现合法的请求。   | 处理发生错误，责任在服务端：如服务端抛出异常，路由出错，HTTP版本不支持等 |

2、常见状态码

| 状态码 | 说明                                                         |
| ------ | ------------------------------------------------------------ |
| 200    | OK      //客户端请求成功，即**处理成功**，这是我们最希望看到的结果 |
| 303    | Other   //我把你redirect到其它的页面，目标的URL通过响应报文头的Location告诉你。 |
| 304    | Not Modified  //告诉客户端，你请求的这个资源至你上次取得后，并没有更改，你直接用你本地的缓存吧，我很忙哦，你能不能少来烦我啊！ |
| 400    | Bad Request  //客户端请求有**语法错误**，不能被服务器所理解  |
| 401    | Unauthorized //请求未经授权，这个状态代码必须和WWW-Authenticate报头域一起使用 |
| 403    | Forbidden  //服务器收到请求，但是**拒绝提供服务**            |
| 404    | Not Found  //**请求资源不存在**，eg：输入了错误的URL，找不到页面/页面已经被网站删除了 |
| 500    | Internal Server Error //服务器发生不可预期的错误，此时应该查查服务端的日志了，肯定抛出了一堆异常 |
| 503    | Server Unavailable  //服务器**当前不能处理**客户端的请求，**一段时间后可能恢复正常** |

3、TCP：面向连接，可靠地，基于字节流的传输层通信协议

- 需要连接
- 字节流：不限制大小，打包成报文段，有序接受

4、GET和POST的区别

- GET请求会把参数拼接在地址后面，POST则会放到RequestBody中去
- GET请求具有长度限制，POST请求没有
- 对参数的数据类型，GET只接受ASCII字符，而POST没有限制
- GET请求只能进行url编码，而POST支持多种编码方式
- POST请求安全性高

#### 2、HTTPS

HTTPS是身披SSL外壳的HTTP。HTTPS是一种通过计算机网络进行安全通信的传输协议，经由HTTP进行通信，利用SSL/TLS建立全信道，加密数据包。

#### 3、三次握手、四次回收

## 五、Filter

过滤器，所有的请求会经过过滤器才会进入到Servlet

生命周期：init，filter，doFilter

一般拦截器会用来修改字符编码

## 六、Interceptor

拦截器，在Filter之后进入

功能比过滤器强大，一般用来过滤controller请求

# 框架

## 一、Spring

1、Spring介绍

Spring是一个轻量级的框架，核心为控制反转(IoC)和面向切面(AOP)的容器

2、注入ioc容器的方法

（1）构造器注入；
（2）设值注入（setter方式注入）；
（3）Feild方式注入（注解方式注入）

3、aop技术

4、ORM

## 二、SpringMVC

#### 1、MVC

MVC是一种三层架构Model，View，Controller；

model相当于dao和bean

view相当于页面

Controller就是控制器，把不同的数据展示出来

#### 2、运行步骤

1.用户发送请求至前端控制器DispatcherServlet
 2.DispatcherServlet收到请求调用处理器映射器HandlerMapping。
 3.处理器映射器根据请求url找到具体的处理器，生成处理器执行链HandlerExecutionChain(包括处理器对象和处理器拦截器)一并返回给DispatcherServlet。
 4.DispatcherServlet根据处理器Handler获取处理器适配器HandlerAdapter执行HandlerAdapter处理一系列的操作，如：参数封装，数据格式转换，数据验证等操作
 5.执行处理器Handler(Controller，也叫页面控制器)。
 6.Handler执行完成返回ModelAndView
 7.HandlerAdapter将Handler执行结果ModelAndView返回到DispatcherServlet
 8.DispatcherServlet将ModelAndView传给ViewReslover视图解析器
 9.ViewReslover解析后返回具体View
 10.DispatcherServlet对View进行渲染视图（即将模型数据model填充至视图中）。
 11.DispatcherServlet响应用户。

## 三、mybatis

在Mysql中，只有当表的类型是INNODB的时候，才支持事务

## 四、SSM

Spring+SpringMVC+Mybatis

## 五、SpringBoot

#### 1、SpringBoot的好处

- **约定大于配置**，很多的框架都已经被整合过了，大量减少了配置文件的使用
- 简化编码
- 简化了部署，内置了tomcat，只需要打成jar包，既可以直接启动

#### 2、SpringBoot的自动装配

- 核心为**pox.xml**
  - spring-boot-dependencies：核心依赖在父工程中，包含了大量的依赖以及配置，不需要自己再进行管理
  - 启动器：可以指定SpringBoot的启动场景，比如spring-boot-starter-web会帮我们导入web环境需要的依赖

  ​       比如spring-boot-starter-web会帮我们导入web环境需要的依赖

  - SpringBoot会把所有的功能场景，都会变成一个个的启动器，需要什么功能都只要找到对应的启动器

- **主程序**

  SpringBootApplication(组合注解)：表明这是一个SpringBoot的应用

  - SpringBootConfiguration：SpringBoot的配置

    内部有一个Configuration注解，再内部是一个Component注解，说明他也是一个Spring的一个组件

  - EnableAutoConfiguration：自动导入配置

    - AutoConfigurationPackage：自动配置包

      - Import（AutoConfigurationPackages.Registrar.class）：自动配置包注册

    - import（AutoConfigurationSelector.class）:自动配置选择器，一个单纯的类，里面有环境，类加载器等

      - 获得自动配置的实体getAutoConfigurationEntry
      - 获得候选配置getConditionConfiguration->获取标注了EnableAutoConfiguration注解的类(就是获取主启动类)

      - 获取所有加载配置

      - 获取项目资源：MEAT-INF/spring.factories文件

      - 获取系统资源：MEAT-INF/spring.factories文件

  - ComponentScan：自动扫描包，扫描到的包会被AutoConfigurationPackage注解给配置

  自动配置的核心文件：会去AutoConfiguration包下面找一个MEAT-INF/spring.factories文件

  ​	新的注解：ConditionOnClass，只有满足这个注解，这个类就不生效

#### 3、run方法

- 推断是java项目还是web项目
- 加载主类

流程（核心就是）：

1. 构造方法 init加载主类
2. 实例对象run方法

#### 4、7种启动时执行方法

ps：以下方法的执行顺序按照编写顺序执行

- 实现ServletContextListener 接口

```java
@Component
public class TestStarted implements ServletContextListener {

    @Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}
 
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}
}
```

特点： 依赖于sevlet容器，需要配置web.xml，两个方法对应servlet生命周期

注入问题：网上说不能用@Autowired注入dao层进行查询，但是本人测试是可以的，不知道是不是有其他配置影响，或是往上说法有误

- 利用@PostConstruct进行初始化

  ```java
  @Component
  @Slf4j
  public class TestInit {
  
      //静态代码块会在依赖注入后自动执行,并优先执行
      static{
          System.out.println("---static--");
      }
      /**
       *  @Postcontruct’在依赖注入完成后自动调用
       */
      @PostConstruct
      public static void haha(){
          log.info("@Postcontruct’在依赖注入完成后自动调用");
      }
  }
  ```

特点：springboot启动后，将类加载到JVM时，static就会先执行，构造函数随后

注入问题：不能注入service，只能执行java代码

- 实现InitializingBean接口

  ```java
  @Component
  @Slf4j
  public class TestInitializingBean implements InitializingBean {
  
      @Override
      public void afterPropertiesSet() throws Exception {
          log.info("执行TestInitializingBean方法");
      }
  }
  ```

特点：spring初始化bean的时候执行

注入问题：可以注入service

- 实现ServletContextAware接口

  ```java
  @Component
  @Slf4j
  public class TestServletContextAware implements ServletContextAware {
  
      @Override
      public void setServletContext(ServletContext servletContext) {
          log.info("执行TestServletContextAware方法");
      }
  }
  ```

特点：Spring容器加载的时候执行

注入问题：可以注入service

- 实现ApplicationRunner接口

  ```java
  @Component
  @Slf4j
  public class TestApplicationRunner implements ApplicationRunner {
  
      @Override
      public void run(ApplicationArguments args) throws Exception {
          log.info("执行TestApplicationRunner方法");
      }
  }
  ```

特点：容器启动完成的时候加载，与下面的区别是参数不同

注入问题：可以注入service进行数据库处理

- 实现CommandLineRunner接口

  ```java
  @Component
  @Slf4j
  public class TestCommandLineRunner implements CommandLineRunner {
  
      @Override
      public void run(String... args) throws Exception {
          log.info("执行TestCommandLineRunner方法");
      }
  }
  ```

特点：容器启动完成的时候加载，与上面的区别是参数不同

注入问题：可以注入service进行数据库处理

- 实现ApplicationListener接口

```java

@Service
public class StartListener implements ApplicationListener {
 
	/**
	 * 操作：<br/>
	 * 1.初始化配置文件
	 */
	@Override
	public void onApplicationEvent(ApplicationEvent arg0) {
		// 1.初始化配置文件
		 
	}
 

```

特点:ApplicationContext事件机制是观察者设计模式的实现，通过ApplicationEvent类和ApplicationListener接口，可以实现ApplicationContext事件处理。如果容器中有一个ApplicationListener Bean，每当ApplicationContext发布ApplicationEvent时，ApplicationListener Bean将自动被触发。所以这种类可能会被多次加载

注入问题：网上说没法直接使用@Autowired来注入sevice进行数据库操作，但是本人测试是可以的，不知道是不是有其他配置影响，或是往上说法有误

# 其他插件

## 六、Shiro



事务、连接语句、数据结构和算法、JVM、SpringCloud



# <span style="color:red">随手笔记</span>

1、BeanUtils

使用过两个jar包下的beanUtils

org.apache.commons.beanutils.BeanUtils

org.springframework.beans.BeanUtils

区别：

- 对于copyProperties(A,B)方法，apache包下是吧B赋值给A，spring包下是吧A赋值给B
- apache包下的方法目标对象支持泛型，可以给T赋值，spring包下不行
- apache包下有一个populate方法，可以将map转换为对象，但实际上copyProperties也可以实现这个功能，apache包下内部会判断是否为map，然后实现方法和populate一样

其他：

- 还有一个类似的方法，Property.copyProperties，严格类型转换，类型和属性名完全一致，性能优于BeanUtils，且支持为null的场景。BeanUtils不支持Boolean，Integer，Long的null转换，会变成0

2、fastjson

fastjson1.2.28及以下的版本一个实体类最多支持32个属性，如果超过了就要升级版本或者用ObjectMapper来进行转换

3、Pattern

动态拼接正则有时候会出现正则注入的问题，java可以使用quote将拼接的正则隔开防止注入

```java
String content = Pattern.quote("正则内容")
Pattern p = Pattern,compile(content);
Matcher matcher = p.matcher("被校验的内容")
if(matcger.matches()){
    //校验成功
}
```

4、Random和SecureRandom

都是用于生成随机数，但是是有区别的

Random生成的是伪随机数，它是基于seed种子生成随机数，jdk默认的seed的种子取得是系统当前的时钟，大部分情况下可以满足随机要求。当seed一样的时候，Random生成的数也是一样的，就失去了随机的效果，所以是伪随机。

SecureRandom可以用来获取真随机，他的原理是获取使用的当前系统，去对应的文件下面取系统的随机数。有两种创建方式

- new SecureRandom

  通过new出来的Random，获得到的也是个伪随机数，他直接使用默认的算法方式（NativePRNG），去/dev/urandom文件下读取随机事件。

- SecureRandom.getInstanceStrong()

  这个方法拿到的是真随机数，这个方法可以设置编码格式，第一个参数为算法方式，第二个参数指定算法程序包，不存在会抛出异常。这个方法会去/dev/random下找随机事件，/dev/random是记录系统磁盘干扰产生的随机事件，比如键盘输入，鼠标移动，io写入写出等，都会产生随机事件。通过这样的方法，让Random取到一个真随机数。

  ps：也因为取系统随机事件的原因，getInstanceStrong这个方法会有阻塞的可能性，一方面是批量并发时的大量io，另一方面当系统长时间不使用，无法产生足够的随机因子，这个方法就会阻塞住，等待系统有足够的随机因子才会继续执行，此时可以通过移动鼠标、输入键盘等方法，减少他的阻塞时间。一般非必要情况下，不建议使用这个。