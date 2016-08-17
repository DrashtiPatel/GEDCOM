<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gedcom","root","");
		Statement st = con.createStatement();
		
		String Fn,Ln,Sex,Fan,Mon,Sp,ComFa,ComMo;
		Static int FamName=1;
		Fn=request.getParameter("fn");
		Ln=request.getParameter("ln");
		Sex=request.getParameter("s");
		Fan=request.getParameter("fan");
		Mon=request.getParameter("mon");
		Sp=request.getParameter("sp");
	
		String sql = "select * from gedcom;";
	  	ResultSet rs = st.executeQuery(sql);
		int count=0;
    	while(rs.next())
		{
			if(Fn.equals(rs.getString("FirstName")) && Fan.equals(rs.getString("FatherName")) && Mon.equals(rs.getString("MotherName")))
				count++;
				
		}	
			
		Integer count1=new Integer(count);
		if(count1.equals(0))
		{
				String sql1= "insert into gedcom values(null,'"+request.getParameter("fn")+"','"+request.getParameter("ln")+"','"+request.getParameter("s")+"','"+request.getParameter("fan")+"','"+request.getParameter("mon")+"','"+request.getParameter("sp")+"');";
				st.executeUpdate(sql1);
				response.sendRedirect("index.jsp");
				
				
				String sql2="select * from gedcom order by FatherName;";
				ResultSet rs1 = st.executeQuery(sql2);
				rs1.first();
				%>
				<%!

				public void Add(int a,String b,String c,String d,String e)
				{

				
				String updateQuery1="insert into family VALUES(?,?,?,?,?);";
						try 
						{
						// set all the preparedstatement parameters
						PreparedStatement ps = con.prepareStatement(updateQuery1);
						ps.setString(1, "F"+a);
						ps.setString(2, b);
						ps.setString(3, c);
						ps.setString(4, d);
						ps.setString(5, e);

						ps.executeUpdate();
						ps.close();
						} 
						catch (Exception se)
						{
						throw se;
						}
						
					
				}
				%>
				<%
				ComFa=rs1.getString("FatherName");
				ComMo=rs1.getString("MotherName");
				int q=0;
				while(rs1.next())
				{
					if(ComFa.equals(rs1.getString("FatherName")) && ComMo.equals(rs1.getString("MotherName")))
					{	
						
							Add(FamName,rs.getString("FirstName"),rs.getString("LastName"),rs.getString("FatherName"),rs.getString("ID"));
							q++;
							
					}
					
				}
				if(q!=0)
				{
						FamName
				}
				
					

				}
					
				
				
		 
		else
		{
			response.sendRedirect("existing.jsp");
			
			
		}
		
		
		
		
	
	
%>
	
		
		

	

