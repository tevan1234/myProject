<%@page import="InsuranceSystem.model.dto.ProdouctDto"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
	List<ProdouctDto>prodouctDtos = (List<ProdouctDto>)request.getAttribute("prodouctDtos");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>保險商品變更</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link rel="stylesheet" href="/InsuranceSystem/css/buttons.css">
	</head>
	<body style="background-color: #f4e500">
		<%@ include file="/WEB-INF/view/menu.jsp" %>
		<div style="padding: 15px ; display: ${userCert.role == 'EMPLOYEE' ? 'none' : 'block'}">
			<form class="pure-form" method="post" action="/InsuranceSystem/prodouct/add">
				<fieldset>
					<legend>商品新增</legend>					
					保險種類: <input type="text" name="prodouctType" placeholder="請輸入 保險種類" required /><p /><p />
					年繳額: <input type="text" name="price" placeholder="請輸入 年繳額" required /><p />
					
					<button type="reset" class="button-warning pure-button">Reset</button>
					<button type="submit" class="button-success pure-button">Submit</button>
				</fieldset>
			</form>
		</div>
		<form class="pure-form" style="padding: 15px">
			<fieldset>
				<legend>
			        Prodouct 列表
			        <a href="/InsuranceSystem/prodouct/rank" class="btn btn-outline-success" style="margin-left: 20px;">保單銷售排行</a>
			    </legend>				
				<table class="pure-table pure-table-bordered" style="background-color: white;">
					<thead>
						<tr>
							<th>ID</th><th>保險種類</th><th>年繳額</th><th>上架情形</th><th>售出件數</th>
							<th>修改</th><th>刪除</th>
						</tr>
					</thead>
					<%for(ProdouctDto prodouctDto : prodouctDtos) { %>
						<tr>
							<td><%= prodouctDto.getPid() %></td>
							<td><%= prodouctDto.getPtype() %></td>
							<td><%= prodouctDto.getPprice() %></td>
							<td><%= prodouctDto.getPstatus() %></td>
							<td><%= prodouctDto.getPsales() %></td>							
							
							<td><a href="/InsuranceSystem/prodouct/get?prodouctId=<%= prodouctDto.getPid() %>" class="button-secondary pure-button"<c:if test="${userCert.role == 'EMPLOYEE'}">disabled</c:if>>修改</a></td>
							<td><a href="/InsuranceSystem/prodouct/delete?prodouctId=<%= prodouctDto.getPid() %>" class="button-error pure-button"<c:if test="${userCert.role == 'EMPLOYEE'}">disabled</c:if>>刪除</a></td>
						</tr>
					<% } %>
				</table>
			</fieldset>
		</form>
	</body>
</html>