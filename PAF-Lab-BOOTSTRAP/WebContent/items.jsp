<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.Item"%>


<%
	
	//Insert item------------------------------
	if(request.getParameter("itemCode") != null){
		
		Item itemObj = new Item();
		
		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
				request.getParameter("itemName"),
				request.getParameter("itemPrice"),
				request.getParameter("itemDesc"));
		
		session.setAttribute("statusMsg",stsMsg);
	}
	//Remove item------------------------------
	if(request.getParameter("itemID") != null){
		
		String  id = request.getParameter("itemID");
		
		Item itemObj = new Item();
		
		String[] item = itemObj.getItem(id);
		
		String code = item[0];
		String name = item[1];
		String price = item[2];
		String desc = item[3];
		
		String stsMsg = itemObj.removeItem(id);
		
		session.setAttribute("statusMsg",stsMsg);
		session.setAttribute("code",code);
		session.setAttribute("name",name);
		session.setAttribute("price",price);
		session.setAttribute("desc",desc);
		
	}
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
<link rel="stylesheet"href="Views/bootstrap.min.css">
</head>
<body>
<div class="container">
<div class="row">
<div class="col">
	
	<h1>Items Management</h1>
	<form method="post" action="items.jsp">
	
	Item code: <input name="itemCode" type="text" <%if(request.getParameter("btnUpdate") != null){%>
		value='<%= session.getAttribute("code")  %>'
	<% }%>><br>
	
	Item name: <input name="itemName" type="text" <%if(request.getParameter("btnUpdate") != null){%>
		value="<%= session.getAttribute("name") %>"
	<% }%>><br>
	
	Item price: <input name="itemPrice" type="text" <%if(request.getParameter("btnUpdate") != null){%>
		value="<%= session.getAttribute("price") %>"
	<% }%>><br>
	
	Item description: <input name="itemDesc" type="text" <%if(request.getParameter("btnUpdate") != null){%>
		value="<%= session.getAttribute("desc") %>"
	<% }%>><br>
	
	<input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
	</form>
	


	<div class ="alert alert-success">
	<%
		
		out.print(session.getAttribute("statusMsg"));
	
	%>
	</div>
	<br>
	
	<div class ="alert alert-success">
	<%
	
		Item itemObj = new Item();
		out.print(itemObj.readItems());
	
	%>
	</div>
	
</div>
</div>
</div>
	

</body>
</html>