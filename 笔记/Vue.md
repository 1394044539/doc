## 写在前面的：

文档只是根据本人的使用场景和理解，总结出来的快速上手的内容，特别的不全面，有新学到的内容都会慢慢补充进去。有需要建议直接看官方文档

- vue2：https://cn.vuejs.org/index.html
- vue3：https://v3.cn.vuejs.org/

## 简单了解vue：

**ps：node.js的安装请阅读node文档**

Vue.js 的核心是一个允许采用简洁的模板语法来声明式地将数据渲染进 DOM 的系统。简单来讲，vue的好处是双向绑定，以及只由一个页面构成，通过路由进行不同组件的展示。

- vue：

vue目前常用的是Vue2和Vue3的版本，这两个版本的编码区别很大，后面讲到各个地方的时候，都会区别开来讲

- vue cli：
  - 因为vue的版本不同，对应的vuecli版本也不同
  - Vue CLI 4.5以下，对应的是vue2
  - vue CLI 4.5及以上，对应的是vue3，但是也可以用高版本创建vue2的项目。
- 2022年1月15日，vue更新，默认版本都改为vue3
  
- vue和vuecli的区别：

Vue是一个框架，Vue Cli是脚手架，cli相当于代码生成器，创建项目，集成，部署什么的，都可以用脚手架完成。

## 创建项目：

1、先了解自己的脚手架版本

```bat
E:\program\ideaworkspace\web>vue -V
@vue/cli 4.5.15
```

2、根据不同的cli，有不同的创建方式

- cli2.0

  老版本的脚手架叫vue-cli，现在基本上不用了，官方也只有git的地址，没详细的文档说明，https://github.com/vuejs/vue-cli/tree/v2#vue-cli--

  安装命令

  ```bat
  vue init webpack vue-program
  ```

  ![cli2](E:\GIT\doc\笔记\img\Vue\cli2.png)

  cli2的可编辑项非常少，稍微讲一下，很多在后面的版本中也是一样的意思

  - Project name：项目名
  - Project description：项目描述
  - Author：作者
  - Vue build：运行模式，可以阅读官方文档进行查看，https://cn.vuejs.org/v2/guide/installation.html#%E8%BF%90%E8%A1%8C%E6%97%B6-%E7%BC%96%E8%AF%91%E5%99%A8-vs-%E5%8F%AA%E5%8C%85%E5%90%AB%E8%BF%90%E8%A1%8C%E6%97%B6
  - Install vue-router：是否生成vue路由，一般选择yes
  - Use ESLint to lint your code：是否需要ESLint的校验，个人开发一般不开，打开对编码的排版有很大要求，编码很麻烦。工作中一般看公司要求。
  - Pick an ESLint preset：分支风格，选用他默认的即可
  - Set up unit tests：是否设置单元测试，一般不开启
  - Pick a test runner：单元测试运行器
  - Setup e2e tests with Nightwatch：是否安装E2E测试框架NightWatch（E2E，也就是End To End，就是所谓的“用户真实场景”。）
  - Should we run ‘npm install’ for you after the project has been created?(译：项目创建后是否要为你运行“npm install”?这里选择包管理工具)：常用的是npm
  
- cli3.0及以上

  新版本叫@vue/cli，官方文档：https://cli.vuejs.org/zh/guide/

  可视化界面创建项目：

  ```bat
  vue ui
  ```

  这种方式可以引导到可视化界面去操作，支持中文

  命令方式创建项目：

  ```bat
  vue create hello-world
  ```

  每个版本的界面可能都不一样，需要彪悍的英文能力，如果实在看不明白，就搜索当前的cli版本如何创建项目吧

  （1）输入vue create

  ![image-20220224140029113](E:\GIT\doc\笔记\img\Vue\image-20220224140029113.png)

  如图，我的版本是v4.5.15，vue提示我最新的是5.0.1，让我输入npm i -g @vue/cli 进行更新，是选择项目的预设

  - 创建一个demo，使用vue2，less，babel，router，vuex
  - 创建一个默认的vue2项目，引用esLint
  - 创建一个默认的vue3项目，引用esLint
  - 手动选择功能

  （2）一般都选择手动

  ![image-20220224162112771](E:\GIT\doc\笔记\img\Vue\image-20220224162112771.png)

  如图，选择功能，注意看英文，空格选择，a选择全部，i反选，根据需要选择要按照的内容，一般个人开发我喜欢使用：Choose Vue version，Babel，Router，Vuex，CSS Pre-processors，选完按回车进行安装。下面介绍每一项是干什么的

  - Choose Vue version：选择vue的版本，只有vue2.x和vue3.x
  - Babel：基础组件
  - TypeScript：是否使用ts
  - Progressive Web App（PWA）Supported：个人理解可用于支持手机app，不确定
  - Router：支持路由
  - Vuex：支持vuex
  - CSS Pre-processors：css预编译器，一般使用less，都会带上
  - Linter/Formatter：是否开启格式校验
  - Unit Testing：单元测试
  - E2E Testing：测试模式

