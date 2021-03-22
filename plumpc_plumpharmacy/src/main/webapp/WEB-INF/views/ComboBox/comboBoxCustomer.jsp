<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="utf-8"%>
<option value="nullCus">Khách Lẻ</option>
<c:forEach var="item" items="${cbbcustomer}">
	<option value="${item.getId()}">${item.getName()} -- ${item.getPhone() }</option>
</c:forEach>
