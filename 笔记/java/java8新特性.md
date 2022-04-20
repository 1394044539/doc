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

1、实例化

Optional是一个单利类，它有三种实例方法

- of：创建一个实例，并赋值对象，对象为空直接报错
- ofNullable：创建一个实例，并赋值对象，对象为空赋值一个空实例，一般需要用到Optional的时候，都会用这一种
- empty：返回一个空实例对象

2、获取结果

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

3、值转换

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

4、过滤

- filter：传参同样为lambda表达式，满足条件的就返回，不满足就返回orElse中的

  ```java
  User user5 = optionalUser.filter((o) -> i<2).orElse(new User());
  ```

5、判断（基本没啥用的东西）

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



## 五、新的时间类：

LocalDate、LocalTime、localDateTime

## 六、接口：

允许我们给接口添加一个非抽象的方法实现，只需要使用 default关键字即可