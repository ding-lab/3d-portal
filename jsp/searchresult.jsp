

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
   String cancer = request.getParameter("cancers");
   String interaction = request.getParameter("interaction");
   String gene = request.getParameter("gene");
   String sdis = request.getParameter("sdis");
   String pvalue = request.getParameter("pvalue");

   int interactiond = Integer.valueOf(interaction).intValue(); 

   float sdisf = 0;
   try
   {
       sdisf = Float.parseFloat(sdis);
   }catch(Exception e){}

   ResultSet rs = null;

   String sql = "";

   if (cancer.equals("all"))
   {
       sql = "select * from run_10aa_10AA where (gene1 = '"+gene+"' OR gene2 = '"+gene+"') AND interaction = '"+interactiond+"' AND sdis <= '"+sdisf+"'";
   }
   else
   {
       sql = "select * from run_10aa_10AA where cancer = '"+cancer+"' AND (gene1 = '"+gene+"' OR gene2 = '"+gene+"') AND interaction = '"+interactiond+"' and  sdis <= '"+sdisf+"'";
   }

   rs = submitjobBean.executeQuery(sql);

%>

<BODY>

<br><br><br>
<TABLE id=main cellSpacing=3 cellPadding=5 width=757 align=center border=0 height="135">
  <TBODY>
  <TR vAlign=top>
    <TD width=77 height="80">&nbsp;</TD>

    <TD width=644 height="102"><FONT face="Arial, Helvectica, sans-serif" size=6><B> 3D Mutation <I><U><FONT COLOR="#800000">Proximity</U></I></FONT> Visualization Portal</B></FONT><BR><br>            
    <% java.util.Date date = new java.util.Date(); %>
	<FONT face="Arial, Helvectica, sans-serif" 
      size=2 COLOR="#66CCFF"><B>&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></B></FONT></TD>
  </TR>
  <TR vAlign=top><TD colSpan=2 width="737" height="5">
      <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Location:&nbsp;&nbsp;&nbsp; <a href="index.jsp">Home</a>&nbsp;&nbsp; 
      </font><font size="1">&gt;&gt;&nbsp; <a href="search.jsp">Search</a>&nbsp;</font>
      <hr width="80%" color="#008080">
    </TD></TR>

</table>

<br><br>

<%
if (rs == null || !rs.first()) 
{
    %>

<p align="center"><font size="3" color=#FF3300><font size="2"><I> Sorry , no record !</I></font> </p> 

<%        

}
else
{

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
    <% } %>
</table>
<% }
submitjobBean.close();
%> 

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

