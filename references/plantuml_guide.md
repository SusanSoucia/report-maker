# PlantUML 常用语法速查

## 类图 (class diagram)

```
@startuml
' 抽象类或接口
abstract class 类名
interface 接口名

' 普通类
class 类名 {
  +publicField: Type
  -privateField: Type
  #protectedField: Type
  +method(param: Type): ReturnType
}

' 关系
ClassA <|-- ClassB      ' 继承（B 继承 A）
ClassA <|.. ClassB      ' 实现（B 实现接口 A）
ClassA o-- ClassB       ' 聚合（A 包含 B，B 可独立存在）
ClassA *-- ClassB       ' 组合（A 拥有 B，B 生命周期同 A）
ClassA --> ClassB       ' 关联/依赖
ClassA ..> ClassB       ' 依赖（弱）

' 关系标注
ClassA --> "1" ClassB : 标签文字 >
ClassA --> "*" ClassB : 一对多 >

' 包
package "包名" {
  class A
  class B
}

' 备注
note left of ClassA : 左侧备注
note right of ClassA : 右侧备注
note top of ClassA : 上方备注

@enduml
```

## 时序图 (sequence diagram)

```
@startuml
actor 用户
participant "前端" as Frontend
participant "后端" as Backend
database "数据库" as DB

用户 -> Frontend: 点击登录
Frontend -> Backend: POST /login
activate Backend
Backend -> DB: SELECT user
DB --> Backend: user data
Backend --> Frontend: token
deactivate Backend
Frontend --> 用户: 登录成功

note over Backend, DB: 查询耗时 < 100ms
@enduml
```

## 用例图 (usecase diagram)

```
@startuml
left to right direction
actor "学生" as Student
actor "教师" as Teacher

rectangle "选课系统" {
  usecase "浏览课程" as UC1
  usecase "选课" as UC2
  usecase "查看课表" as UC3
}

Student --> UC1
Student --> UC2
Student --> UC3
UC2 ..> UC1 : <<include>>
@enduml
```

## 活动图 (activity diagram)

```
@startuml
start
:接收请求;
if (参数校验通过?) then (是)
  :执行业务逻辑;
  :返回结果;
else (否)
  :返回错误信息;
endif
stop
@enduml
```

## 部署图 (deployment diagram)

```
@startuml
node "客户端" as Client
node "应用服务器" as Server {
  node "Web 容器" as Web
}
database "MySQL" as DB

Client --> Server : HTTP
Server --> DB : JDBC
@enduml
```

## 生成图片命令

```bash
# 安装 plantuml（需要 Java）
# sudo apt install plantuml

# 单个文件
plantuml -tpng image/xxx.puml

# 指定输出目录
plantuml -tpng image/xxx.puml -o image/
```

## 中文支持

在 `.puml` 文件开头确保使用 UTF-8，并使用支持中文的字体。如果中文渲染有问题，在文件顶部加：

```
@startuml
skinparam defaultFontName "Noto Sans CJK SC"
' 或者
skinparam defaultFontName "WenQuanYi Micro Hei"
```
