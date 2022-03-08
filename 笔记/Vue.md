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

## 项目结构：

cli2和cli3的项目结构是不一样的，他们的配置方法也不一样，这个和vue的版本无关

- cli2.0:

  老版本并不太熟悉，所以不多写，列一张图

  ![vue2project](E:\GIT\doc\笔记\img\Vue\vue2project.png)

  配置文件：一般是build->webpack.base.config.js

- cli3.0以及以上：

  ![image-20220307141057076](E:\GIT\doc\笔记\img\Vue\image-20220307141057076.png)

  - public：公共的文件，一般用来放一些全局的资源，个人开发的时候很少用
  - src：项目主体，主要是代码
    - assets：静态文件，用来放置静态的js，css和图片等资源
    - component：组件，一般非视图类的vue文件会放在这个文件夹下
    - router：路由配置
    - store：vuex配置
    - views：视图类的vue文件
    - App.vue：vue项目的根页面，所有的页面都是从这个页面路由过去的
    - main.js：核心主文件，配置vue项目，vue2和vue3有区别的，后面讲
    - 其他：其他的都是个人开发习惯下建立的文件夹，并不是初始化自带的。如：api是封装的http请求，common是公共的js和css，utils是工具类
  - .env：配置文件，启动项目时候的读取根据后缀来读取不同环境下的配置，后面单独讲
  - babel.config.js：js编译器，主要作用是将es5以上的代码，转化为最简单的js，以便低版本的浏览器可以兼容，https://www.babeljs.cn/docs/
  - package.json：我的理解是版本管理器和打包工具，有点像是maven，这里面有项目引入的包的版本，以及一些启动和打包命令的配置，后面也会讲解
  - vue.config.js：cli3.x的配置文件，内容很多，后面会专门讲几个常用的，https://cli.vuejs.org/zh/config/#vue-config-js

## VUE的项目启动与环境配置：

先对上一个模块有个简单的了解，然后讲到相应的文件可以知道是干嘛的，然后cli2.0有点知识盲区，所以这里只讲3.x

### 1、跨域配置

前后端分离的项目一般都会存在跨域问题，大部分时候前后端都需要去解决，并且为了部署到服务器之后，方便做一些代理，这里都建议在本地也进行配置。

在vue.config.js中，输入以下配置，对应的值可以根据情况去修改

```js
const fs = require('fs');
module.exports = {
    publicPath: '/readOnline/',
    devServer: {
        proxy: {
            '/api': {
                target: "http://localhost:8092/", // API服务所在IP及端口号
                changeOrigin: true, // 如果设置为true,那么本地会虚拟一个服务器接收你的请求并代你发送该请求，这样就不会有跨域问题（只适合开发环境）
                pathRewrite: {
                    '^/api': '' // 重写路径
                },
            },
            '/img': {
                target: "http://localhost:8092/img", // API服务所在IP及端口号
                changeOrigin: true, // 如果设置为true,那么本地会虚拟一个服务器接收你的请求并代你发送该请求，这样就不会有跨域问题（只适合开发环境）
                pathRewrite: {
                    '^/img': '' // 重写路径
                },
            }
        },
        // public: '100.72.181.60:8080/readOnline/',
        // hot: true,
        disableHostCheck: true,
    },
    configureWebpack: {
        resolve: {
            alias: {
                '@': resolve('src')
            }
        }
    },
}
```

了解vue.config.js中的配置

- publicPath：浏览器路径会多出这样一个根路径，127.0.0.1:8080/变为127.0.0.1:8080/path
- outputDir：打包之后的文件夹名称，默认为dist
- devServer：webpack的配置，https://webpack.js.org/configuration/dev-server/，跨域也是在这里配置的
  - proxy：代理，具体参数看上面的demo
- configureWebpack：https://cli.vuejs.org/zh/guide/webpack.html#%E7%AE%80%E5%8D%95%E7%9A%84%E9%85%8D%E7%BD%AE%E6%96%B9%E5%BC%8F
  - 本人在这里做了一个别名的操作，@可以代表src目录

### 2、多环境配置与启动：

- 创建.env.环境文件

