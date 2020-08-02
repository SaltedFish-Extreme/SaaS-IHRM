# SaaS-IHRM
人力资源管理系统

黑马的SaaS-IHRM项目，传统公司后台管理项目，使用springboot+Spring Data JPA+SpringCloud的spring全家桶。
只实现了基本业务的增删改查，分为用户角色权限以及资源的管理，权限和资源的管理用的jwt，没有用课程里用的shiro框架，跑不起来，登录后拿到jwt token后可远程调用其他微服务。
因为没有找到swagger api相关的课件，只能通过课程里测试过的接口使用postman进行测试，没什么问题。后面的生成Excel和PDF文件的没有做，前端代码跑不起来。
当作练手项目，可拿代码来对比个人项目中使用spring全家桶时的报错异常等问题。
