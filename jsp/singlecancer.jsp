

<%@ page contentType="text/html;charset=GB2312" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.lang.*"%>

<jsp:useBean id = "submitjobBean" scope="page" class="mydb.mysqlcon" />
<jsp:useBean id = "countBean" scope="page" class="mydb.deparsestr" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> 3D Mutation Proximity System in TGI </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/nbf.css" rel="stylesheet" type="text/css">

</HEAD>

<% 
   String cancer = request.getParameter("cancer");
   ResultSet rscancers = null;
   String sqlcancers = "select * from TCGA_cancers where cancer = '"+cancer+"'";  
   rscancers = submitjobBean.executeQuery(sqlcancers);
   String detail = "";
   if (rscancers.next())
   {
       detail = rscancers.getString(2);
   }
%>

<BODY>

<br><br><br>
<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="135">
  <TBODY>
  <TR vAlign=top>
    <TD width=77 height="80">&nbsp;</TD>
    <TD width=644 height="80"><font face="Arial, Helvectica, sans-serif" size="6"><b><I><U><FONT COLOR="#800000"><%=cancer%></U></I></FONT> : <%=detail%></b></font><BR><br>            
<% java.util.Date date = new java.util.Date(); %>
	<FONT face="Arial, Helvectica, sans-serif" 
      size=2 COLOR="#66CCFF"><B>&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></B></FONT></TD>
  </TR>
  <TR vAlign=top><TD colSpan=2 width="737" height="5">
      <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp; <a href="index.jsp">Home</a>&nbsp;&nbsp; 
      </font><font size="1">&gt;&gt;&nbsp; <a href="tcgacancers.jsp">TCGA cancers List</a>&nbsp;</font>
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<br><br>

<% 
   ResultSet rs = null; 
   String sql = "select * from run_10aa_10AA where cancer = '"+cancer+"'";
   rs = submitjobBean.executeQuery(sql);

%>

<table border="0" width="500" height="21" align="center">

<% while(rs.next()) { %>

    <tr>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(1)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(2)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(3)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(4)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(5)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(6)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(7)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(8)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(9)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(10)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(11)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(12)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><a href=portal.jsp?rowkey=<%=rs.getString(18)%>><%=rs.getString(13)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(14)%></I></font></td>
        <td height="20" align="left"><font size="2" ><I><%=rs.getString(15)%></I></font></td>
    </tr>

<% } 
submitjobBean.close();
%> 

</table>

<p></p>
<br><br>

<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="20">
  <TR vAlign=top><TD width="737" height="1">
      <hr width="80%" color="#008080">
    </TD></TR>
</table>
<table border="0" width="757" height="2" align="center">
  <tr>
    <td width="100%" height="1" align="center"><FONT 
            face="Arial, Helvetica, sans-serif" size=2>Copyrignt? Ding lab in TGI Washington University at St. Louis.</font></td> 
  </tr>
</table>

</body>
</html>