## vue的基本概念和语法：

### 一、实例：

我们一般看到的官方文档说vue是new出来的实例（如下），但是实际在使用的时候，自己只需要创建vue文件，然后通过路由或者组件的方式调用就可以了。实际上并不是vue没有这个操作，而是吧这个操作放到了main.js中，然后把这个new出来的实例添加到了App.vue文件中的id为app的标签下。这样就意味着，一般情况下，整个vue项目只有一个vue的实例，相当于整个项目都是在一个页面中进行操作的。

```vue
var vm = new Vue({
  // 选项
})
```

具体可以实例化哪些东西，官方文档很详细，这里就不多说了：https://cn.vuejs.org/v2/api/#%E5%85%A8%E5%B1%80%E9%85%8D%E7%BD%AE

### 二、语法：

#### 1、文本：

使用双大括号进行渲染

```vue
<span>Message: {{ msg }}</span>
```

#### 2、插入html标签：

使用双大括号渲染出来的是文本，如果想要渲染html标签，这要使用v-html进行渲染，相当于append在当前标签下

```vue
<p>Using v-html directive: <span v-html="rawHtml"></span></p>
```

#### 3、绑定属性（双向绑定）：

使用v-bind，将属性与数据进行双向绑定，一般直接简写成“：”即可

```vue
<div v-bind:id="dynamicId"></div>
<div :id="dynamicId"></div>
```

#### 4、监听事件：

使用v-on，可以绑定监听事件，一般直接简写成"@"即可

```vue
<a v-on:click="doSomething">...</a>
<a @click="doSomething">...</a>
```

常用的js事件都支持

特殊监听事件：

- 绑定按键：

  ```vue
  <input v-on:keyup.enter="submit">
  ```

- 组合按键：

  ```vue
  <!-- Alt + C -->
  <input v-on:keyup.alt.67="clear">
  
  <!-- Ctrl + Click -->
  <div v-on:click.ctrl="doSomething">Do something</div>
  
  <!-- shift + Click -->
  <div v-on:click.shift="doSomething">Do something</div>
  ```

#### 5、动态参数

从 2.6.0 开始，可以用方括号括起来的 JavaScript 表达式作为一个指令的参数，也就是下方的attributeName可以动态指定了

```vue
<a v-bind:[attributeName]="url"> ... </a>
```

#### 6、修饰符

用"."拼接指令，比如下面的方法阻止默认提交事件

```vue
<button id="but" v-on:submit.prevent="onSubmit">...</button >
```

以上相当于

```javascript
$("but").click(function(event){
  event.preventDefault();
});
```

修饰符可以叠加，并且按照顺序进行

常见的修饰符：

- stop：阻止冒泡，就是阻止事件向上级dom传递
- prevent：阻止默认事件进行
- capture：捕获冒泡事件，即有冒泡发生时，有该修饰符的dom元素会先执行，如果有多个，从外到内依次执行，然后再按自然顺序执行触发的事件
- self：将事件绑定到自身，比stop更强，连下级都不会传递
- once：只会触发一次

#### 7、条件渲染（v-if）

常见的if else判断，在if渲染中，条件不符合的元素会直接从html标签中移除

```vue
<div v-if="type === 'A'">
  A
</div>
<div v-else-if="type === 'C'">
  C
</div>
<div v-else>
  Not A/B/C
</div>
```

ps：因为标签直接被移除的特性，某些时候，希望组件重新渲染，可以对组件使用v-if，并将它的状态从true->false>true，组件就会被重新渲染，但是不推荐经常这样使用，这一块需要结合生命周期去理解

#### 8、展示渲染（v-show）

在show渲染中，不像if支持else操作，而且条件不满足的元素并没有从html中移除，而只是被display隐藏掉了。

```vue
<h1 v-show="ok">Hello!</h1>
```

#### 9、列表渲染（v-for）

常见的for循环，对html节点进行循环，常规用法如下

```vue
<ul id="example-1">
  <li v-for="item in items" :key="item.message">
    {{ item.message }}
  </li>
</ul>
```

当然还有不常规的用法

```vue
<!--比如需要知道index的时候可以这样写 -->
<li v-for="(item, index) in items">
    {{ parentMessage }} - {{ index }} - {{ item.message }}
</li>
<!-- 或者用用of替代in，效果是一样的-->
<li v-for="item of items">
    {{ parentMessage }} - {{ index }} - {{ item.message }}
</li>
```

