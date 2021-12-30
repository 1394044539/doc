## 一、安装Nginx

1、准备工作(如已经有了，则不需要)

安装gcc-c++编译器

```shell
yum install gcc-c++
yum install -y openssl openssl-devel
```

安装pcre包

```shell
yum install -y pcre pcre-devel
```

安装zlib包

```shell
yum install -y zlib zlib-devel
```

2、下载nginx

下载链接：https://nginx.org/download/

```shell
wget https://nginx.org/download/nginx-1.19.9.tar.gz
```

3、解压并进入nginx目录

```shell
tar -zxvf nginx-1.19.9.tar.gz
cd nginx-1.19.9
```

4、加载nginx配置

```shell
#如有需要可以先 vim configuer修改成自己想要的配置
./configure
```

5、编译

```shell
make && make install
```

6、查看安装路径

一般默认是/usr/local/nginx，不知道可以用如下命令查看

```shell
whereis nginx
```

7、启动

进入sbin目录

```shell
./nginx
```

8、重新加载配置

```shell
./nginx -s reload
```

9、关闭

```shell
#等待任务结束后关闭
nginx -s quit
#强行关闭服务
nginx -s stop
```

## 二、配置Nginx

nginx安装完成之后，可以进行去更改nginx的代理配置，一般在usr/local/nginx/conf/下，有一个nginx.conf文件

以下为demo

```ini
#user  nobody;
worker_processes  1;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       mime.types;
    default_type  application/octet-stream;

	# 日志格式
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"'
                      '"$upstream_addr" "$upstream_status" "$upstream_response_time" "$request_time"';
	# 日志路径
    access_log  logs/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

    server {
    	# 监听的端口
        listen       8888;
        # 服务名，一般用域名来表示，可以用域名区分不同的代理地址
        server_name  localhost;
        # 编码
        charset utf-8;
        # 上传文件的大小，默认为1M
        client_max_body_size 100m;

        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
        	# 加载的资源跟路径
            root   /home/nginx/webapp/dist;
            # 根页面
            index  index.html;
            # 解决vue的router刷新报错404的问题
	    	try_files $uri $uri/ /index.html;
        }

		location /novel {
            root /home/nginx/webapp/dist;
            # 重定向
	    	rewrite ^.+novel/?(.*)$ /$1 break;
            try_files $uri $uri/ /index.html;
        }

		location /api {  
            proxy_pass http://127.0.0.1:8092;
	    	rewrite ^.+api/?(.*)$ /$1 break;
	    	# 设置一些请求头参数
	    	proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
	    	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }

		# 因为本人用img做开头访问的静态资源，这里实际上不需要进行重定向，会自己拼接上http://127.0.0.1:8092/img/xxx
        location /img {
            proxy_pass http://127.0.0.1:8092;
	    	proxy_set_header REMOTE-HOST $remote_addr;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
        # 解决跨域问题
		add_header Access-Contrl-Allow-Origin "*";

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        # 错误页面
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }

        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
        #
        #location ~ \.php$ {
        #    proxy_pass   http://127.0.0.1;
        #}

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        #location ~ \.php$ {
        #    root           html;
        #    fastcgi_pass   127.0.0.1:9000;
        #    fastcgi_index  index.php;
        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        #    include        fastcgi_params;
        #}

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #    deny  all;
        #}
    }


    # another virtual host using mix of IP-, name-, and port-based configuration
    #
    #server {
    #    listen       8000;
    #    listen       somename:8080;
    #    server_name  somename  alias  another.alias;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}


    # HTTPS server
    #
    #server {
    #    listen       443 ssl;
    #    server_name  localhost;

    #    ssl_certificate      cert.pem;
    #    ssl_certificate_key  cert.key;

    #    ssl_session_cache    shared:SSL:1m;
    #    ssl_session_timeout  5m;

    #    ssl_ciphers  HIGH:!aNULL:!MD5;
    #    ssl_prefer_server_ciphers  on;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}

}

```

## 三、其他配置

1、Nginx启用proxy_buffer缓冲

1. proxy_buffering（on/off）

   默认值：on

   是否开启，off时proxy_buffers和proxy_busy_buffers_size这两个指令将会失效；无论proxy_buffering是否开启，proxy_buffer_size都是生效的

2. proxy_buffer_size （size）

   默认值：4k

   响应头的长度


   

