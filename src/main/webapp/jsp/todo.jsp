<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>To Do List</title>
</head>
<body>
	<section>
		<fieldset>
			<form action="todo-demo.jsp">
				<div>
					<label for="theItem">To Do List</label>
					<input type="text" name="theItem">
					<input type="submit" value="Submit">
				</div>
			</form>
		</fieldset>
	</section>
	<!--
		request.getAttribute -	will not work on a client side
								on a client side we should use
								request.getParameter.
	-->
	<p>Item entered: <%= request.getParameter("theItem") %></p>
	<%
		/**
			Get TO Do items from the session, from server side.
			Object getAttribute(String name) – returns the object bound
			with the specified name in this session, or null if no object
			is bound under the name
		*/
		List<String> items = (List<String>) session.getAttribute("myToDoList");

		/**
			If the TO DO items doesn't exist on a server side,
			then create a new one
		*/
		if (items == null) {
	        items = new ArrayList<String>();
	        session.setAttribute("myToDoList", items);
		}

		/**
			This is assigned to a variable.,
			If the theItem variable is not null,
			then that means the user entered some data.

			request.getParameter - will get value from the client side,
								   if value is not null then it will
								   assign the value to the session on
								   the server side.
		*/
		String theItem = request.getParameter("theItem");
       	if (theItem != null && (!theItem.trim().equals("") ) ){
        	items.add(theItem);
    	}
	%>
	<h3>To Do List Items:</h3>
	<ol>
		<%
			// Display all "To Do" item from session
			for (String temp : items) {
				out.println("<li>" + temp + "</li>");
			}
		%>
	</ol>
</body>
</html>