- 在package.json文件中，找到scripts

  ```json
  "scripts": {
    "serve": "vue-cli-service serve",
    "test": "vue-cli-service serve --mode test",
    "build": "vue-cli-service build"
  },
  ```

  如上，是以一个 "param1":"vue-cli-service param2 --mode param3，这样一个格式进行配置

  - param1：启动的命令，怎么执行就按照那一行进行读取

    ```shell
    npm run param1
    ```

  - vue-cli-service：脚手架命令

  - param2：实际上执行的命令，比如启动项目就是 serve，构建就是build

  - --mode：读取哪个配置文件

  - param3：读取的配置文件的后缀，就比如是.env.param3的后缀

### 3、读取配置文件内容

在任何js文件中都可以用下面这种方法读取想要的配置文件内容

```javascript
process.env.参数名
```

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

### 五、props<span id='props'></span>

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

### 一、基础结构

#### 1、main.js

![image-20220308133318417](E:\GIT\doc\笔记\img\Vue\image-20220308133318417.png)

vue2的main.js可以很明显的看出，他的vue实例是new出来的，然后把组件和一些属性设置进去。

- import：导入，这是js的知识，想使用什么，都需要导入进来才可以使用

  - 需要被注册的可以写成这种格式，然后就可以直接使用他的名字

    ```javascript
    import 名字 from "路径"
    ```

  - 不需要被注册，仅仅只是为了项目启动是加载，比如css文件，以及一些用于配置而不需要导出的js文件，比如我个人使用的路由权限配置permission.js，就可以不需要名字

    ```javascript
    import "路径"
    ```

- Vue.use()：注册vue生态内的插件，内部必须要有install方法才可以，注册之后，会自动导出，就可以直接用this.$xxx方法，$xxx是组件内提供的方法，一般我们用来注册支持vue的ui，element或antd等

- Vue.prototype：用来注册非vue生态内的插件或方法某些发是Vue.prototype.$xxx，这个可以是自定义的方法，定义后，可以直接通过this.$xxx的方式进行调用，一般用在封装后的axios工具，utils工具等

- new Vue().$mount('#app')：这一步把就是实例化之后的vue对象，挂载到id为app的的html标签中，见App.vue

#### 2、App.vue

根页面，vue2只会生成一个vue实例，而这个app.vue就是整个vue实例的最大的页面，其他所有路由都是从这个页面控制的

![image-20220308135449676](E:\GIT\doc\笔记\img\Vue\image-20220308135449676.png)

- Template：在vue2中，Template标签后面必须跟着一个div标签，并且只能有一个div标签，多余的或者非div标签都会报错
- script：就是JavaScript，这里理论上可以做一些全局的初始化操作，像上述图片那样，但是实际上并不建议这样搞，具体还是建议在main.js中进行初始化，更详细的针对vue的写法在后面讲
- style：一般的css，但是vue中有一个属性scoped，加上后该style只会在当前组件中生效，避免组件之间的样式互相影响。还有则是在使用less的时候，需要指定一下lang="less"

### 二、script中使用vue

html中使用vue，在语法里面讲过了，这里主要就讲js

一个vue实例一定是需要export出去的，大部分会用到的vue实例如下：

```javascript
export default {
    name: "APP",
    components: [],
    props:{

    },
    data(){
      return{
        dataTest: '',
        computedTest: 1,
        size: 0,
      }
    },
    methods:{
      test(){

      }
    },
    inject: ['provideTest'],
    provide(){
      return{
        provideTest: ''
      }
    },
    watch: {
      dataTest(newVal,oldVal){

      },
      $route(){
          
      }
    },
    computed: {
      computedTest(){
        return this.size++;
      }
    },
    created() {
    },
    mounted() {
    }
}
```

#### 1、name：

组件名字，没啥用的感觉

#### 2、components：

引用组件，当通过import引用其他组件的时候，需要在这里也写一次

#### 3、props：

<a href='#props'>点这里</a>

#### 4、data：

当前页面中需要被双向绑定的值，可以在页面中直接通过this.dataTest调用

#### 5、methods：

当前页面中的方法

#### 6、inject/provide：

成对使用，父组件之间传值，父组件使用provide进行赋值，子组件通过inject取值，比props更强大，在于他没有深度限制，不管子组件多深，都可以取到

#### 7、watch：

