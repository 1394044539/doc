## 一、Lambda：

Lambda 允许把函数作为一个方法的参数（函数作为参数传递到方法中）

有点像前端es的语法

```java
public class Main {

    public static void main(String[] args){
        //第一种写法
        Set<Object> objects = new TreeSet<Object>((o1,o2)->{
            return 1;
        });

        //第二种写法：
        Set<Object> objects = new TreeSet<Object>((o1,o2)->sortMethod());
    }
    
    /**
    * 排序方法
    */
    public static int sortMethod(Object o1,Object o2){
        return 1;
    }
}
```

## 二、特殊的引用方式

使用:: 关键字进行引用

一中的这个方法，可以通过::关键字引用

```java
public class Main {

    public static void main(String[] args){
        //第一种写法
        Set<Object> objects = new TreeSet<Object>((o1,o2)->{
            return 1;
        });
        //第二种写法
        Set<Object> objects = new TreeSet<Object>((o1,o2)->sortMethod());
        //第三种写法，::关键字引用
        Set<Object> objects = new TreeSet<Object>(Main::sortMethod);
    }
    
    /**
    * 排序方法
    */
    public static int sortMethod(Object o1,Object o2){
        return 1;
    }
}
```

## 三、Optional

java中判空有时候很麻烦，因此java8中多出了这样一个类，专门解决类似的问题，当然他也不仅仅能解决判空的问题。

可以把这个类当做一个容器，把想要处理的对象放进去，通过他的一系列方法处理后，再拿出来

#### 1、实例化

Optional是一个单利类，它有三种实例方法

- of：创建一个实例，并赋值对象，对象为空直接报错
- ofNullable：创建一个实例，并赋值对象，对象为空赋值一个空实例，一般需要用到Optional的时候，都会用这一种
- empty：返回一个空实例对象

#### 2、获取结果

- get：直接获取放入的对象，为空会报错（都用Optional了，谁还用这个方法）
- orElse：如果对象为空，则返回orElse里面的结果，该方法传参只能为一个对象
- orElseGet：如果对象为空，返回orElseGet里面的结果，该方法传参为一个lambda
- orElseThrow：如果对象为空，则返回orElseThrow里面的报错信息，传参也为一个lambda

```java
Optional<User> optionalUser = Optional.ofNullable(user);
User user1 = optionalUser.get();
User user2 = optionalUser.orElse(new User());
User user3 = optionalUser.orElseGet(()->{
    User userTemp = new User();
    userTemp.setName("123");
    return userTemp;
});
User user4 = optionalUser.orElseThrow(()->new RuntimeException("用户不存在"));
```

#### 3、值转换

- map：传参lambda表达式，可以深入对象里面取值，并且配合上面的方法处理空指针情况

  ```java
  String money = optionalUser.map(User::getCost).map(Cost::getMoney).orElse("");
  ```

- flatMap：和map一样，只不是这个方法需要返回的参数是一个Optional

  ```java
  String money = optionalUser.map(User::getName).orElse("");
  String optionalName = optionalUser.flatMap(User::getOptionalName).orElse("");
  
  public static class User{
          private String name;
  
          public String getName() {
              return name;
          }
  
          public void setName(String name) {
              this.name = name;
          }
  
          public Optional<String> getOptionalName() {
              return Optional.ofNullable(name);
          }
  
      }
  ```

#### 4、过滤

- filter：传参同样为lambda表达式，满足条件的就返回，不满足就返回orElse中的

  ```java
  User user5 = optionalUser.filter((o) -> i<2).orElse(new User());
  ```

#### 5、判断（基本没啥用的东西）

- ifPresent：如果对象存在，则会调用lambda（用这个还不如用if判断）
- isPresent：判断对象是否为空（用这个判断还不如不用Optional）

```java
optionalUser.ifPresent((user6 -> {
    System.out.println("对象存在");
}));

if(optionalUser.isPresent()){
    System.out.println("对象存在");
}
```

## 四、Stream

Optional是针对一个对象的处理，而Stream是针对一个集合进行处理，因为都是java8的新特性，没有特殊说明的，传参都是lambda表达式

#### 1、实例化

不需要手动实例化，Collection接口（意味着只有list和set可以使用stream方法）里面有stream方法，直接返回Stream对象，直接调用对应的方法即可。

#### 2、循环

- foreach：循环集合

- forEachOrdered：按顺序循环集合

  为什么有会有顺序的区分，因为流有两种，分别是并行流(parallel stream)和序列流(sequential stream)，其中序列流一定是有顺序的，并行流则无序。当然，默认的情况下都是序列流，可以设置成并行流增加效率。

  ```java
  List<User> list = new ArrayList<>();
  list.add(new User());
  //需要有额外步骤的
  list.stream().forEach(e->{
      System.out.println("本次循环：");
      System.out.println(e);
  });
  //::写法
  list.stream().forEach(System.out::println);
  //序列流
  list.stream().sequential().forEach(System.out::println);
  //并行流
  list.stream().parallel().forEachOrdered(System.out::println);
  ```