甚至可以对对象使用循环

```vue
<!-- 此时value只是对象的value -->
<li v-for="value in object">
    {{ value }}
</li>
<!-- value是值，name是字段名，index是下标 -->
<li v-for="(value, name, index) in object">
    {{ index }}. {{ name }}: {{ value }}
</li>
```

#### 10、表单绑定（v-model）

针对表单元素自动绑定他的值，因为不同的输入框他绑定的属性名可能不一样，vue进行一个类似封装的做法，统一使用v-model就可以双向绑定了

```vue
<!-- 当选中时，`picked` 为字符串 "a" -->
<input type="radio" v-model="picked" value="a">

<!-- `toggle` 为 true 或 false -->
<input type="checkbox" v-model="toggle">

<!-- 当选中第一个选项时，`selected` 为字符串 "abc" -->
<select v-model="selected">
  <option value="abc">ABC</option>
</select>
```

### 三、特殊属性

这两个vue2和vue3的使用方式不一样，所以放到后面去讲

1、计算属性：computed

2、监听器：watch

### 四、Class和Style绑定

在一般的html中，想要动态操作样式，必须要在js中编写，在vue可以使用动态绑定的方法，对于style和css的语法结构不太一样，并且都是驼峰命名

```vue
<div v-bind:class="{ active: isActive }"></div>
<div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }"></div>
```

### 五、props

个人理解：组件上的属性就是props

```vue
<component name="123" age="23"></component>
```

上述组件的name和age就是component里面的props的值，如下

```vue
props:{
	name:String,
    age:String,
}
```

这个值是可以动态改变的，具体用法放到下面去讲吧，vue2和vue3有一丝区别

### 六、插槽（slot）

简单的来说，就是把一段html类似参数和函数一样，传递到组件中去，然后组件可以动态加载。类似下面的方法，把组件看做method，把插槽看做a和b，把a+b看成组件封装的html，return看做最终的html页面

```javascript
var = method(5,10)
function method(a,b){
    return a+b
}
```

一般使用的时候使用v-slot，可以直接简写成"#"。举一个例子，然后知道最简单的用法：

假设做一个提示的组件：标题和内容可以通过插槽的方式插入

```vue
<tips>
    <h2>
        这是一个提示框
    </h2>
  <slot name="title"></slot>
  <slot name="content"></slot>
    <!-- 这里面的ok和cancel是当前组件下的值，假设ok="确认",cancel="取消" -->
  <slot name="footer" v-bind:okText="ok" v-binf:cancelText="cancel"></slot>
</tips>
```

其他组件用到他的时候

```vue
<tips>
	<template v-solt:title>
    	插槽的用法
    </template>
    <!-- 最简单的用法 -->
    <template #content>
		<p>这是一个插槽</p>
    </template>
    <!-- 这里面的ok和cancel是组件的值，实际上“”里面应该是个对象，对面里面有两个值okText，cancelText，这里的写法是直接解构了 -->
    <template #footer="{okText,cancelText}">
    	<button>{{okText}}</button>
        <button>{{cancelText}}</button>
    </template>
</tips>
```

最终出现的html解构应该是这样的

```vue
<tips>
    <h2>
        这是一个提示框
    </h2>
  插槽的用法
  <p>这是一个插槽</p>
  <button>确认</button>
  <button>取消</button>
</tips>
```

## vue的生命周期：

没有什么比官方这张图更详细的了，不管是vue2和vue3都会是这样一个实例化过程，vue3只是运用了组合是API，这一套实例化过程是没有变化的，并且vue3也是支持这一套的用法的。![vueInit](E:\GIT\doc\笔记\img\Vue\vueInit.png)

各个时期的意义：

- beforeCreate：创建实例前的方法，在加载页面各种数据监听和事件之前执行

- create：实例创建完后立即调用的方法，可以理解为构造函数(不懂什么是构造函数就无视这句话)，数据侦听、计算属性、方法、事件/侦听器的回调函数已经被配置完成。可以在这个钩子里面调用方法和参数了。但是此时dom节点还未被加载

- beforeMonut：实例挂载之前调用，就是dom节点开始渲染了

- monut：实例开始挂载，就也是替换各种vue的节点，但是这个时候并不能保证所有的节点都加载完毕了，如果要完全保证节点加载后才执行方法，需要使用$nextTick方法，如下

  ```javascript
  mounted(){
    this.$nextTick(function () {
      // 仅在整个视图都被渲染之后才会运行的代码
    })
  }
  ```

