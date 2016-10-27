# SIE数据库文档
## 一、数据库综述
### 1.数据库表总览
|表名 |作用 |
|:------|:------|
|pages|作为各个页面的存储|
|news|作为新闻的存储|
|teachers|教师(对应领导)表|
|admins|管理员表|

### 2.分表详细介绍
#### (1)pages表(页面存储)
|列名|类型|是否可为空|作用|
|-----|-----|-----|-----|
|id|int|×|自增值，作为唯一标识的主键|
|title|nvarchar(100)|×|页面的标题|
|body|text|×|页面的主体部分，使用ueditor存储|
|createtime|datetime|×|创建时间，创建以后不再更改|
|updatetime|datetime|×|最后一次更新时间|
|belong |int|×|所属模块|

#### (2)news表(新闻)
|列名|类型|是否可为空|作用|
|-----|-----|-----|-----|
|id|int|×|自增值，唯一标识。主键|
|title|nvarchar(50)|×|新闻标题|
|body|text|×|新闻的主体部分，使用ueditor编辑|
|createtime|datetime|×|创建时间，创建以后不再更改|
|updatetime|datetime|×|最后一次更新时间|
|newclass|int|×|新闻的类别。|

####(3)teachers表(教师)
|列名|类型|是否可为空|作用|
|-----|-----|-----|-----|
|id|int|×|自增值，唯一标识。主键|
|tname|nvarchar(50)|×|教师姓名|
|phone|nvarchar(100)|×|教师办公电话，可填多个。|
|title|nvarchar(10)|×|教师职务|
|body|text|×|教师详细页。使用ueditor编辑|
|updatetime|datetime|×|最后一次更新时间|
|createtime|datetime|×|创建时间，创建之后不能更改|
|place|nvarchar(50)|×|教师办公地点|
|describe|nvarchar(200)|×|工作职责描述|
|email|nvarchar(100)|×|教师e-mail|

####(4)admins表(管理员账号表)
|列名|类型|是否可为空|作用|
|-----|-----|-----|-----|
|id|int|×|自增值，唯一标识。主键|
|account|nvarchar(50)|×|管理员用户名|
|password|nvarchar(50)|×|管理员密码|
|createtime|datetime|×|创建时间，一旦创建不能修改|
|updatetime|datetime|×|最后一次修改时间|
|nikename|nvarchar(50)|×|管理员昵称|
