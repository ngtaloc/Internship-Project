<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="utf-8"%>
<option value=null>Chọn Đối Tượng</option>
<c:forEach var="item" items="${cbbPatient}">
	<option value="${item.id}">${item.name}</option>
</c:forEach>