- beforeUpdate：数据发生改变，但dom节点还没开始更新时调用的方法，此时dom节点未更新，可以根据数据先一步进行操作，比如移除监听器什么的

- update：数据和dom节点都被更新完成后调用的方法，和monut一样，也不能保证所有节点都被加载完毕，也要使用$nextTick方法，其实这个方法用到的场景不多，因为vue自带watch和computed作为监听数据变化的功能

- activated：被 keep-alive 缓存的组件激活时调用。

- deactivated：被 keep-alive 缓存的组件失活时调用。

- beforeDestroy：实例被销毁前调用，此时实例还未完全销毁，可以对数据最后做一些处理，甚至禁止跳转

- destroy：实例被完全销毁之后调用，此时vue的一个生命周期完全结束，这个阶段无法使用vue的各种功能，唯一可能的作用就是做一些日志打印或其他与页面元素无关的操作。

## vue2<span id='vue2'></span>：

vue2和vue3的基础部分实际上差不多，所有关于vue的基本知识放在这里记录，vue3只做区分的记录

生命周期



## vue3：

在讲vue之前，要知道，vue3可以使用vue2的全部功能，如果你愿意，完全可以在vue3中用vue2的方式进行开发。所以关于vue的基础用法，在vue2进行过记录，可以先去<a href="#vue2">上面看看</a>

## Vue3与Vue2的区别

生命周期：

| Vue3              | Vue2            | 描述                                                         |
| ----------------- | --------------- | ------------------------------------------------------------ |
| beforeCreate      | setUp           | Vue对象创建前执行                                            |
| created           | setUp           | Vue对象创建时执行                                            |
| beforeMonut       | onBeforeMonut   | mount前执行                                                  |
| mounted           | onMounted       | 创建完执行                                                   |
| beforeUpdate      | onBeforeUpdate  | 修改前执行                                                   |
| update            | onUpdate        | 修改时执行                                                   |
| beforeDestory     | onBeforeUnmount | 销毁前执行                                                   |
| destroyed         | onUnmounted     | 销毁时执行                                                   |
| onRenderTracked   |                 | 检查依赖被追踪，当render函数被调用时，会检查哪个响应式数据被收集依赖 |
| onRenderTriggered |                 | 执行update时，会检查哪个响应式数据导致组件重新渲染           |

vue3中，所有声明函数全部要在setup中编写，也就是大部分vue2的写法，监听，计算啥的全都放到setup里面去，都需要引入相关组合api，就是要import

vue3中，没有了this的用法，因为从生命周期的角度来看，sutup的时候组件还没有被创建。

1、ref和reactive：

如果想要实现双向绑定，需要用ref()包裹简单类型，改变的时候，需要对象参数.value=的形式改变，reactive包裹复杂类型数据，改变的时候内部自定解析添加.value

2、监听事件watch：

- ref所监听的数据，可以拿到原数据和现在的数据，但是reactive监听的数据不行（VUE的底层bug）

- 强制开启了深度监听，deep配置无效

- 如果你只想要监听对象中的某一个属性，参数写成箭头函数的形式，而且这样还能监听到旧数据，不会出现上面的bug

  ```javascript
  //单个属性
  watch(()=object.param,(new,old)=>{
  })
  //多个属性
  watch([()=object.param1,()=>object.param2],(new,old)=>{
  })
  ```

- 对于上一条，如果监听的单个属性是个对象，然后对象中的某个属性变了，需要开启deep:true的配置。

- watchEffect:

  ```
  //方法里面用到了哪个方法，就监听哪个
  watchEffect(()=>{
  })
  ```

  

## vuex：

基本属性：

- createStore:
  - state：数据存储的地方
  - getters：获取state里面的数据
  - mutations：同步更新state里面的数据
  - actions：异步或者复杂的更新state里面的数据
  - Modules
- 组建中使用：
  - mapState
  - mapAction
  - mapMutions

使用方法

1、vue组件的html中想要使用这个属性，直接

```vue
{{$store.state.属性}}
```

2、简单的修改方法写在mutations里面

```javascript
 mutations: {
    increment (state) {
      state.count++
    }
  }
```

组件中使用

```javascript
const store = useStore()
store.commit('increment')
```

3、复杂和异步的修改方式写在actions里面

有两种写法(建议使用第二种)：

```javascript
actions: {
    increment (context) {
      context.commit('increment')
    }
  }
```

```javascript
actions: {
  increment ({ commit }) {
    commit('increment')
  }
}
```

在组件里调用

```
const store = useStore()
store.dispatch('increment')
```

路由：

路由传参：

- params

  必须和name绑定使用

- query

  name和path都可以使用，参数会拼接在路径后面