### Vue3与Vue2的区别

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

  

### vuex：

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