#### 3、计算长度

- count：计算集合的长度

#### 4、去重

- distinct：需要重写类的hashcode和equals

#### 5、排序

- sorted：和compare的写法一样

#### 6、跳过

- skip：跳过几条

- limit：获取几条

  ps：这两个同时用，limit会从skip的地方开始计算

#### 7、简单获取数据

- findFirst：获取第一条数据
- findAny：获取任意一条数据（在并行流的时候才会真正获取任意一条数据）

#### 8、转化为数组：

- toArray：需要传入一个数组形式的Lambda表达式

  ```java
  List<User> list = new ArrayList<>();
  User[] users = list.stream().toArray(User[]::new);
  ```

#### 9、判断条件

- anyMatch：任意一个元素满足即返回true
- allMatch：所有元素满足即返回true
- noneMatch：与allMatch相反，所有元素不满足即返回true

#### 10、获取最大最小

两个方法都是传入比较器，和sorted一样，不过max和min返回的是一个Optional，针对Optional的操作见上一节

- max：获取最大
- min：获取最小

#### 11、值转换（简单）

- map：将集合中的每一个元素转换成想要的结果，返回结果任然是一个Stream，可以继续使用Stream的方法

- flatMap：和Optional中的值转换一样，当方法的返回值是Optional时使用

  ```java
  List<User> list = new ArrayList<>();
  list.add(new User());
  List<Integer> collect = list.stream().map(User::getAge).collect(Collectors.toList());
  ```

#### 12、三种包装类型的转换（特殊）

- mapToDouble、mapToInt、mapToLong：
- flatMapToDouble、flatMapToInt、flatMapToLong：

​	ps：因为这几种都是一样的，所以放在一起讲，把集合中的每一个元素，转换成固定的格式的集合。flat和Optional中的值转换一样，当方法的返回值是Optional时使用。这些有自己独有的继承的Stream类，所有得到的返回值会有一些特殊方法。

- sum：获取总和
- average：求平均值，返回一个OptionalDouble，想要拿到封装类型可以使用Optional的方法，想要拿到基本类型需要使用getAsDouble方法
- asDoubleStream、asLongStream、asIntegerStream：类型之间互相转换，转换完拿到的还是各自的Stream
- iterator：迭代器
- summaryStatistics：一个计算类，这里面拿到的全部是基本类型数据
  - getAverage：获取平均值
  - getCount：获取总数
  - getMax：获取最大值
  - getMin：获取小最值
  - getSum：获取总和

```java
List<User> list = new ArrayList<>();
list.add(new User());
IntStream intStream = list.stream().mapToInt(User::getAge);
int sum = intStream.sum();
DoubleStream doubleStream = intStream.asDoubleStream();
LongStream longStream = intStream.asLongStream();
OptionalDouble average = intStream.average();
double asDouble = average.getAsDouble();
Stream<Integer> boxed = intStream.boxed();
IntSummaryStatistics intSummaryStatistics = intStream.summaryStatistics();
double average1 = intSummaryStatistics.getAverage();
long count = intSummaryStatistics.getCount();
int max = intSummaryStatistics.getMax();
int min = intSummaryStatistics.getMin();
long sum1 = intSummaryStatistics.getSum();
```

#### 13、规约

- reduce：计算，三个参数

  - 第一个：计算的初始值
  - 第二个：求和的方法
  - 第三个：并行模式下才会触发，将每个线程的值在这里合并。

  ```java
  List<BigDecimal> list = new ArrayList<>();
  list.add(new BigDecimal(0));
  BigDecimal reduce = list.stream().reduce(BigDecimal.ZERO, BigDecimal::add,BigDecimal::add);
  ```

#### 14、过滤

- filter：和Optional的用法一模一样

#### 15、*收集

collect：返回一个集合，包括List，Set，Map，甚至于他们的嵌套的关系，取决于collect里面如何写。有两种调用方法，一个是需要传递一个Collector接口，Collectors中与非常多的实例方法，一般可以直接调用。另一个是针对并行流的情况下使用的。这里主要讲一讲针对序列流的各种方法，因为常用，且并行流使用方法一样

```java
//序列流
List<User> collect = list.stream().collect(Collectors.toList());
//并行流，第一个参数为总集合，第二个为每一个线程的处理方式，第三个参数为所有线程的处理方式
List<User> collect = list.stream().collect(ArrayList::new, List::add, List::addAll);
```

- Collectors.toList()
- 

## 五、新的时间类：

LocalDate、LocalTime、localDateTime

## 六、接口：

允许我们给接口添加一个非抽象的方法实现，只需要使用 default关键字即可