<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="utf-8"%>v
<c:forEach var="item" items="${cbbCountingUnits}">
	<option value="${item.id}">${item.name}</option>
</c:forEach>d
