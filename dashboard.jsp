<%
    String username = (String) session.getAttribute("username");
    String email = (String) session.getAttribute("email");
    String memberSince = (String) session.getAttribute("memberSince");
%>
<h1>Welcome, <%= username %>!</h1>
<p>Email: <%= email %></p>
<p>Member Since: <%= memberSince %></p>

