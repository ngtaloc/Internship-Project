<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="utf-8"%>
<option value=null disabled="true">Chọn Chức vụ</option>
<c:forEach var="item" items="${cbbdecentralization}">
	<option value="${item.getId()}">${item.getName()}</option>
</c:forEach>
