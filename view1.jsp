<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
<table border=1>
<tr>
<td><h1>ID</h1></td>
<td><h1>First Name</h1></td>
<td><h1>Last Name</h1></td>
<td><h1>Sex</h1></td>
<td><h1>Father's Name</h1></td>
<td><h1>Mother's Name</h1></td>
<td><h1>Family Name</h1></td>

</tr>

<%
		FileWriter output=new FileWriter("D:\\ViewByFamily.ged");
        BufferedWriter bufOutput=new BufferedWriter(output);
        String line;
		
		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/gedcom","root","");
		Statement st1 = con1.createStatement();
		String sql3 = "select * from gedcom ORDER BY ID;";
	    
		
    	ResultSet rs1 = st1.executeQuery(sql3);
    	while(rs1.next()){
		%><tr>
		<td>
		<%
			out.println(rs1.getString("ID"));
			
			bufOutput.write("ID = "+rs1.getString("ID"));
			bufOutput.newLine();
			
		%>
		</td>
		<td>
		<%
			
			out.println(rs1.getString("FirstName"));
		
			bufOutput.write("FirstName = "+rs1.getString("FirstName"));
			bufOutput.newLine();
		%></td>
		<td>
		<%
			
			out.println(rs1.getString("LastName"));	
		
			bufOutput.write("LastName = "+rs1.getString("LastName"));
			bufOutput.newLine();
		%></td>
		<td>
		<%
			
			out.println(rs1.getString("Sex"));	
			bufOutput.write("Sex = "+rs1.getString("Sex"));
			bufOutput.newLine();
		
		%></td>
		<td>
		<%
			
			out.println(rs1.getString("FatherName"));	
		
			bufOutput.write("FatherName = "+rs1.getString("FatherName"));
			bufOutput.newLine();
		%></td>
		<td>
		<%
			
			out.println(rs1.getString("MotherName"));	
		
			bufOutput.write("MotherName = "+rs1.getString("MotherName"));
			bufOutput.newLine();
		%></td>
		<td>
		<%
			
			out.println(rs1.getString("FamilyName"));	
			bufOutput.write("FamilyName = "+rs1.getString("FamilyName"));
			bufOutput.newLine();
			bufOutput.write("-------------------------------------------------------------------------------------------");
			bufOutput.newLine();
		%></td>
		
</tr>
<%
}
%>
<%
	bufOutput.close();
%>

</table>