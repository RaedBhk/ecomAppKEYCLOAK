[1mdiff --git a/ecom-app/pom.xml b/ecom-app/pom.xml[m
[1mindex 239ae33..02d7435 100644[m
[1m--- a/ecom-app/pom.xml[m
[1m+++ b/ecom-app/pom.xml[m
[36m@@ -27,21 +27,37 @@[m
 			<groupId>org.springframework.boot</groupId>[m
 			<artifactId>spring-boot-starter-data-rest</artifactId>[m
 		</dependency>[m
[32m+[m		[32m<dependency>[m
[32m+[m			[32m<groupId>org.webjars</groupId>[m
[32m+[m			[32m<artifactId>bootstrap</artifactId>[m
[32m+[m			[32m<version>4.4.1</version>[m
[32m+[m		[32m</dependency>[m
[32m+[m[32m        <dependency>[m
[32m+[m[32m            <groupId>org.webjars</groupId>[m
[32m+[m[32m            <artifactId>jquery</artifactId>[m
[32m+[m[32m            <version>3.4.1</version>[m
[32m+[m[32m        </dependency>[m
 		<dependency>[m
 			<groupId>org.springframework.boot</groupId>[m
 			<artifactId>spring-boot-starter-thymeleaf</artifactId>[m
 		</dependency>[m
[32m+[m
 		<dependency>[m
 			<groupId>org.springframework.boot</groupId>[m
 			<artifactId>spring-boot-starter-web</artifactId>[m
 		</dependency>[m
[31m-[m
 		<dependency>[m
 			<groupId>org.springframework.boot</groupId>[m
 			<artifactId>spring-boot-devtools</artifactId>[m
 			<scope>runtime</scope>[m
 			<optional>true</optional>[m
 		</dependency>[m
[32m+[m		[32m<dependency>[m
[32m+[m			[32m<groupId>nz.net.ultraq.thymeleaf</groupId>[m
[32m+[m			[32m<artifactId>thymeleaf-layout-dialect</artifactId>[m
[32m+[m			[32m<version>2.2.2</version>[m
[32m+[m		[32m</dependency>[m
[32m+[m
 		<dependency>[m
 			<groupId>com.h2database</groupId>[m
 			<artifactId>h2</artifactId>[m
[1mdiff --git a/ecom-app/src/main/java/org/rbhk/ecomapp/controller/ProductController.java b/ecom-app/src/main/java/org/rbhk/ecomapp/controller/ProductController.java[m
[1mindex bcb6f51..eacfa52 100644[m
[1m--- a/ecom-app/src/main/java/org/rbhk/ecomapp/controller/ProductController.java[m
[1m+++ b/ecom-app/src/main/java/org/rbhk/ecomapp/controller/ProductController.java[m
[36m@@ -11,9 +11,14 @@[m [mpublic class ProductController {[m
     @Autowired[m
     private ProductRepository productRepository;[m
 [m
[31m-    @GetMapping("/index")[m
[32m+[m[32m    @GetMapping("/")[m
[32m+[m[32m    public String index(){[m
[32m+[m[32m        return "index";[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @GetMapping("/products")[m
     public String index(Model model){[m
         model.addAttribute("products", productRepository.findAll());[m
[31m-        return "index";[m
[32m+[m[32m        return "products";[m
     }[m
 }[m
[1mdiff --git a/ecom-app/src/main/resources/templates/index.html b/ecom-app/src/main/resources/templates/index.html[m
[1mindex 487d15e..34d51ca 100644[m
[1m--- a/ecom-app/src/main/resources/templates/index.html[m
[1m+++ b/ecom-app/src/main/resources/templates/index.html[m
[36m@@ -1,22 +1,14 @@[m
 <!DOCTYPE html>[m
 <html lang="en"[m
[31m-      xmlns:th="http://www.thymeleaf.org">[m
[32m+[m[32m      xmlns:th="http://www.thymeleaf.org"[m
[32m+[m[32m      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"[m
[32m+[m[32m      layout:decorator="template">[m
 <head>[m
     <meta charset="UTF-8">[m
[31m-    <title>Products</title>[m
[32m+[m[32m    <title>Home</title>[m
[32m+[m
 </head>[m
 <body>[m
[31m-    <table>[m
[31m-        <tr>[m
[31m-            <th>ID</th>[m
[31m-            <th>Name</th>[m
[31m-            <th>Price</th>[m
[31m-        </tr>[m
[31m-        <tr th:each="p:${products}">[m
[31m-            <td th:text="${p.id}"></td>[m
[31m-            <td th:text="${p.name}"></td>[m
[31m-            <td th:text="${p.price}"></td>[m
[31m-        </tr>[m
[31m-    </table>[m
[32m+[m[32m <div layout:fragment="content"></div>[m
 </body>[m
 </html>[m
\ No newline at end of file[m
