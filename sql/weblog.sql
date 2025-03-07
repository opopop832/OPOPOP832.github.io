/*
 Navicat Premium Data Transfer

 Source Server         : 主机
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : weblog

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 07/01/2025 19:04:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `title_image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文章题图',
  `description` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  `read_num` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '被阅读次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (1, 'Java之反射', 'http://127.0.0.1:9005/img/7d0428da095d405380f0aa0ad69e4598.png', 'ava的反射（reﬂection）机制是在运行状态中，对于任意一个类，都能够知道这个类的所有属性和方法；对于任意一个对象，都能够调用它的任意方法和属性，既然能拿到那么，我们就可以修改部分类型信息；这种动态获取信息以及动态调用对象方法的功能称为java语言的反射（reﬂection）机制。', '2024-10-31 13:42:21', '2024-11-04 18:11:17', 0, 4);
INSERT INTO `t_article` VALUES (2, 'python中pandas的使用', 'http://127.0.0.1:9005/img/3206d5ad8488441995f2aeb166c42a2a.png', 'Pandas 是一个开源的 Python 数据分析库，它提供了快速、灵活且表达力强的数据结构，旨在使“关系”或“标签”数据的操作既简单又直观。它主要用于数据清洗和分析工作。', '2024-11-04 18:24:03', '2024-11-04 18:25:52', 0, 3);
INSERT INTO `t_article` VALUES (3, '常用中间件介绍', 'http://127.0.0.1:9005/img/4941511aa07643b29216bc5f99fad3c7.png', '常用中间件的介绍', '2024-11-16 11:41:29', '2024-11-16 11:41:29', 0, 4);
INSERT INTO `t_article` VALUES (4, '异常处理机制-try-catch', 'http://127.0.0.1:9005/img/fd167cff48874db4bd1ce0a1c5e44edd.png', '异常指的并不是语法错误和逻辑错误。语法错了，编译不通过，不会产生字节码文件，根本不能运行。\n代码逻辑错误，只是没有得到想要的结果', '2025-01-05 18:54:58', '2025-01-05 18:54:58', 0, 1);
INSERT INTO `t_article` VALUES (5, '123456', 'http://127.0.0.1:9005/img/6d5c4645853f468a8bbeac905fb24445.webp', 'test', '2025-01-06 20:39:33', '2025-01-06 20:39:33', 0, 1);

-- ----------------------------
-- Table structure for t_article_category_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_article_category_rel`;
CREATE TABLE `t_article_category_rel`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` bigint UNSIGNED NOT NULL COMMENT '文章id',
  `category_id` bigint UNSIGNED NOT NULL COMMENT '分类id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_article_id`(`article_id` ASC) USING BTREE,
  INDEX `idx_category_id`(`category_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章所属分类映射表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_category_rel
-- ----------------------------
INSERT INTO `t_article_category_rel` VALUES (2, 1, 2);
INSERT INTO `t_article_category_rel` VALUES (4, 2, 2);
INSERT INTO `t_article_category_rel` VALUES (5, 3, 2);
INSERT INTO `t_article_category_rel` VALUES (6, 4, 2);
INSERT INTO `t_article_category_rel` VALUES (7, 5, 1);

-- ----------------------------
-- Table structure for t_article_content
-- ----------------------------
DROP TABLE IF EXISTS `t_article_content`;
CREATE TABLE `t_article_content`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章内容id',
  `article_id` bigint NOT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章内容表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_content
-- ----------------------------
INSERT INTO `t_article_content` VALUES (1, 1, '# 反射\n## 定义\nJava的反射（reﬂection）机制是在运行状态中，对于任意一个类，都能够知道这个类的所有属性和方法；对于任意一个对象，都能够调用它的任意方法和属性，既然能拿到那么，我们就可以修改部分类型信息；这种动态获取信息以及动态调用对象方法的功能称为java语言的反射（reﬂection）机制。\n\n## 主要用途\n1.动态地创建类的实例：在运行时根据类的全限定名创建对象。\n2.检查类的结构：获取类的成员变量、方法、构造器等信息。\n3.调用方法：在运行时动态地调用对象的方法。\n4.访问和修改私有字段：即使在类定义中字段是私有的，也可以通过反射来访问和修改。 \n\n反射相关的类\n| 类名 | 用途 |\n| - | - |\n| Class类 | 代表类的实体，在运行的Java应用程序中表示类和接口 |\n| Filed类 | c代表类的成员变量/类的属性 |\n| Method类 | 代表类的方法 |\n| Constructor类 | 代表类的构造方法 |');
INSERT INTO `t_article_content` VALUES (2, 2, 'Pandas 是一个开源的 Python 数据分析库，它提供了快速、灵活且表达力强的数据结构，旨在使“关系”或“标签”数据的操作既简单又直观。它主要用于数据清洗和分析工作。以下是 Pandas 的一些基本用法：\n  1、安装 Pandas：\n  使用 pip 可以轻松安装 Pandas：\n  ```bash\npip install pandas\n\n```\n  2、导入 Pandas：\n  在 Python 代码中使用 Pandas 之前，需要先导入它：\n  ```python\nimport pandas as pd\n```\n  3、创建 DataFrame：\nDataFrame 是 Pandas 中最常用的数据结构，类似于 Excel 中的表格。可以通过多种方式创建 DataFrame：\n```language\n# 从字典创建\ndata = {\'Column1\': [1, 2], \'Column2\': [\'a\', \'b\']}\ndf = pd.DataFrame(data)\n\n# 从 CSV 文件加载\ndf = pd.read_csv(\'file.csv\')\n\n# 从 SQL 数据库查询\nimport sqlite3\nconn = sqlite3.connect(\'example.db\')\nquery = \"SELECT * FROM table_name\"\ndf = pd.read_sql_query(query, conn)\n```\n4、查看数据：\n\ndf.head()：查看前几行数据，默认是前5行。\ndf.tail()：查看最后几行数据，默认是最后5行。\n5、选择数据：\n\n通过列名选择列：df[\'Column1\']\n通过条件选择行：df[df[\'Column1\'] > 1]\n\n6、数据清洗：\n\n删除缺失值：df.dropna()\n填充缺失值：df.fillna(value)\n7、数据合并：\n\n纵向合并（追加）：pd.concat([df1, df2])\n横向合并（连接）：pd.merge(df1, df2, on=\'key\')\n8、数据分组：\n\n根据某个列的值对数据进行分组：df.groupby(\'Column1\')\n9、数据聚合：\n\n对分组后的数据进行聚合操作，如求和、平均值等：df.groupby(\'Column1\').Column2.sum()\n10、数据透视表：\n\n创建数据透视表：pd.pivot_table(df, values=\'Column1\', index=\'Column2\', columns=\'Column3\', aggfunc=\'mean\')\n11、时间序列：\n\nPandas 支持时间序列数据的操作，可以轻松地对时间戳进行索引和切片。\n12、保存数据：\n\n将 DataFrame 保存到 CSV 文件：df.to_csv(\'newfile.csv\', index=False)\n\nPandas 的功能非常强大，这里只是简单介绍了一些基本用法。在实际的数据科学和数据分析工作中，Pandas 是一个不可或缺的工具。\n\n');
INSERT INTO `t_article_content` VALUES (3, 3, '1. RabbitMQ\n\n \n\nRabbitMQ是一个基于AMQP（Advanced Message Queuing Protocol，高级消息队列协议）的开源消息代理软件，实现了面向消息的中间件。它支持消息持久化、队列、交换机（Exchange）和绑定（Binding）等核心概念。RabbitMQ 使用Erlang语言编写，具有高可用性和容错性。它支持多种消息传递模式，如直连交换（Direct Exchange）、主题交换（Topic Exchange）和扇形交换（Fanout Exchange）等。\n\n \n\n2. Kafka\n\n \n\nApache Kafka是一个分布式流处理平台，能够处理高吞吐量的实时数据流。它使用发布/订阅消息传递模式，但消息被持久化存储在主题（Topic）的分区日志中。Kafka 支持消息复制和分区再均衡，以确保消息的高可靠性和可用性。Kafka 还提供了Kafka StreamsAPI，用于构建实时数据流处理应用程序。\n\n \n\n3. ActiveMQ\n\n \n\nApache ActiveMQ是一个开源的、遵循JMS（Java Message Service，Java消息服务）规范的消息中间件。它支持多种消息传递协议，如AMQP、STOMP、MQTT和OpenWire等。ActiveMQ 提供了消息持久化、事务支持、负载均衡和高可用性等功能。它可以使用JDBC、内存、LevelDB或KahaDB等作为持久化存储。\n\n \n\n4. ZeroMQ\n\n \n\nZeroMQ是一个高性能的异步消息库，用于在分布式或并发应用程序中构建通信。它提供了消息队列、发布/订阅、请求/回复等通信模式。ZeroMQ 采用了无锁队列、消息帧和批处理等技术来优化性能，以实现极低的延迟和高吞吐量。它支持多种编程语言，并提供了丰富的 API。\n\n \n\n5. RocketMQ\n\n \n\nApache RocketMQ是阿里巴巴开源的一个分布式消息中间件，设计用于处理海量消息。它支持顺序消息、事务消息、定时消息和批量消息等特性。RocketMQ 采用了NameServer和Broker的分布式架构，支持消息持久化、消息复制和高可用性。它还提供了丰富的监控和管理工具，用于监控消息传递的状态和性能。\n');
INSERT INTO `t_article_content` VALUES (4, 4, '一、异常概述\n在使用计算机语言进行项目开发的过程中，即使程序员把代码写得尽善尽美，在系统的运行过程中仍然会遇到一些问题，因为很多问题不是靠代码能够避免的，比如：客户输入数据的格式问题，读取文件是否存在 ，网络是否始终保持通畅等等。\n异常：指的是程序在执行过程中，出现的非正常情况，如果不处理最终会导致JVM的非正常停止。\n\n异常指的并不是语法错误和逻辑错误。语法错了，编译不通过，不会产生字节码文件，根本不能运行。\n代码逻辑错误，只是没有得到想要的结果，例如:求a与b的和，你写成了a-b\n\n1、异常的抛出机制\nJava中是如何表示不同的异常情况，又是如何让程序员得知，并处理异常的呢?\nJava中把不同的异常用不同的类表示，一旦发生某种异常，就创建该异常类型的对象，并且抛出(throw)。然后程序员可以捕获(catch)到这个异常对象，并处理；如果没有捕获(catch)这个异常对象，那么这个异常对象将会导致程序终止。\n举例:\n运行下面的程序，程序会产生一个数组角标越界异常ArrayIndexOfBoundsException。我们通过图解来解析下异常产生和抛出的过程。\n\n2、如何对待异常\n对于程序出现的异常，一般有两种解决方法：一是遇到错误就终止程序的运行。另一种方法是程序员在编写程序时，就充分考虑到各种可能发生的异常和错误，极力预防和避免。实在无法避免的，要编写相应的代码进行异常的检测、以及 异常的处理，保证代码的 健壮性。\n\n3、异常的体系结构\n3.1、Throwable\njava.lang.Throwable：异常体系的父类\nThrowable中的常用方法:\n\npublic void printStackTrace()：打印异常的详细信息。\n包含了异常的类型、异常的原因、异常出现的位置、在开发和调试阶段都得使用printStackTrace。\npublic String getMessage()：获取发生异常的原因。\n3.2、Error和Exception\nThrowable可分为两类：Error和Exception。分别对应着java.lang.Error与java.lang.Exception 两个类。\nError：Java虚拟机无法解决的严重问题。如：JVM系统内部错误、资源耗尽等严重情况。一般不编写针对性的代码进行处理。\n\n例如：StackOverflowError(栈内存溢出)和OutOfMemoryError(堆内存溢出，简称OOM)。\nException: 其它因编程错误或偶然的外在因素导致的一般性问题，需要使用针对性的代码进行处理，使程序继续运行。否则一旦发生异常，程序也会挂掉。例如:\n\n空指针访问\n试图读取不存在的文件\n网络连接中断\n数组角标越界\n3.3、编译时异常和运行时异常\n编译时期异常(即checked异常、受检异常)：在代码编译阶段，编译器就能明确 警示 当前代码 可能发生(不是一定发生) xx异常，并 明确督促 程序员提前编写处理它的代码。如果程序员 没有编写 对应的异常处理代码，则编译器就会直接判定编译失败，从而不能生成字节码文件。通常，这类异常的发生不是由程序员的代码引起的，或者不是靠加简单判断就可以避免的，例如:FileNotFoundException(文件找不到异常)。\n运行时期异常(即runtime异常、unchecked异常、非受检异常)：在代码编译阶段，编译器完全不做任何检查，无论该异常是否会发生，编译器都不给出任何提示。只有等代码运行起来并确实发生了xx异常，它才能被发现。通常，这类异常是由程序员的代码编写不当引起的，只要稍加判断，或者细心检查就可以避免。\njava.lang.RuntimeException类及它的子类都是运行时异常。比如:ArrayIndexOutOfBoundsException数组下标越界异常，ClassCastException类型转换异常。\n3.4、常见的异常有哪些？\n运行时异常：\nArrayIndexOutOfBoundsException：角标越界\nNullPointException：空指针异常\nClassCastException：类型转换异常\nNumberFormatException：无法转化异常\nInputMismatchException：输入类型异常\nArithmeticException：算术异常\n\n编译型异常\nClassNotFoundException\nFileNotFoundException\nIOException\n、异常的处理方式一 try-catch的使用\n在编写程序时，经常要在可能出现错误的地方加上检测的代码，如进行x/y运算时，要检测分母为0，数据为空，输入的不是数据而是字符 等。过多的if-else分支会导致程序的代码加长、臃肿 ，可读性差，程序员需要花很大的精力“ 堵漏洞”。因此采用异常处理机制。\n\nJava异常处理\nJava采用的异常处理机制，是将异常处理的程序代码集中在一起 ，与正常的程序代码分开，使得程序简洁、优雅，并易于维护。\n\nJava异常处理的方式:\n方式一：try-catch-finally\n方式二：throws+异常类型\n\n1、过程1：抛\n程序在执行的过程当中，一旦出现异常，就会在出现异常的代码处，生成对应的异常类对象，并将此对象抛出。\n一旦抛出此程序不执行其后面的代码。\n\n2、过程2：抓\n针对过程1中抛出的对象，进行捕获处理。此捕获处理的过程，就成为抓\n一旦将异常进行处理，代码就可以急促执行。\n\ntry{\n	...//可能出现的异常代码\n}catch(异常类型1 e){\n	...//当产生异常类型1 异常时的处置措施\n}catch(异常类型2 e){\n	...//当产生异常类型2 异常时的处置措施\n}finally{\n	...//无论是否发生异常，都无条件执行的语句\n}\n1\n2\n3\n4\n5\n6\n7\n8\n9\nimport java.util.InputMismatchException;\nimport java.util.Scanner;\n\n/**\n * package:PACKAGE_NAME\n *\n * @Author jimmy-yan\n * @Create 2024/11/18 17:14\n */\npublic class ExceptionTest {\n\n    public static void main(String[] args) {\n        ExceptionTest e = new ExceptionTest();\n        e.test();\n\n    }\n\n    public void test() {\n        try {\n            Scanner scanner = new Scanner(System.in);\n            int num = scanner.nextInt();\n            System.out.println(num);\n        } catch (InputMismatchException e) {\n            System.out.println(\"出现了InputMismatchException异常\");\n        } catch (RuntimeException e) {\n            System.out.println(\"出现了RuntimeException异常\");\n        }\n        System.out.println(\"异常处理结束，代码继续执行\");\n\n    }\n}\n\n\n1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n3、使用细节\n1、将可能出现异常的代码声明在try语句中。一旦代码出现异常，就会自动生成一个对应异常类的对象。并将此对象抛出。\n2、针对于try中抛出的异常类的对象，使用之后的catch语句进行匹配，一旦匹配上，就进入catch语句块进行处理。\n3、一旦处理结束，代码就可以继续向下执行。\n4、如果声明了多个catch结构，不同的异常类型在子父关系的情况下，谁声明在上面，谁声明在下面都可以。如果多个异常类型满足子父类的关系，必须将子类声明在父类结构的上面。否则报错。\n5、catch中异常处理的方式：\na、自己编写输出的语句；\nb、printStackTrace：打印异常的详细信息；（推荐）\n6、try中声明的变量，出了try结构之后，就不可以进行调用了。\n\n4、运行时异常案例\nimport java.util.InputMismatchException;\nimport java.util.Scanner;\n\n/**\n * package:PACKAGE_NAME\n *\n * @Author jimmy-yan\n * @Create 2024/11/18 17:14\n */\npublic class ExceptionTest {\n\n    public static void main(String[] args) {\n        ExceptionTest e = new ExceptionTest();\n        e.test1();\n    }\n\n\n    public void test1() {\n        try {\n            String str = \"123\";\n            str = \"abc\";\n            int i = Integer.parseInt(str);\n            System.out.println(i);\n\n        }catch (NumberFormatException e){\n            e.printStackTrace();\n        }\n        System.out.println(\"程序执行结束\");\n    }\n}\n\n1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n\n\n5、编译型异常案例\nimport java.io.File;\nimport java.io.FileInputStream;\nimport java.io.FileNotFoundException;\nimport java.io.IOException;\nimport java.util.InputMismatchException;\nimport java.util.Scanner;\n\n/**\n * package:PACKAGE_NAME\n *\n * @Author jimmy-yan\n * @Create 2024/11/18 17:14\n */\npublic class ExceptionTest {\n\n    public static void main(String[] args) {\n        ExceptionTest e = new ExceptionTest();\n//        e.test();\n//        e.test1();\n        e.test2();\n    }\n\n    public void test() {\n        try {\n            Scanner scanner = new Scanner(System.in);\n            int num = scanner.nextInt();\n            System.out.println(num);\n        } catch (InputMismatchException e) {\n            System.out.println(\"出现了InputMismatchException异常\");\n        } catch (RuntimeException e) {\n            System.out.println(\"出现了RuntimeException异常\");\n        }\n        System.out.println(\"异常处理结束，代码继续执行\");\n\n    }\n\n    public void test1() {\n        try {\n            String str = \"123\";\n            str = \"abc\";\n            int i = Integer.parseInt(str);\n            System.out.println(i);\n\n        } catch (NumberFormatException e) {\n            e.printStackTrace();\n        }\n        System.out.println(\"程序执行结束\");\n    }\n\n    public void test2() {\n        try {\n            File file = new File(\"D:\\\\hello.txt\");\n            FileInputStream fis = new FileInputStream(file);  //可能报FileFonudException\n\n            int data = fis.read(); //可能报IOException\n            while (data != -1) {\n                System.out.println((char) data);\n                data = fis.read(); //可能报IOException\n            }\n            fis.close();  //可能报IOException\n        } catch (FileNotFoundException e) {\n            e.printStackTrace();\n        } catch (IOException e) {\n            e.printStackTrace();\n        }\n\n    }\n}\n\n1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n16\n17\n18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50\n51\n52\n53\n54\n55\n56\n57\n58\n59\n60\n61\n62\n63\n64\n65\n66\n67\n68\n6、开发体会\n对于运行时异常：\n\n开发中，通常就不进行显示的处理了，一旦在程序执行中，出现了运行时异常，那么就根据异常的提示信息修改代码即可。\n\n对于编译型异常：\n\n一定要处理，否则代码不能执行通过```language\n\n```\n');
INSERT INTO `t_article_content` VALUES (5, 5, 'test');

-- ----------------------------
-- Table structure for t_article_tag_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_article_tag_rel`;
CREATE TABLE `t_article_tag_rel`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` bigint UNSIGNED NOT NULL COMMENT '文章id',
  `tag_id` bigint UNSIGNED NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id` ASC) USING BTREE,
  INDEX `idx_tag_id`(`tag_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章对应标签映射表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_tag_rel
-- ----------------------------
INSERT INTO `t_article_tag_rel` VALUES (2, 1, 1);
INSERT INTO `t_article_tag_rel` VALUES (4, 2, 6);
INSERT INTO `t_article_tag_rel` VALUES (5, 3, 1);
INSERT INTO `t_article_tag_rel` VALUES (6, 4, 1);
INSERT INTO `t_article_tag_rel` VALUES (7, 5, 4);

-- ----------------------------
-- Table structure for t_blog_setting
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_setting`;
CREATE TABLE `t_blog_setting`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `blog_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '博客名称',
  `author` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者名',
  `introduction` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '介绍语',
  `avatar` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者头像',
  `github_home` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'GitHub 主页访问地址',
  `csdn_home` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'CSDN 主页访问地址',
  `gitee_home` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'Gitee 主页访问地址',
  `zhihu_home` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '知乎主页访问地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog_setting
-- ----------------------------
INSERT INTO `t_blog_setting` VALUES (1, 'Weblog', 'xxx', '欢迎查看我的博客', 'http://127.0.0.1:9005/img/ec27ebd7635541bbba37383ba0b508cb.jpg', '', '', '', '');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_name`(`name` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, '前端', '2024-10-29 19:26:08', '2024-10-29 19:26:08', 0);
INSERT INTO `t_category` VALUES (2, '后端', '2024-10-29 19:26:26', '2024-10-29 19:26:26', 0);
INSERT INTO `t_category` VALUES (3, '网络', '2024-10-29 19:26:35', '2024-10-29 19:26:35', 0);
INSERT INTO `t_category` VALUES (4, '测试', '2024-10-29 19:26:56', '2024-10-29 19:26:56', 0);

-- ----------------------------
-- Table structure for t_statistics_article_pv
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_article_pv`;
CREATE TABLE `t_statistics_article_pv`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pv_date` date NOT NULL COMMENT '被统计的日期',
  `pv_count` bigint UNSIGNED NOT NULL COMMENT 'pv浏览量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_pv_date`(`pv_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '统计表 - 文章 PV' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_statistics_article_pv
-- ----------------------------
INSERT INTO `t_statistics_article_pv` VALUES (1, '2024-11-04', 2, '2024-11-04 18:04:06', '2024-11-04 18:04:05');
INSERT INTO `t_statistics_article_pv` VALUES (2, '2024-12-31', 3, '2024-12-31 20:00:56', '2024-12-31 20:00:56');
INSERT INTO `t_statistics_article_pv` VALUES (3, '2025-01-05', 2, '2025-01-05 18:59:11', '2025-01-05 18:59:10');
INSERT INTO `t_statistics_article_pv` VALUES (4, '2025-01-06', 1, '2025-01-06 22:19:40', '2025-01-06 22:19:40');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_name`(`name` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (1, 'java', '2024-10-29 19:27:11', '2024-10-29 19:27:11', 0);
INSERT INTO `t_tag` VALUES (2, 'c语言', '2024-10-29 19:27:23', '2024-10-29 19:27:23', 0);
INSERT INTO `t_tag` VALUES (3, 'mysql', '2024-10-29 19:27:34', '2024-10-29 19:27:34', 0);
INSERT INTO `t_tag` VALUES (4, 'vue', '2024-10-29 19:28:24', '2024-10-29 19:28:24', 0);
INSERT INTO `t_tag` VALUES (5, 'javascript', '2024-10-29 19:28:50', '2024-10-29 19:28:50', 0);
INSERT INTO `t_tag` VALUES (6, 'python', '2024-11-04 18:25:18', '2024-11-04 18:25:18', 0);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '$2a$10$u5If1skS5XZeX1ZnrThtNOhBEZjwNkoklbMBjYi7OQgquF/HjPJL.', '2023-07-03 11:57:18', '2024-11-16 11:37:25', 0);
INSERT INTO `t_user` VALUES (2, 'test', '$2a$10$L6ce4rQsyJ1k7ZCOfN6X4e5dHLyvg2X0t9JFEZBezDq0lds79Pxja', '2023-07-07 01:22:05', '2023-07-07 01:22:05', 0);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `role` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 'admin', 'ROLE_ADMIN', '2023-07-07 01:21:15');
INSERT INTO `t_user_role` VALUES (2, 'test', 'ROLE_VISITOR', '2023-07-07 01:23:33');

-- ----------------------------
-- Table structure for t_visitor_record
-- ----------------------------
DROP TABLE IF EXISTS `t_visitor_record`;
CREATE TABLE `t_visitor_record`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `visitor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'agent',
  `ip_address` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '127.0.0.1',
  `ip_region` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未知',
  `visit_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '访问时间',
  `is_notify` tinyint UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ip_visit_time`(`ip_address` ASC, `visit_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访客记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_visitor_record
-- ----------------------------
INSERT INTO `t_visitor_record` VALUES (1, 'agent', '113.65.205.124', '外太空', '2024-10-29 19:16:17', 0);
INSERT INTO `t_visitor_record` VALUES (2, 'agent', '113.65.205.124', '外太空', '2024-10-29 19:42:25', 0);
INSERT INTO `t_visitor_record` VALUES (3, 'agent', '113.65.205.124', '外太空', '2024-10-31 13:03:11', 0);
INSERT INTO `t_visitor_record` VALUES (4, 'agent', '113.65.205.124', '外太空', '2024-10-31 13:42:21', 0);
INSERT INTO `t_visitor_record` VALUES (5, 'agent', '113.65.205.124', '外太空', '2024-11-04 18:04:42', 0);
INSERT INTO `t_visitor_record` VALUES (6, 'agent', '113.65.205.124', '外太空', '2024-11-04 18:11:16', 0);
INSERT INTO `t_visitor_record` VALUES (7, 'agent', '113.65.205.124', '外太空', '2024-11-06 10:54:44', 0);
INSERT INTO `t_visitor_record` VALUES (8, 'agent', '113.65.205.124', '外太空', '2024-11-16 11:23:53', 0);
INSERT INTO `t_visitor_record` VALUES (9, 'agent', '113.65.205.124', '外太空', '2024-12-31 00:41:55', 0);
INSERT INTO `t_visitor_record` VALUES (10, 'agent', '113.65.205.124', '外太空', '2025-01-05 18:44:30', 0);
INSERT INTO `t_visitor_record` VALUES (11, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:17:10', 0);
INSERT INTO `t_visitor_record` VALUES (12, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:33:24', 0);
INSERT INTO `t_visitor_record` VALUES (13, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:39:16', 0);
INSERT INTO `t_visitor_record` VALUES (14, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:41:22', 0);
INSERT INTO `t_visitor_record` VALUES (15, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:45:19', 0);
INSERT INTO `t_visitor_record` VALUES (16, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:46:49', 0);
INSERT INTO `t_visitor_record` VALUES (17, 'agent', '113.65.205.124', '外太空', '2025-01-05 20:26:26', 0);
INSERT INTO `t_visitor_record` VALUES (18, 'agent', '113.65.205.124', '外太空', '2025-01-06 14:55:07', 0);
INSERT INTO `t_visitor_record` VALUES (19, 'agent', '113.65.205.124', '外太空', '2025-01-06 15:54:45', 0);
INSERT INTO `t_visitor_record` VALUES (20, 'agent', '113.65.205.124', '外太空', '2025-01-06 21:34:57', 0);
INSERT INTO `t_visitor_record` VALUES (21, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:14:59', 0);
INSERT INTO `t_visitor_record` VALUES (22, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:29:18', 0);
INSERT INTO `t_visitor_record` VALUES (23, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:39:54', 0);
INSERT INTO `t_visitor_record` VALUES (24, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:43:00', 0);
INSERT INTO `t_visitor_record` VALUES (25, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:46:52', 0);
INSERT INTO `t_visitor_record` VALUES (26, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:51:04', 0);
INSERT INTO `t_visitor_record` VALUES (27, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:53:59', 0);
INSERT INTO `t_visitor_record` VALUES (28, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:57:17', 0);
INSERT INTO `t_visitor_record` VALUES (29, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:58:37', 0);
INSERT INTO `t_visitor_record` VALUES (30, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:59:35', 0);
INSERT INTO `t_visitor_record` VALUES (31, 'agent', '113.65.205.124', '外太空', '2025-01-07 00:08:09', 0);
INSERT INTO `t_visitor_record` VALUES (32, 'agent', '113.65.205.124', '外太空', '2025-01-07 00:10:04', 0);
INSERT INTO `t_visitor_record` VALUES (33, 'agent', '113.65.205.124', '外太空', '2025-01-07 00:13:45', 0);
INSERT INTO `t_visitor_record` VALUES (34, 'agent', '192.168.31.39', '外太空', '2025-01-07 00:31:51', 0);
INSERT INTO `t_visitor_record` VALUES (35, 'agent', '192.168.31.39', '外太空', '2025-01-07 00:34:39', 0);
INSERT INTO `t_visitor_record` VALUES (36, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 00:37:18', 0);
INSERT INTO `t_visitor_record` VALUES (37, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 12:11:59', 0);
INSERT INTO `t_visitor_record` VALUES (38, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 12:14:44', 0);
INSERT INTO `t_visitor_record` VALUES (39, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:03:03', 0);
INSERT INTO `t_visitor_record` VALUES (40, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:32:54', 0);
INSERT INTO `t_visitor_record` VALUES (41, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:36:37', 0);
INSERT INTO `t_visitor_record` VALUES (42, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:37:37', 0);
INSERT INTO `t_visitor_record` VALUES (43, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:37:53', 0);
INSERT INTO `t_visitor_record` VALUES (44, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:43:34', 0);
INSERT INTO `t_visitor_record` VALUES (45, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:49:16', 0);
INSERT INTO `t_visitor_record` VALUES (46, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:51:14', 0);
INSERT INTO `t_visitor_record` VALUES (47, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:54:42', 0);
INSERT INTO `t_visitor_record` VALUES (48, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:55:28', 0);
INSERT INTO `t_visitor_record` VALUES (49, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:59:30', 0);
INSERT INTO `t_visitor_record` VALUES (50, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:03:56', 0);
INSERT INTO `t_visitor_record` VALUES (51, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:04:26', 0);
INSERT INTO `t_visitor_record` VALUES (52, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:06:04', 0);
INSERT INTO `t_visitor_record` VALUES (53, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:09:00', 0);
INSERT INTO `t_visitor_record` VALUES (54, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:09:27', 0);
INSERT INTO `t_visitor_record` VALUES (55, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:10:32', 0);

SET FOREIGN_KEY_CHECKS = 1;