监听事件，一般是对data中的属性进行监听，但是也可以监听路由，此外还有一个深度监听的概念，这快不熟悉，有机会再补充

#### 8、computed：

计算属性，和watch很像，但作用不完全一样，如上述demo中，如果size被改变了computedTest就会立马跟着改变，作为一个被动计算使用，而watch更偏向主动。此外computed在官方文档的建议中，建议用于计算props中的值，在常见的弹窗组件中，props中的值不能直接用在弹窗的show上，需要先赋值给当前组件的参数，这里就可以用计算属性来编写，不需要通过watch监听

#### 9、create/mounted等一系列生命周期方法：

详细请看生命周期，方法基本都能使用，在需要的时候引入他们即可。

#### 10、refs：

```html
<input id="input1" name="input1" ref="input1"
```

```javascript
this.$refs.input1
```

如上：在vue中，使用ref和在js中getElementById的方法几乎一模一样，甚至还要快

#### 11、emit：

对父组件提交方法，正常来说父组件需要有回调方法，都是调用子组件时加上“@方法名=this.当前组件方法(参数)”这种结构，此时子组件在处理完，想要回调父组件的方法就可以按照如下方法进行回调

```javascript
this.$emit("方法名",参数)
```

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

## VueRouter：

官方文档：https://router.vuejs.org/zh/guide/

（1）router.js

通常我们都是在router.js中配置路由，然后将它导出来到main.js中实例化，如下demo

```javascript
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: { path: '/novel/list' }
  },
  {
    path: '/novel/list',
    name: 'Main',
    component: Main,
    children:[
      {
        path:'/reg',
        name:'Reg',
        component:Reg
      },
      {
        path:'/novel/person',
        name:'PersonNovel',
        component:PersonNovel,
        meta:{
          requireAuth:true
        },
        children:[
          {
            path:'/novel/person',
            name:'PersonList',
            component:PersonList
          }
        ]
      },
    ]
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// 解决ElementUI导航栏中的vue-router在3.0版本以上重复点菜单报错问题
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

export default router
```

- path：代表路径

- name：路由组件的名字

- redirect：重定向，如果是当前路径则重定向到某个路径下，可以是path，可以是name

- component：组件，可以直接简写成一下形式，这样就不需要在一开始import了

  ```javascript
   component: () => import('../views/Main.vue'),
  ```

- children：子路由，路由是有嵌套关系的，可以在自己的组件中添加`router-view`进行字路由跳转

  ps：子路由中，如果path前面带有"/"，则路由是从根开始，如果不带"/"，则是跟在他的父路由后面拼接

- meta：自己定义的，某些时候路由需求权限校验，这里就写了一下，后面讲到路由权限控制的时候会提到

- 剩下的一些东西，我也不太清楚，反正为了解决bug，很多时候是需要的

（2）权限控制：官方文档：https://router.vuejs.org/zh/guide/advanced/navigation-guards.html

个人习惯单独创建一个permission.js单独来控制路由跳转，其实没多大必要，完全可以写在router.js里面，效果一样的，单独创建文件还需要在main.js里面导入一下

![image-20220308160710686](E:\GIT\doc\笔记\img\Vue\image-20220308160710686.png)

- 使用router.beforeEach进行路由权限控制，这行代码会在路由发生改变的时候进入，一般我们用来做登录校验，以及权限校验
- to：目标路由对线，这里可以拿到即将进入路由的很多属性，参数，以及你在router.js中定义的一些内容
- from：正在离开的路由
- next：这是一个函数，代表接下里实际要走的路由，如果我们不加参数，就会往目标进行路由，如果增加参数，则会往想要的路由进行跳转，需要注意的是，这个方法也会被本身拦截一次，需要注意死循环问题。此外就是该方法请严格控制只会调用一次next()方法。通过这个是用来跳转到权限不足的页面，或者是未登录跳转到登录页面这种操作。

（3）页面中的控制

- router-view：将匹配到的路由组件替换掉当前的标签，嵌套的时候注意层级关系不要弄错了，router.js中的children，就代表是他的每一层
- router-link：类似于vuerouter中的a标签，不建议使用a标签，而是直接使用这个，虽然本人开发从来没用过这个，都是在js里面控制

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