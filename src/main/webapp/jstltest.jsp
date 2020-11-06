<%@ page import="com.bjpowernode.crm.settings.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: 朱银杭
  Date: 2020/10/30
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>测试jstl标签</title>
</head>
<body>
<%
    int age = 20;
%>
<%
    if (age > 30) {
%>
<h1>hello world!</h1>
<%
    }else{
        %>
        <h1>Hello_beijing</h1>
<%
}
%>

<hr>
<%
    request.setAttribute("age",20);
%>
<c:if test="${age>30}">
    <h1>Hello World!</h1>
</c:if>
<c:if test="${age<=30}">
    <h1>Hello beijing!</h1>
</c:if>
<hr>

<%
for (int i=0;i<10;i++){
    %>
<h1><%=i %>Hello world</h1>
<%
}
%>

<hr>
<c:forEach begin="10" end="20" varStatus="vs">
    <h1>${vs.index}Hello world${vs.count}</h1>
</c:forEach>


<hr>
<%
    List<User> userList = new ArrayList<>();
    User user = new User();
    user.setId("1001");
    user.setName("zhangsan");
    user.setEmail("zhangsan@163.com");
    userList.add(user);
    user = new User();
    user.setId("1002");
    user.setName("lisi");
    user.setEmail("lisi@163.com");
    userList.add(user);
    user = new User();
    user.setId("1003");
    user.setName("wangwu");
    user.setEmail("wangwu@163.com");
    userList.add(user);


%>

<table border="1" width="30%" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>EMALL</th>
    </tr>
    <%
        for(User u:userList){
    %>
        <tr>
            <td><%=u.getId()%></td>
            <td><%=u.getName()%></td>
            <td><%=u.getEmail()%></td>
        </tr>
    <%
    }
    %>
</table>
<hr>
<%
    request.setAttribute("userList",userList);
%>
<table border="1" width="30%" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>EMALL</th>
    </tr>
    <%--
        items;要遍历的数组或者集合，使用EL表达式获取；所以，在使用jstl标签之前，必须把所需数据保存到作用域中
        var:相当于循环变量，从集合或者数组中每次获取到的对象，保存到var指定的变量中。
    --%>

    <c:forEach items="${userList}" var="u">
        <tr>
            <td>${u.id}</td>
            <td>${u.name}</td>
            <td>${u.email}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
