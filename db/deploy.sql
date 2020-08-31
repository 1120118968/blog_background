create table article
(
  id int auto_increment comment '主键'
    primary key,
  title varchar(50) not null comment '文章标题',
  description text null comment '文章描述',
  author varchar(50) null comment '文章作者',
  content longtext null comment '文章内容',
  content_format longtext null comment 'html的content',
  read_num int default '0' null comment '阅读量',
  comment_num int default '0' null comment '评论量',
  like_num int default '0' null comment '点赞量',
  cover_type int null comment '文章展示类别,1:普通，2：大图片，3：无图片',
  cover text null comment '封面',
  create_time timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
  update_time timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
  recommend tinyint(1) default '0' not null comment '是否推荐文章',
  category_id varchar(50) null comment '分类类别存在多级分类，用逗号隔开',
  publish tinyint default '0' null comment '发布状态',
  top tinyint(1) default '0' null comment '是否置顶'
)
  comment '文章'
;

create table book
(
  id int auto_increment comment '主键'
    primary key,
  title varchar(100) null comment '标题',
  cover varchar(255) null comment '封面',
  author varchar(50) null comment '作者',
  category_id varchar(20) null comment '分类类别',
  recommend tinyint(1) default '0' null comment '是否推荐',
  publisher varchar(100) null comment '出版社',
  publish_date date null comment '出版日期',
  page_num int null comment '页数',
  grade double null comment '评分',
  description text null comment '简介',
  catalogue text null comment '原书目录',
  create_time timestamp default CURRENT_TIMESTAMP null comment '创建时间',
  update_time datetime default CURRENT_TIMESTAMP null comment '更新时间',
  read_num int default '0' null comment '阅读量',
  comment_num int default '0' null comment '评论量',
  like_num int default '0' null comment '点赞量',
  publish tinyint(1) default '0' null comment '是否发布',
  progress int default '0' null comment '读书状态',
  reading tinyint(1) null comment '是否阅读'
)
  comment '图书表'
;

create table book_note
(
  id int auto_increment comment '主键'
    primary key,
  title varchar(50) not null comment '笔记标题',
  description text null comment '笔记描述',
  author varchar(50) null comment '笔记作者',
  content longtext null comment '笔记内容',
  content_format longtext null comment 'html的context',
  read_num int default '0' null comment '阅读量',
  comment_num int default '0' null comment '评论量',
  like_num int default '0' null comment '点赞量',
  cover text null comment '封面',
  book_id int null comment '所属书本',
  chapter varchar(255) null comment '所属章节',
  create_time timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
  update_time timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
  recommend tinyint(1) default '0' not null comment '是否推荐笔记',
  category_id varchar(50) null comment '分类类别存在多级分类，用逗号隔开',
  publish tinyint default '0' null comment '发布状态',
  cover_type int null comment '封面类型',
  top tinyint(1) null comment '是否置顶'
)
  comment '笔记'
;

create table book_sense
(
  id int auto_increment comment '主键'
    primary key,
  author varchar(20) null comment '作者',
  content text null comment '内容',
  book_id int null comment '关联图书Id',
  create_time timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
  update_time timestamp default CURRENT_TIMESTAMP not null comment '更新时间'
)
  comment '读后感'
;

create table category
(
  id int auto_increment comment '主键',
  name varchar(255) null comment '名称',
  type int null comment '类型：0文章，1阅读',
  `rank` int null comment '级别',
  parent_id int default '0' null comment '父主键',
  constraint operation_category_id_uindex
  unique (id)
)
;

alter table category
  add primary key (id)
;


create table link
(
  id int auto_increment comment '主键'
    primary key,
  title varchar(50) null comment '链接名称',
  url varchar(500) null comment '链接地址',
  avatar varchar(255) null comment '头像'
)
  comment '友链'
;

create table log_like
(
  id bigint auto_increment
    primary key,
  type varchar(50) null comment '点赞类型',
  params varchar(5000) null comment '请求参数',
  time bigint not null comment '执行时长(毫秒)',
  ip varchar(64) null comment 'IP地址',
  create_date datetime null comment '创建时间'
)
  comment '点赞日志'
;

create table log_view
(
  id bigint auto_increment
    primary key,
  type varchar(50) null comment '浏览类型',
  method varchar(200) null comment '请求方法',
  params varchar(5000) null comment '请求参数',
  time bigint not null comment '执行时长(毫秒)',
  ip varchar(64) null comment 'IP地址',
  create_date datetime null comment '创建时间'
)
  comment '阅读日志'
;

create table oss_resource
(
  id int auto_increment comment '主键'
    primary key,
  name varchar(255) null comment '名称',
  url varchar(255) null
)
  comment '云存储资源表'
;

create table recommend
(
  id int auto_increment comment '主键'
    primary key,
  link_id int null comment '推荐的文章Id',
  type int null comment '推荐类型',
  order_num int default '0' null comment '顺序',
  title varchar(100) null comment '标题',
  top tinyint(1) default '0' null comment '置顶'
)
  comment '推荐'
;

create table sys_menu
(
  menu_id bigint auto_increment
      primary key,
  parent_id bigint null,
  name tinytext null,
  url varchar(200) null,
  perms varchar(500) null,
  type int null,
  icon tinytext null,
  order_num int null
)
  comment '菜单管理'
;

create table sys_param
(
  id bigint auto_increment
      primary key,
  par_key int null,
  par_value varchar(255) null,
  menu_url varchar(255) null,
  type varchar(255) null
)
  comment '系统参数'
;

create table sys_role
(
  role_id bigint auto_increment
    primary key,
  role_name varchar(100) null comment '角色名称',
  remark varchar(100) null comment '备注',
  create_user_id bigint null comment '创建者ID',
  create_time datetime null comment '创建时间'
)
  comment '角色'
;

create table sys_role_menu
(
  id bigint auto_increment
    primary key,
  role_id bigint null comment '角色ID',
  menu_id bigint null comment '菜单ID'
)
  comment '角色与菜单对应关系'
;

create table sys_user
(
  user_id bigint auto_increment
      primary key,
  username tinytext null,
  password varchar(255) null,
  email tinytext null,
  salt tinytext null,
  create_user_id tinytext null,
  create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
  status tinyint null
)
;

create table sys_user_role
(
  id bigint auto_increment
    primary key,
  user_id bigint null comment '用户ID',
  role_id bigint null comment '角色ID'
)
  comment '用户与角色对应关系'
;

create table tag
(
  id int auto_increment
    primary key,
  name varchar(50) null comment '标签名字',
  type int null comment '所属类别：0文章，1类别'
)
  comment '标签'
;

create table tag_link
(
  id int auto_increment comment '主键'
    primary key,
  tag_id int null comment '标签Id',
  link_id int null comment '关联Id',
  type int null comment '所属类别：0文章，1阅读'
)
  comment '标签多对多维护表'
;

truncate dbblog.article;

