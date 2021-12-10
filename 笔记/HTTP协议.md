## 一、HTTP

### 1、协议简介：

HTTP 超文本传输协议 **H**yper **T**ext **T**ransfer **P**rotocol，可以简单理解为一种规范

### 2、协议原理：

HTTP协议定义Web客户端如何从Web服务器请求Web页面，以及服务器如何把Web页面传送给客户端。HTTP协议采用了请求/响应模型。客户端向服务器发送一个请求报文，请求报文包含请求的方法、URL、协议版本、请求头部和请求数据。服务器以一个状态行作为响应，响应的内容包括协议的版本、成功或者错误代码、服务器信息、响应头部和响应数据。

以下是 HTTP 请求/响应的步骤：

\1. 客户端连接到Web服务器
一个HTTP客户端，通常是浏览器，与Web服务器的HTTP端口（默认为80）建立一个TCP套接字连接。例如，[http://www.baidu.com](http://www.baidu.com/)。

\2. 发送HTTP请求
通过TCP套接字，客户端向Web服务器发送一个文本的请求报文，一个请求报文由请求行、请求头部、空行和请求数据4部分组成。

\3. 服务器接受请求并返回HTTP响应
Web服务器解析请求，定位请求资源。服务器将资源复本写到TCP套接字，由客户端读取。一个响应由状态行、响应头部、空行和响应数据4部分组成。

\4. 释放连接TCP连接
若connection 模式为close，则服务器主动关闭TCP连接，客户端被动关闭连接，释放TCP连接;若connection 模式为keepalive，则该连接会保持一段时间，在该时间内可以继续接收请求;

\5. 客户端浏览器解析HTML内容
客户端浏览器首先解析状态行，查看表明请求是否成功的状态代码。然后解析每一个响应头，响应头告知以下为若干字节的HTML文档和文档的字符集。客户端浏览器读取响应数据HTML，根据HTML的语法对其进行格式化，并在浏览器窗口中显示。

例如：在浏览器地址栏键入URL，按下回车之后会经历以下流程：

1. 浏览器向 DNS 服务器请求解析该 URL 中的域名所对应的 IP 地址;
2. 解析出 IP 地址后，根据该 IP 地址和默认端口 80，和服务器建立TCP连接;
3. 浏览器发出读取文件(URL 中域名后面部分对应的文件)的HTTP 请求，该请求报文作为 TCP 三次握手的第三个报文的数据发送给服务器;
4. 服务器对浏览器请求作出响应，并把对应的 html 文本发送给浏览器;
5. 释放 TCP连接;
6. 浏览器将该 html 文本并显示内容; 　

### 3、请求方式<span id='action'></span>
我们常用的一般为4种，但是实际上有8中，没想到吧

- GET：一般用来获取内容
- POST：一般用来新增
- PUT：一般用来更新
- DELETE：一般用来删除
- HEAD：和GET请求一样，但不会返回响应数据，可以用来测试连通性
- TRACE：和上面相反，只返回数据
- OPTIONS：简单理解为全部请求方法，和*一个意思
- CONNECT：建议百度

**最经典的问题，post请求和get请求的区别(以下为个人总结)：**

1、GET请求会把参数拼接在url后面，参数会暴露在地址中，URL的编码格式采用的是ASCII编码。

​	POST请求则会把数据放在请求体中，支持多种编码方式

2、GET请求的长度大小有限制，POST没有

3、GET产生一个TCP数据包；POST产生两个TCP数据包。

对于GET方式的请求，浏览器会把http header和data一并发送出去，服务器响应200（返回数据）；

而对于POST，浏览器先发送header，服务器响应100 continue，浏览器再发送data，服务器响应200 ok（返回数据）。

4、在下载文件的时候，GET请求边下载边写入，POST请求会一次性把数据下载下来再写入

### 4、状态码<span id='statusCode'></span>

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

### 5、URL解析<span id="url"/></span>

以一串url为例子：https://www.demo.com:8080/page1/page2.html?param1=123&param2=456，我们对他进行拆分

- https：协议
- www.demo.com：服务器地址
- 8080：端口
- page1/page2.html：路径
- ?param1=123&param2=456：参数，get请求以'?'开头，'&'拼接，'='区分参数名和参数值

### 6、请求格式

- 请求方法：<a href="#action">见3</a>
- URL：<a href="#url">见5</a>
- 协议版本：例如HTTP/1.1
- 请求头：<a href="#header">见8</a>
- 请求内容：<a href="#content">见9</a>

### 7、响应格式

- 协议版本：例如HTTP/1.1
- 状态码：<a href="#statusCode">见4</a>
- 响应头：<a href="#header">见8</a>
- 响应内容：<a href="#header"><a href="#content">见9</a></a>

### 8、请求头/响应头信息<span id='header'></span>

以下只列出常见的，请求头是可以自定义的

|                         | 解释                                                         | 示例                                                        |
| ----------------------- | ------------------------------------------------------------ | ----------------------------------------------------------- |
| **Accept**              | **指定客户端能够接收的内容类型**                             | **Accept: text/plain, text/html**                           |
| **Accept-Charset**      | **浏览器可以接受的字符编码集。**                             | **Accept-Charset: iso-8859-5**                              |
| **Accept-Encoding**     | **指定浏览器可以支持的web服务器返回内容压缩编码类型。**      | **Accept-Encoding: compress, gzip**                         |
| **Accept-Language**     | **浏览器可接受的语言**                                       | **Accept-Language: en,zh**                                  |
| **Accept-Ranges**       | **可以请求网页实体的一个或者多个子范围字段**                 | **Accept-Ranges: bytes**                                    |
| **Authorization**       | **HTTP授权的授权证书**                                       | **Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==**       |
| **Cache-Control**       | **指定请求和响应遵循的缓存机制**                             | **Cache-Control: no-cache**                                 |
| **Connection**          | **表示是否需要持久连接。（HTTP 1.1默认进行持久连接）**       | **Connection: close**                                       |
| **Cookie**              | **HTTP请求发送时，会把保存在该请求域名下的所有cookie值一起发送给web服务器。** | **Cookie: $Version=1; Skin=new;**                           |
| **Content-Length**      | **请求的内容长度**                                           | **Content-Length: 348**                                     |
| **Content-Type**        | **请求的与实体对应的MIME信息**                               | **Content-Type: application/x-www-form-urlencoded**         |
| **Date**                | **请求发送的日期和时间**                                     | **Date: Tue, 15 Nov 2010 08:12:31 GMT**                     |
| **Expect**              | **请求的特定的服务器行为**                                   | **Expect: 100-continue**                                    |
| **From**                | **发出请求的用户的Email**                                    | **From: user@email.com**                                    |
| **Host**                | **指定请求的服务器的域名和端口号**                           | **Host: www.zcmhi.com**                                     |
| **If-Match**            | **只有请求内容与实体相匹配才有效**                           | **If-Match: “737060cd8c284d8af7ad3082f209582d”**            |
| **If-Modified-Since**   | **如果请求的部分在指定时间之后被修改则请求成功，未被修改则返回304代码** | **If-Modified-Since: Sat, 29 Oct 2010 19:43:31 GMT**        |
| **If-None-Match**       | **如果内容未改变返回304代码，参数为服务器先前发送的Etag，与服务器回应的Etag比较判断是否改变** | **If-None-Match: “737060cd8c284d8af7ad3082f209582d”**       |
| **If-Range**            | **如果实体未改变，服务器发送客户端丢失的部分，否则发送整个实体。参数也为Etag** | **If-Range: “737060cd8c284d8af7ad3082f209582d”**            |
| **If-Unmodified-Since** | **只在实体在指定时间之后未被修改才请求成功**                 | **If-Unmodified-Since: Sat, 29 Oct 2010 19:43:31 GMT**      |
| **Max-Forwards**        | **限制信息通过代理和网关传送的时间**                         | **Max-Forwards: 10**                                        |
| **Pragma**              | **用来包含实现特定的指令**                                   | **Pragma: no-cache**                                        |
| **Proxy-Authorization** | **连接到代理的授权证书**                                     | **Proxy-Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==** |
| **Range**               | **只请求实体的一部分，指定范围**                             | **Range: bytes=500-999**                                    |
| **Referer**             | **先前网页的地址，当前请求网页紧随其后,即来路**              | **Referer: http://www.zcmhi.com/archives/71.html**          |
| **TE**                  | **客户端愿意接受的传输编码，并通知服务器接受接受尾加头信息** | **TE: trailers,deflate;q=0.5**                              |
| **Upgrade**             | **向服务器指定某种传输协议以便服务器进行转换（如果支持）**   | **Upgrade: HTTP/2.0, SHTTP/1.3, IRC/6.9, RTA/x11**          |
| **User-Agent**          | **User-Agent的内容包含发出请求的用户信息**                   | **User-Agent: Mozilla/5.0 (Linux; X11)**                    |
| **Via**                 | **通知中间网关或代理服务器地址，通信协议**                   | **Via: 1.0 fred, 1.1 nowhere.com (Apache/1.1)**             |
| **Warning**             | **关于消息实体的警告信息**                                   | **Warn: 199 Miscellaneous warning**                         |

### 9、请求内容/响应内容信息<span id='content'></span>

## 二、HTTPS

HTTPS是身披SSL外壳的HTTP。HTTPS是一种通过计算机网络进行安全通信的传输协议，经由HTTP进行通信，利用SSL/TLS建立全信道，加密数据包。

## 三、三次握手、四次回收