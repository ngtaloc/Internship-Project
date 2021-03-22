<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="utf-8"%>
<option value=null disabled selected>Chọn Nhà Cung Cấp</option>
<c:forEach var="item" items="${cbbSupplier}">
	<option value="${item.id}">${item.name}</option>
</c:forEach>