INSERT INTO dbblog.article (id, title, description, author, content, content_format, read_num, comment_num, like_num, cover_type, cover, create_time, update_time, recommend, category_id, publish, top) VALUES (1, '关于本站和博主', '关于本站和博主', 'Bobbi', '# 关于我
氧化钡，英文名Bobbi，是一名努力成长中的Java爱好者  
以下是微信，欢迎互相交流
![名片.jpg](http://oss.dblearn.cn/dbblog/20190303/63ba034bf1e24e918aa53cccb3fb66dc.jpg)
# 关于本站
本站前端Vue，后台是Java
项目还会持续更新，欢迎大家star,谢谢！
[>>点击进入](https://github.com/llldddbbb/dbblog)
', '<h1 id="-">关于我</h1>
<p>氧化钡，英文名Bobbi，是一名努力成长中的Java爱好者<br>以下是微信，欢迎互相交流
<img src="http://oss.dblearn.cn/dbblog/20190303/63ba034bf1e24e918aa53cccb3fb66dc.jpg" alt="名片.jpg"></p>
<h1 id="-">关于本站</h1>
<p>本站前端Vue，后台是Java
项目还会持续更新，欢迎大家star,谢谢！
<a href="https://github.com/llldddbbb/dbblog">&gt;&gt;点击进入</a></p>
', 51, 0, 1, 1, 'http://oss.dblearn.cn/dbblog/20190303/18a6c1d2ed47494396462901ffe02f30.jpg', '2019-03-09 17:09:38', '2019-03-04 17:41:50', 1, '1,2,3', 1, 1);
INSERT INTO dbblog.article (id, title, description, author, content, content_format, read_num, comment_num, like_num, cover_type, cover, create_time, update_time, recommend, category_id, publish, top) VALUES (3, '2019Java最新面试题——Java基础（持续更新）', '网上找的面试题大多比较老旧，很多还是Java6以前的。现在都更新到Java11了，面试题也应该与时俱进。本文搜罗各大厂的Java面试题，力求题目从简到难，分类明确，答案详细！也借此来巩固自己的知识。', 'Bobbi', '### Java基础
#### 1. 两个对象的 hashCode()相同，则 equals()也一定为 true，对吗？两个对象用equals方法比较为true，它们的hashcode值相同吗？
不对，两个对象的hashCode相同，equals()不一定true，equals()方法为true，他们的hashcode也不一定相同。
代码实例:
```java
String str1 = "通话";
String str2 = "重地";
System.out.println(String.format("str1：%d | str2：%d",  str1.hashCode(),str2.hashCode()));
System.out.println(str1.equals(str2));
```
执行的结果： 

str1：1179395 | str2：1179395

false

很显然“通话”和“重地”的 hashCode() 相同，然而 equals() 则为 false，因为在散列表中，hashCode()相等即两个键值对的哈希值相等，然而哈希值相等，并不一定能得出键值对相等。

此外，两个对象用equals方法比较为true，它们的hashcode值也不一定相同
下面的话来自JDK：
> public int hashCode()返回该对象的哈希码值。支持此方法是为了==提高哈希表的性能==。
hashCode 的常规协定是： 
&emsp;&emsp;在 Java 应用程序执行期间，在对同一对象多次调用hashCode 方法时，必须一致地返回相同的整数，前提是将对象进行equals比较时所用的信息没有被修改。从某一应用程序的一次执行到同一应用程序的另一次执行，该整数无需保持一致。

&emsp;&emsp;如果根据 equals(Object) 方法，两个对象是相等的，那么对这两个对象中的每个对象调用 hashCode 方法都必须生成相同的整数结果。如果根据 equals(java.lang.Object) 方法，两个对象不相等，那么对这两个对象中的任一对象上调用 hashCode 方法不要求一定生成不同的整数结果。但是，程序员应该意识到，为不相等的对象生成不同整数结果可以提高哈希表的性能。

**总的来说：重写equals方法时请必须重写hashcode，以保证equals方法相等时两个对象hashcode返回相同的值。如果你不按照规范来，就不一定相同了。**', '<h3 id="java-">Java基础</h3>
<h4 id="1-hashcode-equals-true-equals-true-hashcode-">1. 两个对象的 hashCode()相同，则 equals()也一定为 true，对吗？两个对象用equals方法比较为true，它们的hashcode值相同吗？</h4>
<p>不对，两个对象的hashCode相同，equals()不一定true，equals()方法为true，他们的hashcode也不一定相同。
代码实例:</p>
<pre><code class="language-java">String str1 = &quot;通话&quot;;
String str2 = &quot;重地&quot;;
System.out.println(String.format(&quot;str1：%d | str2：%d&quot;,  str1.hashCode(),str2.hashCode()));
System.out.println(str1.equals(str2));</code></pre>
<p>执行的结果： </p>
<p>str1：1179395 | str2：1179395</p>
<p>false</p>
<p>很显然“通话”和“重地”的 hashCode() 相同，然而 equals() 则为 false，因为在散列表中，hashCode()相等即两个键值对的哈希值相等，然而哈希值相等，并不一定能得出键值对相等。</p>
<p>此外，两个对象用equals方法比较为true，它们的hashcode值也不一定相同
下面的话来自JDK：</p>
<blockquote>
<p>public int hashCode()返回该对象的哈希码值。支持此方法是为了==提高哈希表的性能==。
hashCode 的常规协定是： 
&emsp;&emsp;在 Java 应用程序执行期间，在对同一对象多次调用hashCode 方法时，必须一致地返回相同的整数，前提是将对象进行equals比较时所用的信息没有被修改。从某一应用程序的一次执行到同一应用程序的另一次执行，该整数无需保持一致。</p>
</blockquote>
<p>&emsp;&emsp;如果根据 equals(Object) 方法，两个对象是相等的，那么对这两个对象中的每个对象调用 hashCode 方法都必须生成相同的整数结果。如果根据 equals(java.lang.Object) 方法，两个对象不相等，那么对这两个对象中的任一对象上调用 hashCode 方法不要求一定生成不同的整数结果。但是，程序员应该意识到，为不相等的对象生成不同整数结果可以提高哈希表的性能。</p>
<p><strong>总的来说：重写equals方法时请必须重写hashcode，以保证equals方法相等时两个对象hashcode返回相同的值。如果你不按照规范来，就不一定相同了。</strong></p>
', 32, 0, 0, 0, 'http://oss.dblearn.cn/dbblog/20190304/b00399e2664b4c42a3e2b4b23fcf128b.jpeg', '2019-03-09 17:09:38', '2019-03-04 23:24:09', 1, '9,11,12', 1, 0);
INSERT INTO dbblog.article (id, title, description, author, content, content_format, read_num, comment_num, like_num, cover_type, cover, create_time, update_time, recommend, category_id, publish, top) VALUES (4, '用最简单的话告诉你什么是ElasticSearch', 'Elasticsearch 是一个分布式可扩展的实时搜索和分析引擎,一个建立在全文搜索引擎 Apache Lucene(TM) 基础上的搜索引擎.当然 Elasticsearch 并不仅仅是 Lucene 那么简单，下面就介绍ElasticSearch为什么是分布式的，可扩展，高性能，高可用。


作者：fallinjava
链接：https://juejin.im/post/5c790b4b51882545194f84f0
来源：掘金
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', 'Bobbi', '
> 转载:https://juejin.im/post/5c790b4b51882545194f84f0

## 1.什么是搜索
在我们想知道一些信息时，就会使用一些搜索引擎来获取我们想要的数据，比如搜索我们喜欢的一款游戏，或者喜欢的一本书等等，这就是提到搜索的的第一印象，说直白点就是在任何场景下找寻你想要知道的信息，这就是搜索。
- 现在的搜索也称为垂直搜索 垂直搜索引针对某一个行业的专业搜索引擎，比如说电商网站，新闻网站，各种app内部等等，他们都是搜索引擎的细分和延伸，在抽取出需要的数据进行处理后再以某种形式返回给用户。

## 2.如果用数据库来做搜索会怎么样
例如我们这里有一张商品表，现在我们要搜索"衣服"这个关键字，，执行了 select * from products where product_name like %衣服%，（假设这里没有其他任何提升效率的设置）来进行搜索，或者进行其他字段的匹配，可以分析一下这个方式的缺点。

1. 比如说，每条记录的指定字段的数据会很长，比如说“商品介绍”这个字段，可能会有几千或者几万个字符，那么搜索的时候就会去这些字符里面进行匹配是否包含要搜索的关键词。
2. 这种方式只能搜索到完全包含“衣服”这个两个字符的记录，但是可能会有一些特殊的情况，某几条记录里面的“衣服”关键词并不是连续的，可能衣服中间会插入某些字符，这个时候就搜索不出来这些记录了，但是这个商品又是我们希望搜索出来的，这个时候这种方式的弊端就十分明显了。

总的来说用数据库来实现搜索是不太靠谱的，性能会很差。

## 3.什么是全文检索
首先需要了解什么是倒排索引？我们这里先上一幅图，里面有4条记录。
![1.jpg](http://oss.dblearn.cn/dbblog/20190305/fb6809d46e7744e78c5a686bbd096506.jpg)
现在将这4条记录的内容进行拆分成一些词条，这个过程叫做分词
![2.jpg](http://oss.dblearn.cn/dbblog/20190305/0271f31d280f49b68ae9e942f286a3e4.jpg)
现在我们得到了这4条记录拆分出来词语，然后将这写词语放到一个列表中，并记录他们的ID，这个分析出来的就是 倒排索引
![3.jpg](http://oss.dblearn.cn/dbblog/20190305/567fa7ca43d34eab886a5b8dc4c83b4f.jpg)

现在我们输入 生化电影 这个关键词，这个时候搜素引擎将我们输入的内容分词为 生化 和 电影 这两个关键词，然后使用这个两个关键词去倒排索引里面匹配，发现包含 生化 这个关键词的记录有ID为 1,2,3,4这四条记录，包含 电影 这个关键词的有ID为1这条记录，由于ID为1这条记录已经被录入了，所以就被排除在外了， 这时候我们就得到了想要ID为1234这4条记录，同理，如果我们只输入 电影 这个关键词，那么符合条件的只有ID为1这条记录了。  

全文检索就是从拆分词语，存入倒排索引，然后分析用户输入的内容，在倒排索引里面进行匹配，这个过程就是全文检索。

## 4.什么是ElasticSearch
&emsp;&emsp;首先需要知道什么是Lucence，Lucence它就是一个Java的jar包，里面实现了倒排索引的算法和其他的全文检索相关的东西，ElasticSearch就是对Lunence进行了封装，为什么有Lucence了还要ElasticSeaearch来干什么呢？  

&emsp;当数据量很大的时候，比如有1PB的数据，这个时候数据放在同一台机器上基本就不行了，那么把数据分开来放在多台机器上呢？那就变成分布式了，这个时候数据前端获取数据的时候到底去那一台机器上面去获取数据呢？这个时候就很麻烦了，如果某一台机器宕机了，那么这个机器上的数据就获取不到了，这也就无法保证高可用性了，还有数据存储的时候怎么到底存入那台机器等等，这些都需要人为的处理和维护。这个时候ElasticSearch就应运而生了，它就将Lucence这些弊端给完全解决了。  

举例一些优点：

1. 高性能，自动维护数据分布到多个节点进行索引的建立，还有搜索请求分布到多个节点的执行。
2. 高可用，自动维护数据的冗余副本，保证说，一些机器宕机了，不会造成数据的丢失。
3. 封装了更多的高级功能，以给我们提供更多的高级支持，让我们快速的开发应用，开发更加复杂的应用，复杂的搜索功能，聚合分析的功能，基于地理位置的搜索(比如周围一公里内有几家咖啡厅)等等。
4. 动态扩容，当我们数据量急剧提升的时候，我们只需要增加机器就行了，比如两台机器存放1.2T数据，那么没台机器存放就是600G，但是如果600G对于服务器的压力太大了，这个时候就需要增加第三台机器，让他们每人负责400G的数据，这个过程不需要人为的去分配，只需要将汲取加入集群中就自动完成。


', '<blockquote>
<p>转载:<a href="https://juejin.im/post/5c790b4b51882545194f84f0">https://juejin.im/post/5c790b4b51882545194f84f0</a></p>
</blockquote>
<h2 id="1-">1.什么是搜索</h2>
<p>在我们想知道一些信息时，就会使用一些搜索引擎来获取我们想要的数据，比如搜索我们喜欢的一款游戏，或者喜欢的一本书等等，这就是提到搜索的的第一印象，说直白点就是在任何场景下找寻你想要知道的信息，这就是搜索。</p>
<ul>
<li>现在的搜索也称为垂直搜索 垂直搜索引针对某一个行业的专业搜索引擎，比如说电商网站，新闻网站，各种app内部等等，他们都是搜索引擎的细分和延伸，在抽取出需要的数据进行处理后再以某种形式返回给用户。</li>
</ul>
<h2 id="2-">2.如果用数据库来做搜索会怎么样</h2>
<p>例如我们这里有一张商品表，现在我们要搜索&quot;衣服&quot;这个关键字，，执行了 select * from products where product_name like %衣服%，（假设这里没有其他任何提升效率的设置）来进行搜索，或者进行其他字段的匹配，可以分析一下这个方式的缺点。</p>
<ol>
<li>比如说，每条记录的指定字段的数据会很长，比如说“商品介绍”这个字段，可能会有几千或者几万个字符，那么搜索的时候就会去这些字符里面进行匹配是否包含要搜索的关键词。</li>
<li>这种方式只能搜索到完全包含“衣服”这个两个字符的记录，但是可能会有一些特殊的情况，某几条记录里面的“衣服”关键词并不是连续的，可能衣服中间会插入某些字符，这个时候就搜索不出来这些记录了，但是这个商品又是我们希望搜索出来的，这个时候这种方式的弊端就十分明显了。</li>
</ol>
<p>总的来说用数据库来实现搜索是不太靠谱的，性能会很差。</p>
<h2 id="3-">3.什么是全文检索</h2>
<p>首先需要了解什么是倒排索引？我们这里先上一幅图，里面有4条记录。
<img src="http://oss.dblearn.cn/dbblog/20190305/fb6809d46e7744e78c5a686bbd096506.jpg" alt="1.jpg">
现在将这4条记录的内容进行拆分成一些词条，这个过程叫做分词
<img src="http://oss.dblearn.cn/dbblog/20190305/0271f31d280f49b68ae9e942f286a3e4.jpg" alt="2.jpg">
现在我们得到了这4条记录拆分出来词语，然后将这写词语放到一个列表中，并记录他们的ID，这个分析出来的就是 倒排索引
<img src="http://oss.dblearn.cn/dbblog/20190305/567fa7ca43d34eab886a5b8dc4c83b4f.jpg" alt="3.jpg"></p>
<p>现在我们输入 生化电影 这个关键词，这个时候搜素引擎将我们输入的内容分词为 生化 和 电影 这两个关键词，然后使用这个两个关键词去倒排索引里面匹配，发现包含 生化 这个关键词的记录有ID为 1,2,3,4这四条记录，包含 电影 这个关键词的有ID为1这条记录，由于ID为1这条记录已经被录入了，所以就被排除在外了， 这时候我们就得到了想要ID为1234这4条记录，同理，如果我们只输入 电影 这个关键词，那么符合条件的只有ID为1这条记录了。  </p>
<p>全文检索就是从拆分词语，存入倒排索引，然后分析用户输入的内容，在倒排索引里面进行匹配，这个过程就是全文检索。</p>
<h2 id="4-elasticsearch">4.什么是ElasticSearch</h2>
<p>&emsp;&emsp;首先需要知道什么是Lucence，Lucence它就是一个Java的jar包，里面实现了倒排索引的算法和其他的全文检索相关的东西，ElasticSearch就是对Lunence进行了封装，为什么有Lucence了还要ElasticSeaearch来干什么呢？  </p>
<p>&emsp;当数据量很大的时候，比如有1PB的数据，这个时候数据放在同一台机器上基本就不行了，那么把数据分开来放在多台机器上呢？那就变成分布式了，这个时候数据前端获取数据的时候到底去那一台机器上面去获取数据呢？这个时候就很麻烦了，如果某一台机器宕机了，那么这个机器上的数据就获取不到了，这也就无法保证高可用性了，还有数据存储的时候怎么到底存入那台机器等等，这些都需要人为的处理和维护。这个时候ElasticSearch就应运而生了，它就将Lucence这些弊端给完全解决了。  </p>
<p>举例一些优点：</p>
<ol>
<li>高性能，自动维护数据分布到多个节点进行索引的建立，还有搜索请求分布到多个节点的执行。</li>
<li>高可用，自动维护数据的冗余副本，保证说，一些机器宕机了，不会造成数据的丢失。</li>
<li>封装了更多的高级功能，以给我们提供更多的高级支持，让我们快速的开发应用，开发更加复杂的应用，复杂的搜索功能，聚合分析的功能，基于地理位置的搜索(比如周围一公里内有几家咖啡厅)等等。</li>
<li>动态扩容，当我们数据量急剧提升的时候，我们只需要增加机器就行了，比如两台机器存放1.2T数据，那么没台机器存放就是600G，但是如果600G对于服务器的压力太大了，这个时候就需要增加第三台机器，让他们每人负责400G的数据，这个过程不需要人为的去分配，只需要将汲取加入集群中就自动完成。</li>
</ol>
', 12, 0, 0, 0, 'http://oss.dblearn.cn/dbblog/20190305/d991537084cf42b2889b41838b59df0f.png', '2019-03-09 17:09:38', '2019-03-05 12:59:56', 0, '9,11,12', 1, 0);
INSERT INTO dbblog.article (id, title, description, author, content, content_format, read_num, comment_num, like_num, cover_type, cover, create_time, update_time, recommend, category_id, publish, top) VALUES (5, '性能分析利器《Arthas》总结', 'Arthas 是Alibaba开源的Java诊断工具，为什么要介绍这个工具呢？先来看看你是否都遇到这样的场景：当你线上项目出了问题，但是一打开日志发现，有些地方忘记打了日志，于是你马上补上日志，然后重新上线。当你的项目某个接口执行速度较慢，为了排查问题，于是你四处加上每个方法运行时间。当你发现某个类有冲突，好像在线上运行的结果和你预期的不符合，手动把线上编译出的class文件下载下来然后反编译，看看究竟class内容是什么。', 'Bobbi', '## 性能分析利器《Arthas》总结
Arthas 是Alibaba开源的Java诊断工具，为什么要介绍这个工具呢？先来看看你是否都遇到这样的场景：

- 当你线上项目出了问题，但是一打开日志发现，有些地方忘记打了日志，于是你马上补上日志，然后重新上线。
- 当你的项目某个接口执行速度较慢，为了排查问题，于是你四处加上每个方法运行时间。
- 当你发现某个类有冲突，好像在线上运行的结果和你预期的不符合，手动把线上编译出的class文件下载下来然后反编译，看看究竟class内容是什么。
- 当你发现系统突然报出某个类的Exception，却无法找到这个类是从哪个Jar包加载的。
- 当你发现有时候排查一个问题需要上游重复调用这个方法，于是你只能想尽办法利用postman等工具重现这个请求。


下面我将会介绍一下Arthas的一些常用的命令和用法，看看是如何解决我们实际中的问题的，至于安装教程可以参考Arthas的github。
> https://github.com/alibaba/arthas

## 常用命令
dashboard 当前系统的实时数据面板  

jvm 查看当前JVM信息  

thread 可直接查看线程的cpu占用比  

sc sm 快速搜索类和方法信息  

getstatic 查看类静态变量  

jad 反编译class文件  

mc 编译.java文件生成.class  

redefine 加载外部class文件到应用程序中  

monitor 监测方法调用次数、成功次数、失败次数、平均RT等  

watch tt 观测方法执行的前、后、结束、异常、耗时过大时，入参（入参属性深度可调）、返回值、异常，支持实时监测每次方法执行和方法的所有调用执行。  

trace 查看方法调用树耗时  

stack 查看方法的所有调用树路径

## 1.奇怪的类加载错误
&emsp;&emsp;相信大家都遇到过NoSuchMethodError这个错误，一般老司机看见这个错误第一反应就是jar包版本号冲突，这种问题一般来说使用maven的一些插件就能轻松解决。  

&emsp;&emsp;之前遇到个奇怪的问题，我们有两个服务的client-jar包，有个类的包名和类名均是一致，在编写代码的时候没有注意到这个问题，在编译阶段由于包名和类名都是一致，所有编译阶段并没有报错，在线下的运行阶段没有问题，但是测试环境的机器中的运行阶段缺报出了问题。这个和之前的jar包版本号冲突有点不同，因为在排查的时候我们想使用A服务的client-jar包的这个类，但是这个jar包的版本号在Maven中的确是唯一的。
这个时候Arthas就可以大显神通了。
### 1.1 sc命令
找到对应的类，然后输出下面的命令(用例使用的是官方提供的用例):
``` shell
$ sc -d demo.MathGame
class-info        demo.MathGame
code-source       /private/tmp/arthas-demo.jar
name              demo.MathGame
isInterface       false
isAnnotation      false
isEnum            false
isAnonymousClass  false
isArray           false
isLocalClass      false
isMemberClass     false
isPrimitive       false
isSynthetic       false
simple-name       MathGame
modifier          public
annotation
interfaces
super-class       +-java.lang.Object
class-loader      +-sun.misc.Launcher$AppClassLoader@3d4eac69
                    +-sun.misc.Launcher$ExtClassLoader@66350f69
classLoaderHash   3d4eac69
 
Affect(row-cnt:1) cost in 875 ms.

```
可以看见打印出了code-source,当时发现了code-source并不是从对应的Jar包取出来的，于是发现了两个服务对于同一个类使用了同样的包名和类名，导致了这个奇怪的问题，后续通过修改包名和类名进行解决。

### 1.2 jad
Arthas还提供了一个命令jad用来反编译,对于解决类冲突错误很有用，比如我们想知道这个类里面的代码到底是什么，直接一个jad命令就能搞定:
```shell
$ jad java.lang.String
 
ClassLoader:
 
Location:
 
/*
* Decompiled with CFR 0_132.
*/
package java.lang;
 
import java.io.ObjectStreamField;
...
public final class String
implements Serializable,
Comparable<String>,
CharSequence {
    private final char[] value;
    private int hash;
    private static final long serialVersionUID = -6849794470754667710L;
    private static final ObjectStreamField[] serialPersistentFields = new ObjectStreamField[0];
    public static final Comparator<String> CASE_INSENSITIVE_ORDER = new CaseInsensitiveComparator();
 
    public String(byte[] arrby, int n, int n2) {
        String.checkBounds(arrby, n, n2);
        this.value = StringCoding.decode(arrby, n, n2);
    }
...
```

一般通过这个命令我们就能发现和你所期待的类是否缺少了某些方法，或者某些方法有些改变，从而确定jar包冲突。

## 2.动态修改日志级别
有很多同学可能会觉得动态修改日志有什么用呢？好像自己也没怎么用过呢？
一般来说下面这几个场景可以需要:  

一般大家日志级别默认是info，有时候需要查看debug的日志可能需要重新上线。
当线上某个应用流量比较大的时候，如何业务出现问题，可能会短时间之内产生大量日志，由于日志会写盘，会消耗大量的内存和磁盘IO进一步加重我们的问题严重性，进而引起雪崩。
我们可以使用动态修改日志解决我们上面两个问题

### 2.1 ognl
ognl是一门表达式语言，在Arthas中你可以利用这个表达式语言做很多事，比如执行某个方法，获取某个信息。再这里我们可以通过下面的命令来动态的修改日志级别:
``` shell
$ ognl ''@com.lz.test@LOGGER.logger.privateConfig''
@PrivateConfig[
    loggerConfig=@LoggerConfig[root],
    loggerConfigLevel=@Level[INFO],
    intLevel=@Integer[400],
]
$ ognl ''@com.lz.test@LOGGER.logger.setLevel(@org.apache.logging.log4j.Level@ERROR)''
null
$ ognl ''@com.lz.test@LOGGER.logger.privateConfig''
@PrivateConfig[
    loggerConfig=@LoggerConfig[root],
    loggerConfigLevel=@Level[ERROR],
    intLevel=@Integer[200],
  
]

```


## 3.如何知道某个方法是否调用
很多时候我们方法执行的情况和我们预期不符合，但是我们又不知道到底哪里不符合，Arthas的watch命令就能帮助我们解决这个问题。

### 3.1 watch
watch命令顾名思义观察，他可以观察指定方法调用情况，定义了4个观察事件点， -b 方法调用前，-e 方法异常后，-s 方法返回后，-f 方法结束后。默认是-f
比如我们想知道某个方法执行的时候，参数和返回值到底是什么。注意这里的参数是方法执行完成的时候的参数，和入参不同有可能会发生变化。
``` shell
$ watch demo.MathGame primeFactors "{params,returnObj}" -x 2
Press Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:1) cost in 44 ms.
ts=2018-12-03 19:16:51; [cost=1.280502ms] result=@ArrayList[
    @Object[][
        @Integer[535629513],
    ],
    @ArrayList[
        @Integer[3],
        @Integer[19],
        @Integer[191],
        @Integer[49199],
    ],
]
```

你能得到参数和返回值的情况，以及方法时间消耗的等信息。

## 4.如何知道某个方法耗时较多
当某个方法耗时较长，这个时候你需要排查到底是某一处发生了长时间的耗时，一般这种问题比较难排查，都是通过全链路追踪trace图去进行排查，但是在本地的应用中没有trace图，这个时候需要Arthas的trace命令来进行排查问题。
### 4.1 trace
trace 命令能主动搜索 class-pattern／method-pattern 对应的方法调用路径，渲染和统计整个调用链路上的所有性能开销和追踪调用链路。
但是trace只能追踪一层的调用链路，如果一层的链路信息不够用，可以把该链路上有问题的方法再次进行trace。
trace使用例子如下。
``` shell
$ trace demo.MathGame run
Press Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:1) cost in 42 ms.
`---ts=2018-12-04 00:44:17;thread_name=main;id=1;is_daemon=false;priority=5;TCCL=sun.misc.Launcher$AppClassLoader@3d4eac69
    `---[10.611029ms] demo.MathGame:run()
        +---[0.05638ms] java.util.Random:nextInt()
        +---[10.036885ms] demo.MathGame:primeFactors()
        `---[0.170316ms] demo.MathGame:print()

```

可以看见上述耗时最多的方法是primeFactors，所以我们可以对其进行trace进行再一步的排查。

## 5.如何使用命令重发请求？
有时候排查一个问题需要上游再次调用这个方法，比如使用postMan等工具，当然Arthas提供了一个命令让替代我们来回手动请求。
### 5.1 tt
tt官方介绍: 方法执行数据的时空隧道，记录下指定方法每次调用的入参和返回信息，并能对这些不同的时间下调用进行观测。可以看见tt可以用于录制请求，当然也支持我们重放。
如果要录制某个方法，可以用下面命令:
```shell
$ tt -t demo.MathGame primeFactors
Press Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:1) cost in 66 ms.
 INDEX   TIMESTAMP            COST(ms)  IS-RET  IS-EXP   OBJECT         CLASS                          METHOD
-------------------------------------------------------------------------------------------------------------------------------------
 1000    2018-12-04 11:15:38  1.096236  false   true     0x4b67cf4d     MathGame                       primeFactors
 1001    2018-12-04 11:15:39  0.191848  false   true     0x4b67cf4d     MathGame                       primeFactors
 1002    2018-12-04 11:15:40  0.069523  false   true     0x4b67cf4d     MathGame                       primeFactors
 1003    2018-12-04 11:15:41  0.186073  false   true     0x4b67cf4d     MathGame                       primeFactors
 1004    2018-12-04 11:15:42  17.76437  true    false    0x4b67cf4d     MathGame                       primeFactors

```

上面录制了5个调用环境现场，也可以看做是录制了5个请求返回信息。比如我们想选择index为1004个的请求来重放，可以输入下面的命令。
```shell
$ tt -i 1004 -p
 RE-INDEX       1004
 GMT-REPLAY     2018-12-04 11:26:00
 OBJECT         0x4b67cf4d
 CLASS          demo.MathGame
 METHOD         primeFactors
 PARAMETERS[0]  @Integer[946738738]
 IS-RETURN      true
 IS-EXCEPTION   false
 RETURN-OBJ     @ArrayList[
                    @Integer[2],
                    @Integer[11],
                    @Integer[17],
                    @Integer[2531387],
                ]
Time fragment[1004] successfully replayed.
Affect(row-cnt:1) cost in 14 ms.
```

注意重放请求需要关注两点:

ThreadLocal 信息丢失:由于使用的是Arthas线程调用，会让threadLocal信息丢失，比如一些TraceId信息可能会丢失
引用的对象:保存的入参是保存的引用，而不是拷贝，所以如果参数中的内容被修改，那么入参其实也是被修改的。

## 6.一些耗时的方法，经常被触发，如何知道谁调用的?
有时候有些方法非常耗时或者非常重要，需要知道到底是谁发起的调用，比如System.gc(),有时候如果你发现fullgc频繁是因为System.gc()引起的，你需要查看到底是什么应用调用的，那么你就可以使用下面的命令
我们可以输入下面的命令:
```shell
$ options unsafe true
 NAME    BEFORE-VALUE  AFTER-VALUE                                                                                                                                                                        
-----------------------------------                                                                                                                                                                       
 unsafe  false         true                                                                                                                                                                               
$ stack java.lang.System gc
Press Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:1) cost in 50 ms.
ts=2019-01-20 21:14:05;thread_name=main;id=1;is_daemon=false;priority=5;TCCL=sun.misc.Launcher$AppClassLoader@14dad5dc
    @java.lang.System.gc()
        at com.lz.test.Test.main(Test.java:322)

```

首先输入options unsafe true允许我们对jdk增强，然后对System.gc进行进行监视，然后记录当前的堆栈来获取是什么位置进行的调用。
## 7.如何重定义某个类?
有些时候我们找了所有的命令，发现和我们的需求并不符合的时候，那么这个时候我们可以重新定义这个类，我们可以用使用下面的命令。
### 7.1 redefine
redefine命令提供了我们可以重新定义jvm中的class，但是使用这个命令之后class不可恢复。我们首先需要把重写的class编译出来，然后上传到我们指定的目录，进行下面的操作:
```shell
 redefine -p /tmp/Test.class
```

可以重定义我们的Test.class。从而修改逻辑，完成我们自定义的需求。
', '<h2 id="-arthas-">性能分析利器《Arthas》总结</h2>
<p>Arthas 是Alibaba开源的Java诊断工具，为什么要介绍这个工具呢？先来看看你是否都遇到这样的场景：</p>
<ul>
<li>当你线上项目出了问题，但是一打开日志发现，有些地方忘记打了日志，于是你马上补上日志，然后重新上线。</li>
<li>当你的项目某个接口执行速度较慢，为了排查问题，于是你四处加上每个方法运行时间。</li>
<li>当你发现某个类有冲突，好像在线上运行的结果和你预期的不符合，手动把线上编译出的class文件下载下来然后反编译，看看究竟class内容是什么。</li>
<li>当你发现系统突然报出某个类的Exception，却无法找到这个类是从哪个Jar包加载的。</li>
<li>当你发现有时候排查一个问题需要上游重复调用这个方法，于是你只能想尽办法利用postman等工具重现这个请求。</li>
</ul>
<p>下面我将会介绍一下Arthas的一些常用的命令和用法，看看是如何解决我们实际中的问题的，至于安装教程可以参考Arthas的github。</p>
<blockquote>
<p><a href="https://github.com/alibaba/arthas">https://github.com/alibaba/arthas</a></p>
</blockquote>
<h2 id="-">常用命令</h2>
<p>dashboard 当前系统的实时数据面板  </p>
<p>jvm 查看当前JVM信息  </p>
<p>thread 可直接查看线程的cpu占用比  </p>
<p>sc sm 快速搜索类和方法信息  </p>
<p>getstatic 查看类静态变量  </p>
<p>jad 反编译class文件  </p>
<p>mc 编译.java文件生成.class  </p>
<p>redefine 加载外部class文件到应用程序中  </p>
<p>monitor 监测方法调用次数、成功次数、失败次数、平均RT等  </p>
<p>watch tt 观测方法执行的前、后、结束、异常、耗时过大时，入参（入参属性深度可调）、返回值、异常，支持实时监测每次方法执行和方法的所有调用执行。  </p>
<p>trace 查看方法调用树耗时  </p>
<p>stack 查看方法的所有调用树路径</p>
<h2 id="1-">1.奇怪的类加载错误</h2>
<p>&emsp;&emsp;相信大家都遇到过NoSuchMethodError这个错误，一般老司机看见这个错误第一反应就是jar包版本号冲突，这种问题一般来说使用maven的一些插件就能轻松解决。  </p>
<p>&emsp;&emsp;之前遇到个奇怪的问题，我们有两个服务的client-jar包，有个类的包名和类名均是一致，在编写代码的时候没有注意到这个问题，在编译阶段由于包名和类名都是一致，所有编译阶段并没有报错，在线下的运行阶段没有问题，但是测试环境的机器中的运行阶段缺报出了问题。这个和之前的jar包版本号冲突有点不同，因为在排查的时候我们想使用A服务的client-jar包的这个类，但是这个jar包的版本号在Maven中的确是唯一的。
这个时候Arthas就可以大显神通了。</p>
<h3 id="1-1-sc-">1.1 sc命令</h3>
<p>找到对应的类，然后输出下面的命令(用例使用的是官方提供的用例):</p>
<pre><code class="language-shell">$ sc -d demo.MathGame
class-info        demo.MathGame
code-source       /private/tmp/arthas-demo.jar
name              demo.MathGame
isInterface       false
isAnnotation      false
isEnum            false
isAnonymousClass  false
isArray           false
isLocalClass      false
isMemberClass     false
isPrimitive       false
isSynthetic       false
simple-name       MathGame
modifier          public
annotation
interfaces
super-class       +-java.lang.Object
class-loader      +-sun.misc.Launcher$AppClassLoader@3d4eac69
                    +-sun.misc.Launcher$ExtClassLoader@66350f69
classLoaderHash   3d4eac69

Affect(row-cnt:1) cost in 875 ms.
</code></pre>
<p>可以看见打印出了code-source,当时发现了code-source并不是从对应的Jar包取出来的，于是发现了两个服务对于同一个类使用了同样的包名和类名，导致了这个奇怪的问题，后续通过修改包名和类名进行解决。</p>
<h3 id="1-2-jad">1.2 jad</h3>
<p>Arthas还提供了一个命令jad用来反编译,对于解决类冲突错误很有用，比如我们想知道这个类里面的代码到底是什么，直接一个jad命令就能搞定:</p>
<pre><code class="language-shell">$ jad java.lang.String

ClassLoader:

Location:

/*
* Decompiled with CFR 0_132.
*/
package java.lang;

import java.io.ObjectStreamField;
...
public final class String
implements Serializable,
Comparable&lt;String&gt;,
CharSequence {
    private final char[] value;
    private int hash;
    private static final long serialVersionUID = -6849794470754667710L;
    private static final ObjectStreamField[] serialPersistentFields = new ObjectStreamField[0];
    public static final Comparator&lt;String&gt; CASE_INSENSITIVE_ORDER = new CaseInsensitiveComparator();

    public String(byte[] arrby, int n, int n2) {
        String.checkBounds(arrby, n, n2);
        this.value = StringCoding.decode(arrby, n, n2);
    }
...</code></pre>
<p>一般通过这个命令我们就能发现和你所期待的类是否缺少了某些方法，或者某些方法有些改变，从而确定jar包冲突。</p>
<h2 id="2-">2.动态修改日志级别</h2>
<p>有很多同学可能会觉得动态修改日志有什么用呢？好像自己也没怎么用过呢？
一般来说下面这几个场景可以需要:  </p>
<p>一般大家日志级别默认是info，有时候需要查看debug的日志可能需要重新上线。
当线上某个应用流量比较大的时候，如何业务出现问题，可能会短时间之内产生大量日志，由于日志会写盘，会消耗大量的内存和磁盘IO进一步加重我们的问题严重性，进而引起雪崩。
我们可以使用动态修改日志解决我们上面两个问题</p>
<h3 id="2-1-ognl">2.1 ognl</h3>
<p>ognl是一门表达式语言，在Arthas中你可以利用这个表达式语言做很多事，比如执行某个方法，获取某个信息。再这里我们可以通过下面的命令来动态的修改日志级别:</p>
<pre><code class="language-shell">$ ognl &#39;@com.lz.test@LOGGER.logger.privateConfig&#39;
@PrivateConfig[
    loggerConfig=@LoggerConfig[root],
    loggerConfigLevel=@Level[INFO],
    intLevel=@Integer[400],
]
$ ognl &#39;@com.lz.test@LOGGER.logger.setLevel(@org.apache.logging.log4j.Level@ERROR)&#39;
null
$ ognl &#39;@com.lz.test@LOGGER.logger.privateConfig&#39;
@PrivateConfig[
    loggerConfig=@LoggerConfig[root],
    loggerConfigLevel=@Level[ERROR],
    intLevel=@Integer[200],

]
</code></pre>
<h2 id="3-">3.如何知道某个方法是否调用</h2>
<p>很多时候我们方法执行的情况和我们预期不符合，但是我们又不知道到底哪里不符合，Arthas的watch命令就能帮助我们解决这个问题。</p>
<h3 id="3-1-watch">3.1 watch</h3>
<p>watch命令顾名思义观察，他可以观察指定方法调用情况，定义了4个观察事件点， -b 方法调用前，-e 方法异常后，-s 方法返回后，-f 方法结束后。默认是-f
比如我们想知道某个方法执行的时候，参数和返回值到底是什么。注意这里的参数是方法执行完成的时候的参数，和入参不同有可能会发生变化。</p>
<pre><code class="language-shell">$ watch demo.MathGame primeFactors &quot;{params,returnObj}&quot; -x 2
Press Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:1) cost in 44 ms.
ts=2018-12-03 19:16:51; [cost=1.280502ms] result=@ArrayList[
    @Object[][
        @Integer[535629513],
    ],
    @ArrayList[
        @Integer[3],
        @Integer[19],
        @Integer[191],
        @Integer[49199],
    ],
]</code></pre>
<p>你能得到参数和返回值的情况，以及方法时间消耗的等信息。</p>
<h2 id="4-">4.如何知道某个方法耗时较多</h2>
<p>当某个方法耗时较长，这个时候你需要排查到底是某一处发生了长时间的耗时，一般这种问题比较难排查，都是通过全链路追踪trace图去进行排查，但是在本地的应用中没有trace图，这个时候需要Arthas的trace命令来进行排查问题。</p>
<h3 id="4-1-trace">4.1 trace</h3>
<p>trace 命令能主动搜索 class-pattern／method-pattern 对应的方法调用路径，渲染和统计整个调用链路上的所有性能开销和追踪调用链路。
但是trace只能追踪一层的调用链路，如果一层的链路信息不够用，可以把该链路上有问题的方法再次进行trace。
trace使用例子如下。</p>
<pre><code class="language-shell">$ trace demo.MathGame run
Press Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:1) cost in 42 ms.
`---ts=2018-12-04 00:44:17;thread_name=main;id=1;is_daemon=false;priority=5;TCCL=sun.misc.Launcher$AppClassLoader@3d4eac69
    `---[10.611029ms] demo.MathGame:run()
        +---[0.05638ms] java.util.Random:nextInt()
        +---[10.036885ms] demo.MathGame:primeFactors()
        `---[0.170316ms] demo.MathGame:print()
</code></pre>
<p>可以看见上述耗时最多的方法是primeFactors，所以我们可以对其进行trace进行再一步的排查。</p>
<h2 id="5-">5.如何使用命令重发请求？</h2>
<p>有时候排查一个问题需要上游再次调用这个方法，比如使用postMan等工具，当然Arthas提供了一个命令让替代我们来回手动请求。</p>
<h3 id="5-1-tt">5.1 tt</h3>
<p>tt官方介绍: 方法执行数据的时空隧道，记录下指定方法每次调用的入参和返回信息，并能对这些不同的时间下调用进行观测。可以看见tt可以用于录制请求，当然也支持我们重放。
如果要录制某个方法，可以用下面命令:</p>
<pre><code class="language-shell">$ tt -t demo.MathGame primeFactors
Press Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:1) cost in 66 ms.
 INDEX   TIMESTAMP            COST(ms)  IS-RET  IS-EXP   OBJECT         CLASS                          METHOD
-------------------------------------------------------------------------------------------------------------------------------------
 1000    2018-12-04 11:15:38  1.096236  false   true     0x4b67cf4d     MathGame                       primeFactors
 1001    2018-12-04 11:15:39  0.191848  false   true     0x4b67cf4d     MathGame                       primeFactors
 1002    2018-12-04 11:15:40  0.069523  false   true     0x4b67cf4d     MathGame                       primeFactors
 1003    2018-12-04 11:15:41  0.186073  false   true     0x4b67cf4d     MathGame                       primeFactors
 1004    2018-12-04 11:15:42  17.76437  true    false    0x4b67cf4d     MathGame                       primeFactors
</code></pre>
<p>上面录制了5个调用环境现场，也可以看做是录制了5个请求返回信息。比如我们想选择index为1004个的请求来重放，可以输入下面的命令。</p>
<pre><code class="language-shell">$ tt -i 1004 -p
 RE-INDEX       1004
 GMT-REPLAY     2018-12-04 11:26:00
 OBJECT         0x4b67cf4d
 CLASS          demo.MathGame
 METHOD         primeFactors
 PARAMETERS[0]  @Integer[946738738]
 IS-RETURN      true
 IS-EXCEPTION   false
 RETURN-OBJ     @ArrayList[
                    @Integer[2],
                    @Integer[11],
                    @Integer[17],
                    @Integer[2531387],
                ]
Time fragment[1004] successfully replayed.
Affect(row-cnt:1) cost in 14 ms.</code></pre>
<p>注意重放请求需要关注两点:</p>
<p>ThreadLocal 信息丢失:由于使用的是Arthas线程调用，会让threadLocal信息丢失，比如一些TraceId信息可能会丢失
引用的对象:保存的入参是保存的引用，而不是拷贝，所以如果参数中的内容被修改，那么入参其实也是被修改的。</p>
<h2 id="6-">6.一些耗时的方法，经常被触发，如何知道谁调用的?</h2>
<p>有时候有些方法非常耗时或者非常重要，需要知道到底是谁发起的调用，比如System.gc(),有时候如果你发现fullgc频繁是因为System.gc()引起的，你需要查看到底是什么应用调用的，那么你就可以使用下面的命令
我们可以输入下面的命令:</p>
<pre><code class="language-shell">$ options unsafe true
 NAME    BEFORE-VALUE  AFTER-VALUE                                                                                                                                                                        
-----------------------------------                                                                                                                                                                       
 unsafe  false         true                                                                                                                                                                               
$ stack java.lang.System gc
Press Ctrl+C to abort.
Affect(class-cnt:1 , method-cnt:1) cost in 50 ms.
ts=2019-01-20 21:14:05;thread_name=main;id=1;is_daemon=false;priority=5;TCCL=sun.misc.Launcher$AppClassLoader@14dad5dc
    @java.lang.System.gc()
        at com.lz.test.Test.main(Test.java:322)
</code></pre>
<p>首先输入options unsafe true允许我们对jdk增强，然后对System.gc进行进行监视，然后记录当前的堆栈来获取是什么位置进行的调用。</p>
<h2 id="7-">7.如何重定义某个类?</h2>
<p>有些时候我们找了所有的命令，发现和我们的需求并不符合的时候，那么这个时候我们可以重新定义这个类，我们可以用使用下面的命令。</p>
<h3 id="7-1-redefine">7.1 redefine</h3>
<p>redefine命令提供了我们可以重新定义jvm中的class，但是使用这个命令之后class不可恢复。我们首先需要把重写的class编译出来，然后上传到我们指定的目录，进行下面的操作:</p>
<pre><code class="language-shell"> redefine -p /tmp/Test.class</code></pre>
<p>可以重定义我们的Test.class。从而修改逻辑，完成我们自定义的需求。</p>
', 8, 0, 1, 2, null, '2019-03-09 17:09:38', '2019-03-07 12:53:42', 0, '9,11,12', 1, 0);INSERT INTO dbblog.book (id, title, cover, author, category_id, recommend, publisher, publish_date, page_num, grade, description, catalogue, create_time, update_time, read_num, comment_num, like_num, publish, progress, reading) VALUES (1, '深入理解Java虚拟机（第2版）', 'http://oss.dblearn.cn/dbblog/20190303/01c91a28bf944010ade45fd876e94b8c.jpg', '周志明', '4,5,6', 1, '机械工业出版社', '2013-09-01', 0, 4, '<p class="ql-align-justify">周志明，资深Java技术专家，对JavaEE企业级应用开发、OSGi、Java虚拟机和工作流等都有深入的研究，并在大量的实践中积累了丰富的经验。尤其精通Java虚拟机，撰写了大量与JVM相关的经典文章，被各大技术社区争相转载，是ITeye等技术社区公认的Java虚拟机方面的领袖人物之一。除本书外，还著有经典著作《深入理解OSGi：Equinox原理、应用与最佳实践》，广获读者好评。现任远光软件股份有限公司开发部总经理兼架构师，先后参与过国家电网、南方电网等多个国家级大型ERP项目的平台架构工作，对软件系统架构也有深刻的认识和体会。</p><p class="ql-align-justify">《深入理解Java虚拟机:JVM高级特性与最佳实践(第2版)》内容简介：第1版两年内印刷近10次，4家网上书店的评论近4?000条，98%以上的评论全部为5星级的好评，是整个Java图书领域公认的经典著作和超级畅销书，繁体版在台湾也十分受欢迎。第2版在第1版的基础上做了很大的改进：根据最新的JDK 1.7对全书内容进行了全面的升级和补充；增加了大量处理各种常见JVM问题的技巧和最佳实践；增加了若干与生产环境相结合的实战案例；对第1版中的错误和不足之处的修正；等等。第2版不仅技术更新、内容更丰富，而且实战性更强。</p><p class="ql-align-justify">《深入理解Java虚拟机:JVM高级特性与最佳实践(第2版)》共分为五大部分，围绕内存管理、执行子系统、程序编译与优化、高效并发等核心主题对JVM进行了全面而深入的分析，深刻揭示了JVM的工作原理。</p><p class="ql-align-justify">第一部分从宏观的角度介绍了整个Java技术体系、Java和JVM的发展历程、模块化，以及JDK的编译，这对理解书中后面内容有重要帮助。</p><p class="ql-align-justify">第二部分讲解了JVM的自动内存管理，包括虚拟机内存区域的划分原理以及各种内存溢出异常产生的原因；常见的垃圾收集算法以及垃圾收集器的特点和工作原理；常见虚拟机监控与故障处理工具的原理和使用方法。</p><p class="ql-align-justify">第三部分分析了虚拟机的执行子系统，包括类文件结构、虚拟机类加载机制、虚拟机字节码执行引擎。</p><p class="ql-align-justify">第四部分讲解了程序的编译与代码的优化，阐述了泛型、自动装箱拆箱、条件编译等语法糖的原理；讲解了虚拟机的热点探测方法、HotSpot的即时编译器、编译触发条件，以及如何从虚拟机外部观察和分析JIT编译的数据和结果；</p><p class="ql-align-justify">第五部分探讨了Java实现高效并发的原理，包括JVM内存模型的结构和操作；原子性、可见性和有序性在Java内存模型中的体现；先行发生原则的规则和使用；线程在Java语言中的实现原理；虚拟机实现高效并发所做的一系列锁优化措施。</p><p><br></p>', '<p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">前言</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第一部分走近Java</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第1章走近Java2</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.1概述2</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.2Java技术体系3</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.3Java发展史5</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.4Java虚拟机发展史9</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.4.1SunClassicExactVM9</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.4.2SunHotSpotVM11</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.4.3SunMobile—EmbeddedVMMeta—CircularVM12</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.4.4BEAJRockitIBMJ9VM13</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.4.5AzulVMBEALiquidVM14</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.4.6ApacheHarmonyGoogleAndroidDalvikVM14</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.4.7MicrosoftJVM及其他15</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.5展望Java技术的未来16</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.5.1模块化17</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.5.2混合语言17</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.5.3多核并行19</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.5.4进一步丰富语法20</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.5.564位虚拟机21</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.6实战：自己编译JDK22</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.6.1获取JDK源码22</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.6.2系统需求24</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.6.3构建编译环境25</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.6.4进行编译26</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.6.5在IDE工具中进行源码调试31</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">1.7本章小结35</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第二部分自动内存管理机制</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第2章Java内存区域与内存溢出异常38</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.1概述38</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.2运行时数据区域38</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.2.1程序计数器39</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.2.2Java虚拟机栈39</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.2.3本地方法栈40</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.2.4Java堆41</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.2.5方法区41</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.2.6运行时常量池42</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.2.7直接内存43</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.3HotSpot虚拟机对象探秘43</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.3.1对象的创建44</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.3.2对象的内存布局47</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.3.3对象的访问定位48</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.4实战：OutOfMemoryError异常50</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.4.1Java堆溢出51</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.4.2虚拟机栈和本地方法栈溢出53</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.4.3方法区和运行时常量池溢出56</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.4.4本机直接内存溢出59</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">2.5本章小结60</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第3章垃圾收集器与内存分配策略61</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.1概述61</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.2对象已死吗62</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.2.1引用计数算法62</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.2.2可达性分析算法64</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.2.3再谈引用65</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.2.4生存还是死亡66</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.2.5回收方法区68</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.3垃圾收集算法69</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.3.1标记—清除算法69</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.3.2复制算法70</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.3.3标记—整理算法71</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.3.4分代收集算法72</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.4HotSpot的算法实现72</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.4.1枚举根节点72</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.4.2安全点73</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.4.3安全区域74</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.5垃圾收集器75</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.5.1Serial收集器76</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.5.2ParNew收集器77</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.5.3ParallelScavenge收集器79</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.5.4SerialOld收集器80</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.5.5ParallelOld收集器80</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.5.6CMS收集器81</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.5.7G1收集器84</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.5.8理解GC日志89</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.5.9垃圾收集器参数总结90</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.6内存分配与回收策略91</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.6.1对象优先在Eden分配91</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.6.2大对象直接进入老年代93</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.6.3长期存活的对象将进入老年代95</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.6.4动态对象年龄判定97</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.6.5空间分配担保98</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">3.7本章小结100</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第4章虚拟机性能监控与故障处理工具101</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.1概述101</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.2JDK的命令行工具101</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.2.1jps：虚拟机进程状况工具104</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.2.2jstat：虚拟机统计信息监视工具105</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.2.3jinfo：Java配置信息工具106</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.2.4jmap：Java内存映像工具107</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.2.5jhat：虚拟机堆转储快照分析工具108</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.2.6jstack：Java堆栈跟踪工具109</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.2.7HSDIS：JIT生成代码反汇编111</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.3JDK的可视化工具114</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.3.1JConsole：Java监视与管理控制台115</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.3.2VisualVM：多合一故障处理工具122</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">4.4本章小结131</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第5章调优案例分析与实战132</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.1概述132</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.2案例分析132</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.2.1高性能硬件上的程序部署策略132</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.2.2集群间同步导致的内存溢出135</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.2.3堆外内存导致的溢出错误136</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.2.4外部命令导致系统缓慢137</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.2.5服务器JVM进程崩溃138</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.2.6不恰当数据结构导致内存占用过大139</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.2.7由Windows虚拟内存导致的长时间停顿141</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.3实战：Eclipse运行速度调优142</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.3.1调优前的程序运行状态142</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.3.2升级JDK1.6的性能变化及兼容问题145</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.3.3编译时间和类加载时间的优化150</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.3.4调整内存设置控制垃圾收集频率153</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.3.5选择收集器降低延迟157</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">5.4本章小结160</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第三部分虚拟机执行子系统</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第6章类文件结构162</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.1概述162</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.2无关性的基石162</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.3Class类文件的结构164</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.3.1魔数与Class文件的版本166</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.3.2常量池167</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.3.3访问标志173</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.3.4类索引、父类索引与接口索引集合174</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.3.5字段表集合175</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.3.6方法表集合178</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.3.7属性表集合180</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4字节码指令简介196</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4.1字节码与数据类型197</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4.2加载和存储指令199</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4.3运算指令200</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4.4类型转换指令202</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4.5对象创建与访问指令203</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4.6操作数栈管理指令203</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4.7控制转移指令204</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4.8方法调用和返回指令204</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4.9异常处理指令205</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.4.10同步指令205</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.5公有设计和私有实现206</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.6Class文件结构的发展207</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">6.7本章小结208</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第7章虚拟机类加载机制209</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.1概述209</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.2类加载的时机210</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.3类加载的过程214</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.3.1加载214</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.3.2验证216</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.3.3准备219</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.3.4解析220</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.3.5初始化225</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.4类加载器227</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.4.1类与类加载器228</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.4.2双亲委派模型229</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.4.3破坏双亲委派模型233</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">7.5本章小结235</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第8章虚拟机字节码执行引擎236</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.1概述236</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.2运行时栈帧结构236</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.2.1局部变量表238</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.2.2操作数栈242</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.2.3动态连接243</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.2.4方法返回地址243</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.2.5附加信息244</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.3方法调用244</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.3.1解析244</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.3.2分派246</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.3.3动态类型语言支持258</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.4基于栈的字节码解释执行引擎269</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.4.1解释执行269</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.4.2基于栈的指令集与基于寄存器的指令集270</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.4.3基于栈的解释器执行过程272</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">8.5本章小结275</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第9章类加载及执行子系统的案例与实战276</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.1概述276</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.2案例分析276</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.2.1Tomcat：正统的类加载器架构276</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.2.2OSGi：灵活的类加载器架构279</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.2.3字节码生成技术与动态代理的实现282</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.2.4Retrotranslator：跨越JDK版本286</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.3实战：自己动手实现远程执行功能289</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.3.1目标290</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.3.2思路290</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.3.3实现291</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.3.4验证298</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">9.4本章小结299</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第四部分程序编译与代码优化</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第10章早期（编译期）优化302</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.1概述302</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.2Javac编译器303</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.2.1Javac的源码与调试303</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.2.2解析与填充符号表305</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.2.3注解处理器307</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.2.4语义分析与字节码生成307</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.3Java语法糖的味道311</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.3.1泛型与类型擦除311</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.3.2自动装箱、拆箱与遍历循环315</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.3.3条件编译317</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.4实战：插入式注解处理器318</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.4.1实战目标318</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.4.2代码实现319</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.4.3运行与测试326</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.4.4其他应用案例327</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">10.5本章小结328</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第11章晚期（运行期）优化329</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.1概述329</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.2HotSpot虚拟机内的即时编译器329</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.2.1解释器与编译器330</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.2.2编译对象与触发条件332</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.2.3编译过程337</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.2.4查看及分析即时编译结果339</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.3编译优化技术345</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.3.1优化技术概览346</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.3.2公共子表达式消除350</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.3.3数组边界检查消除351</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.3.4方法内联352</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.3.5逃逸分析354</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.4Java与C/C++的编译器对比356</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">11.5本章小结358</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第五部分高效并发</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第12章Java内存模型与线程360</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.1概述360</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.2硬件的效率与一致性361</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.3Java内存模型362</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.3.1主内存与工作内存363</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.3.2内存间交互操作364</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.3.3对于volatile型变量的特殊规则366</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.3.4对于long和double型变量的特殊规则372</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.3.5原子性、可见性与有序性373</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.3.6先行发生原则375</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.4Java与线程378</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.4.1线程的实现378</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.4.2Java线程调度381</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.4.3状态转换383</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">12.5本章小结384</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">第13章线程安全与锁优化385</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.1概述385</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.2线程安全385</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.2.1Java语言中的线程安全386</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.2.2线程安全的实现方法390</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.3锁优化397</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.3.1自旋锁与自适应自旋398</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.3.2锁消除398</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.3.3锁粗化400</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.3.4轻量级锁400</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.3.5偏向锁402</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">13.4本章小结403</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">附录</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">附录A编译Windows版的OpenJDK406</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">附录B虚拟机字节码指令表414</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">附录CHotSpot虚拟机主要参数表420</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">附录D对象查询语言（OQL）简介424</span></p><p><span style="background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);">附录EJDK历史版本轨迹430</span></p>', '2019-03-03 23:33:11', '2019-03-03 23:33:11', 19, 0, 0, 1, 10, 1);INSERT INTO dbblog.book_note (id, title, description, author, content, content_format, read_num, comment_num, like_num, cover, book_id, chapter, create_time, update_time, recommend, category_id, publish, cover_type, top) VALUES (1, 'Java虚拟机01——Java内存数据区域和内存溢出异常', 'Java虚拟机在执行Java程序的过程中会把它所管理的内存划分为若干个不同的数据区域。这些区域都有各自的用途，以及创建和销毁的时间，有的区域随着虚拟机进程的启动而存在，有些区域则依赖用户线程的启动和结束而建立和销毁.', 'Bobbi', '# 运行时数据区域
> Java虚拟机在执行Java程序的过程中会把它所管理的内存划分为若干个不同的数据区域。这些区域都有各自的用途，以及创建和销毁的时间，有的区域随着虚拟机进程的启动而存在，有些区域则依赖用户线程的启动和结束而建立和销毁。根据《Java虚拟机规范（Java SE 7版）》的规定，Java虚拟机所管理的内存将会包括以下几个运行时数据区域，如下图所示：
我们可以将上面的数据区域分为线程独有、线程共享及其他三大区域：
## 1.1. 线程独有的数据区域
### 1. 程序计数器（Program Counter Register）
1.   当前线程所执行的字节码的行号指示器。
2. 用于选取下一条需要执行的字节码指令，分支、循环、跳转、异常处理、线程恢复需要依赖这个计数

### 2. 虚拟机栈（Java Stack）
位于线程私有的内存中，生命周期与线程相同。
描述了Java方法执行的内存模型。
方法执行时使用栈帧（Stack Frame）来存储局部变量表、操作数栈、动态链接、方法出口等信息。
如果线程请求的栈深度大于虚拟机所允许的深度，将抛出StackOverflowError异常。
如果虚拟机栈可以动态扩展，如果扩展时无法申请到足够的内存，就会抛出OutOfMemoryError异常。
### 3. 本地方法栈（Native Method Stack）
与虚拟机栈相类似，区域在于本地方法栈为虚拟机使用到的Native方法服务。
可以由虚拟机设计者自己实现。
本地方法栈区域也会抛出==StackOverflowError==和==OutOfMemoryError==异常
## 1.2. 线程共享的数据区域
Java堆（Heap）
是Java虚拟机所管理内存中最大的一块，在虚拟机启动时创建。
在Java虚拟机规范中的描述是：所有的对象实例以及数组都要在堆上分配。随着JIT编译器的发展与逃逸分析技术逐渐成熟，栈上分配、标量替换优化技术导致某些对象并没有分配在堆上。
Java GC工作的主要区域。现代收集器基本都采用分代收集算法，所以Java堆中还可以细分为新生代和老年代；再细致一点的有Eden空间、From Survivor空间、To Survivor空间等。
如果在堆中没有内存完成实例分配，并且堆也无法再扩展时，将会抛出==OutOfMemoryError==异常。
方法区（Method Area）
用于存储已被虚拟机加载的类信息、常量、静态变量、即时编译器编译后的代码等数据。
它有一个别名叫做Non-Heap（非堆），目的应该是与Java堆区分开来。
HotSpot虚拟机选择把GC分代收集扩展至方法区，即使用永久代来实现方法区，因此也有人将此区域称为“永久代”；JDK 1.7的HotSpot中，已经把原本放在永久代的字符串常量池移出，并逐步改为采用Native Memory来实现方法区的规划。
根据Java虚拟机规范的规定，当方法区无法满足内存分配需求时，将抛出==OutOfMemoryError==异常。
运行时常量池（Runtime Constant Pool）
运行时常量池是方法区的一部分。
Class文件中除了有类的版本、字段、方法、接口等描述信息外，还有一项信息是常量池（Constant Pool Table），用于存放编译期生成的各种字面量和符号引用，这部分内容将在类加载后进入方法区的运行时常量池中存放。
当常量池无法再申请到内存时会抛出==OutOfMemoryError==异常。
## 1.3. 其他区域
直接内存（Direct Memory）
直接内存并不是虚拟机运行时数据区的一部分，也不是Java虚拟机规范中定义的内存区域。
这部分内存也可能导致OutOfMemoryError异常出现。
', '<h1 id="-">运行时数据区域</h1>
<blockquote>
<p>Java虚拟机在执行Java程序的过程中会把它所管理的内存划分为若干个不同的数据区域。这些区域都有各自的用途，以及创建和销毁的时间，有的区域随着虚拟机进程的启动而存在，有些区域则依赖用户线程的启动和结束而建立和销毁。根据《Java虚拟机规范（Java SE 7版）》的规定，Java虚拟机所管理的内存将会包括以下几个运行时数据区域，如下图所示：
我们可以将上面的数据区域分为线程独有、线程共享及其他三大区域：</p>
</blockquote>
<h2 id="1-1-">1.1. 线程独有的数据区域</h2>
<h3 id="1-program-counter-register-">1. 程序计数器（Program Counter Register）</h3>
<ol>
<li>当前线程所执行的字节码的行号指示器。</li>
<li>用于选取下一条需要执行的字节码指令，分支、循环、跳转、异常处理、线程恢复需要依赖这个计数</li>
</ol>
<h3 id="2-java-stack-">2. 虚拟机栈（Java Stack）</h3>
<p>位于线程私有的内存中，生命周期与线程相同。
描述了Java方法执行的内存模型。
方法执行时使用栈帧（Stack Frame）来存储局部变量表、操作数栈、动态链接、方法出口等信息。
如果线程请求的栈深度大于虚拟机所允许的深度，将抛出StackOverflowError异常。
如果虚拟机栈可以动态扩展，如果扩展时无法申请到足够的内存，就会抛出OutOfMemoryError异常。</p>
<h3 id="3-native-method-stack-">3. 本地方法栈（Native Method Stack）</h3>
<p>与虚拟机栈相类似，区域在于本地方法栈为虚拟机使用到的Native方法服务。
可以由虚拟机设计者自己实现。
本地方法栈区域也会抛出==StackOverflowError==和==OutOfMemoryError==异常</p>
<h2 id="1-2-">1.2. 线程共享的数据区域</h2>
<p>Java堆（Heap）
是Java虚拟机所管理内存中最大的一块，在虚拟机启动时创建。
在Java虚拟机规范中的描述是：所有的对象实例以及数组都要在堆上分配。随着JIT编译器的发展与逃逸分析技术逐渐成熟，栈上分配、标量替换优化技术导致某些对象并没有分配在堆上。
Java GC工作的主要区域。现代收集器基本都采用分代收集算法，所以Java堆中还可以细分为新生代和老年代；再细致一点的有Eden空间、From Survivor空间、To Survivor空间等。
如果在堆中没有内存完成实例分配，并且堆也无法再扩展时，将会抛出==OutOfMemoryError==异常。
方法区（Method Area）
用于存储已被虚拟机加载的类信息、常量、静态变量、即时编译器编译后的代码等数据。
它有一个别名叫做Non-Heap（非堆），目的应该是与Java堆区分开来。
HotSpot虚拟机选择把GC分代收集扩展至方法区，即使用永久代来实现方法区，因此也有人将此区域称为“永久代”；JDK 1.7的HotSpot中，已经把原本放在永久代的字符串常量池移出，并逐步改为采用Native Memory来实现方法区的规划。
根据Java虚拟机规范的规定，当方法区无法满足内存分配需求时，将抛出==OutOfMemoryError==异常。
运行时常量池（Runtime Constant Pool）
运行时常量池是方法区的一部分。
Class文件中除了有类的版本、字段、方法、接口等描述信息外，还有一项信息是常量池（Constant Pool Table），用于存放编译期生成的各种字面量和符号引用，这部分内容将在类加载后进入方法区的运行时常量池中存放。
当常量池无法再申请到内存时会抛出==OutOfMemoryError==异常。</p>
<h2 id="1-3-">1.3. 其他区域</h2>
<p>直接内存（Direct Memory）
直接内存并不是虚拟机运行时数据区的一部分，也不是Java虚拟机规范中定义的内存区域。
这部分内存也可能导致OutOfMemoryError异常出现。</p>
', 11, 0, 1, null, 1, '第2章 Java内存区域与内存溢出异常', '2019-03-09 17:11:05', '2019-03-04 17:51:15', 1, '4,5,6', 1, 2, null);INSERT INTO dbblog.category (id, name, type, `rank`, parent_id) VALUES (1, '漫谈', 0, 0, -1);
INSERT INTO dbblog.category (id, name, type, `rank`, parent_id) VALUES (2, '本站相关', 0, 1, 1);
INSERT INTO dbblog.category (id, name, type, `rank`, parent_id) VALUES (3, '关于', 0, 2, 2);
INSERT INTO dbblog.category (id, name, type, `rank`, parent_id) VALUES (4, '后端', 1, 0, -1);
INSERT INTO dbblog.category (id, name, type, `rank`, parent_id) VALUES (5, 'Java进阶', 1, 1, 4);
INSERT INTO dbblog.category (id, name, type, `rank`, parent_id) VALUES (6, 'JVM', 1, 2, 5);
INSERT INTO dbblog.category (id, name, type, `rank`, parent_id) VALUES (9, '后端', 0, 0, -1);
INSERT INTO dbblog.category (id, name, type, `rank`, parent_id) VALUES (11, 'Java基础', 0, 1, 9);
INSERT INTO dbblog.category (id, name, type, `rank`, parent_id) VALUES (12, '面试', 0, 2, 11);INSERT INTO dbblog.recommend (id, link_id, type, order_num, title, top) VALUES (3, 1, 0, 1, '关于本站和博主', 1);
INSERT INTO dbblog.recommend (id, link_id, type, order_num, title, top) VALUES (4, 1, 2, 2, 'Java虚拟机01——Java内存数据区域和内存溢出异常', 0);INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (1, 0, '系统管理', null, null, 0, 'config', 3);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (2, 1, '管理员列表', 'sys/user', null, 1, 'admin', 1);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (3, 1, '角色管理', 'sys/role', null, 1, 'role', 2);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (4, 1, '菜单管理', 'sys/menu', null, 1, 'menu', 3);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (5, 1, 'SQL监控', 'http://localhost:8080/dbblog/druid/sql.html', null, 1, 'config', 5);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (15, 2, '查看', null, 'sys:user:list,sys:user:info', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (16, 2, '新增', null, 'sys:user:save,sys:role:select', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (17, 2, '修改', null, 'sys:user:update,sys:role:select', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (18, 2, '删除', null, 'sys:user:delete', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (19, 3, '查看', null, 'sys:role:list,sys:role:info', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (20, 3, '新增', null, 'sys:role:save,sys:menu:list', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (21, 3, '修改', null, 'sys:role:update,sys:menu:list', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (22, 3, '删除', null, 'sys:role:delete', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (23, 4, '查看', null, 'sys:menu:list,sys:menu:info', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (24, 4, '新增', null, 'sys:menu:save,sys:menu:select', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (25, 4, '修改', null, 'sys:menu:update,sys:menu:select', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (26, 4, '删除', null, 'sys:menu:delete', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (30, 0, '博文管理', null, null, 0, 'article', 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (31, 30, '新增博文', 'article/article-add-or-update', 'article:save,article:update', 1, 'add', 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (32, 30, '博文列表', 'article/article', null, 1, 'list', 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (33, 32, '删除', null, 'article:delete', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (34, 32, '查看', null, 'article:list', 2, null, 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (38, 43, '分类管理', 'operation/category', null, 1, 'category', 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (39, 38, '查看', null, 'operation:category:list,operation:category:info', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (40, 38, '新增', null, 'operation:category:save', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (41, 38, '修改', null, 'operation:category:update', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (42, 38, '删除', null, 'operation:category:delete', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (43, 0, '运营管理', null, null, 0, 'operation', 2);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (45, 1, '系统参数', 'sys/param', null, 1, 'param', 4);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (46, 45, '查看', null, 'sys:param:list,sys:param:info', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (47, 45, '新增', null, 'sys:param:save', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (48, 45, '修改', null, 'sys:param:update', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (49, 45, '删除', null, 'sys:param:delete', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (50, 43, '标签管理', 'operation/tag', null, 1, 'tag', 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (51, 50, '查看', null, 'operation:tag:list,operation:tag:info', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (52, 50, '新增', null, 'operation:tag:save', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (53, 50, '修改', null, 'operation:tag:update', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (54, 50, '删除', null, 'operation:tag:delete', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (61, 66, '图书管理', 'book/book', null, 1, 'list', 3);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (62, 61, '查看', null, 'book:list,book:info', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (63, 61, '新增', null, 'book:save', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (64, 61, '修改', null, 'book:update', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (65, 61, '删除', null, 'book:delete', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (66, 0, '阅读管理', null, null, 0, 'read', 1);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (67, 66, '新增图书', 'book/book-add-or-update', '', 1, 'add', 1);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (68, 66, '笔记管理', 'book/note', null, 1, 'list', 2);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (69, 68, '查看', null, 'book:note:list,book:note:info', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (70, 68, '新增', null, 'book:note:save', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (71, 68, '修改', null, 'book:note:update', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (72, 68, '删除', null, 'book:note:delete', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (73, 66, '新增笔记', 'book/note-add-or-update', '', 1, 'add', 0);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (74, 43, '友链管理', 'operation/link', null, 1, 'link', 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (75, 74, '查看', null, 'operation:link:list,operation:link:info', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (76, 74, '新增', null, 'operation:link:save', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (77, 74, '修改', null, 'operation:link:update', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (78, 74, '删除', null, 'operation:link:delete', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (79, 43, '推荐管理', 'operation/recommend', null, 1, 'recommend', 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (80, 79, '查看', null, 'operation:recommend:list,operation:recommend:info', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (81, 79, '新增', null, 'operation:recommend:save', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (82, 79, '修改', null, 'operation:recommend:update', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (83, 79, '删除', null, 'operation:recommend:delete', 2, null, 6);
INSERT INTO dbblog.sys_menu (menu_id, parent_id, name, url, perms, type, icon, order_num) VALUES (84, 32, '刷新缓存', null, 'article:cache:refresh', 2, null, 0);INSERT INTO dbblog.sys_param (id, par_key, par_value, menu_url, type) VALUES (2, 0, '一级', '/operation-category', 'CATEGORY_RANK');
INSERT INTO dbblog.sys_param (id, par_key, par_value, menu_url, type) VALUES (3, 1, '二级', '/operation-category', 'CATEGORY_RANK');
INSERT INTO dbblog.sys_param (id, par_key, par_value, menu_url, type) VALUES (4, 2, '三级', '/operation-category', 'CATEGORY_RANK');
INSERT INTO dbblog.sys_param (id, par_key, par_value, menu_url, type) VALUES (7, 0, '小图片', '/article-addOrUpdate', 'ARTICLE_COVER_TYPE');
INSERT INTO dbblog.sys_param (id, par_key, par_value, menu_url, type) VALUES (8, 1, '大图片', '/article-addOrUpdate', 'ARTICLE_COVER_TYPE');
INSERT INTO dbblog.sys_param (id, par_key, par_value, menu_url, type) VALUES (9, 2, '无图片', '/article-addOrUpdate', 'ARTICLE_COVER_TYPE');
INSERT INTO dbblog.sys_param (id, par_key, par_value, menu_url, type) VALUES (10, 0, '文章', null, 'MODULE_TYPE');
INSERT INTO dbblog.sys_param (id, par_key, par_value, menu_url, type) VALUES (11, 1, '图书', null, 'MODULE_TYPE');
INSERT INTO dbblog.sys_param (id, par_key, par_value, menu_url, type) VALUES (12, 2, '笔记', null, 'MODULE_TYPE');truncate sys_user;

INSERT INTO dbblog.sys_user (user_id, username, password, email, salt, create_user_id, create_time, status) VALUES (1, 'admin', 'cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a', '571002217@qq.com', 'YzcmCZNvbXocrsz9dm8e', '1', '2019-04-23 19:17:00', 1);INSERT INTO dbblog.tag (id, name, type) VALUES (1, '本站相关', 0);
INSERT INTO dbblog.tag (id, name, type) VALUES (2, '关于', 0);
INSERT INTO dbblog.tag (id, name, type) VALUES (3, 'Java', 1);
INSERT INTO dbblog.tag (id, name, type) VALUES (4, 'JVM', 1);
INSERT INTO dbblog.tag (id, name, type) VALUES (5, 'Java', 2);
INSERT INTO dbblog.tag (id, name, type) VALUES (6, 'JVM', 2);
INSERT INTO dbblog.tag (id, name, type) VALUES (7, 'Java', 0);
INSERT INTO dbblog.tag (id, name, type) VALUES (8, '面试', 0);
INSERT INTO dbblog.tag (id, name, type) VALUES (9, 'ElasticSearch', 0);
INSERT INTO dbblog.tag (id, name, type) VALUES (10, 'Arthas', 0);INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (3, 3, 1, 1);
INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (4, 4, 1, 1);
INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (49, 1, 1, 0);
INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (50, 2, 1, 0);
INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (55, 5, 1, 2);
INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (56, 6, 1, 2);
INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (75, 7, 3, 0);
INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (76, 8, 3, 0);
INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (77, 9, 4, 0);
INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (78, 7, 4, 0);
INSERT INTO dbblog.tag_link (id, tag_id, link_id, type) VALUES (82, 10, 5, 0);