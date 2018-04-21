#  -- SSM 结合 Bootstrap 构建后台管理系统 demo 

《大学》有云：苟日新 日日新 又日新。古人诚不我欺。时常有这种感觉：写过一段时间的代码，再回头看时，觉得有很多可以改进的地方，这说明，我 tm 又进步了。^_^!

今天分享一个后台管理的 demo，顺便重温一下框架的搭建。
这个 demo 使用了 SSM 搭建整体框架，前端使用了 Bootstrap 框架来快速构建响应式页面。


技术框架：Spring、SpringMVC、MyBatis、Bootstrap
开发工具：Myeclipse2017CI、maven3.5、MySQL5.7、Tomcat8
运行环境：jdk1.8
目录结构：

![train.png](https://github.com/JasonMHo/train/blob/master/pic/train.png)


使用框架可以帮助我们更好的理清思路，代码层次结构是怎样一层一层调用的，每一层只负责自己的事的好处在哪，代码一重复就要考虑提取公共部分，以达到提高复用性，松耦合的目的。

### 我们知道：
DispatcherServlet 只做任务的分派，
Controller 里处理请求返回视图模型，
Service 层做具体业务的处理， 
DAO 层只对数据库。
前台页面使用JSP，EL表达式来做展示和简单的逻辑处理

* 在这个 demo 里，从包名也可以看出来分别是做什么用的：<br>
cn.train.common   --->   工具包<br>
cn.train.controller  --->  控制器<br>
cn.train.dao  --->  DAO层<br>
cn.train.entity  --->  实体类<br>
cn.train.service   ---> 业务接口<br>
cn.train.service.impl  --->  业务实现类<br>
* 所有的配置资源都放在 resources 目录下，<br>
database.properties ---> 数据库配置<br>
log4jconf.properties --->  日志<br>
Spring.xml ---> 这几个就不用说了吧<br>
SpringMVC.xml <br>
myBatisConfig.xml  <br>
* 页面静态资源都放在 statics 目录下<br>
js<br>
css<br>
img<br>
localjs  ---> 因为引入了前端框架，这里用 local 来表示自己写的脚本和样式<br>
localcss  ---> <br>
* jsp页面都位 WEB-INF 的 pages 目录下<br>
jsp页面提取了公共部分放在 common 目录下，页面内只使用html标签和el表达式，层次非常清楚

> ps ： <br>所有页面的跳转都由 DispatcherServlet 来控制， <br> 所有的请求路径都带有 .html 后缀， <br>由于一些请求使用了 ajax 异步加载，所以页面显得很清爽。

### 构建一个demo的步骤：
1. 导入 jar 包(如果使用 maven 则是配置 pom.xml)
2. 配置 web.xml 文件
3. 配置 spring.xml
4. 配置 springMVC.xml
5. 配置 myBatis.xml
6. 配置资源文件，database.properties，log4j.properties 等等
7. 设计 pojo 实体类
7. 编写 DAO 层接口和 Mapper.xml
8. 编写 service 业务层
9. 编写 cotroller 控制器
10. 视图代码：前台 jsp 页面



效果：
## 登录页面

![bootstrap_login.gif](https://github.com/JasonMHo/train/blob/master/pic/bootstrap_login.gif)


## 蒙板效果

![bootstrap_train_modal.gif](https://github.com/JasonMHo/train/blob/master/pic/bootstrap_train_modal.gif)


## 分页效果

用前端框架实现的，效果还不错
![bootstrap_train_page.gif](https://github.com/JasonMHo/train/blob/master/pic/bootstrap_train_page.gif)


## 搜索

![bootstrap_train_search.gif](https://github.com/JasonMHo/train/blob/master/pic/bootstrap_train_search.gif)


## 添加和删除

这个功能是自己写的，比较简单
![bootstrap_train_add.gif](https://github.com/JasonMHo/train/blob/master/pic/bootstrap_train_add.gif)


## 响应式效果

![bootstrap_train_boot.gif](https://github.com/JasonMHo/train/blob/master/pic/bootstrap_train_boot.gif)

