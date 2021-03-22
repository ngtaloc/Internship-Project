<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="utf-8"%>v
<c:forEach var="item" items="${cbbDrugClassificationDAO}">
	<option value="${item.getId()}">${item.getName()}</option>
</c:forEach>d
