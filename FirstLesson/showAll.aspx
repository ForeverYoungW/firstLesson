<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showAll.aspx.cs" Inherits="showAll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="rptShowArticles" runat="server">
            <HeaderTemplate><!--头部内容-->
                <div style="background-color:#aaf;">This is header</div>
                <tr>
                    <th>id</th>
                    <th>标题</th>
                    <th>作者</th>
                </tr>
                <br/>
            </HeaderTemplate>

            <ItemTemplate><!--项目模板-->
                <!-- 数据绑定有三种方式-->
                
                <tr>
                    <td><%#Eval("id") %></td>
                    <td><%#Eval("articleTitle") %></td>
                    <td><%#Eval("authorName") %></td>
                    <br/>
                </tr>
            </ItemTemplate>

            <FooterTemplate><!--脚部内容-->
                <div style="background-color:#dde;">This is footer</div>
            </FooterTemplate>
        </asp:Repeater><br/><br/><br/>
        <asp:Repeater ID="rptShowAuthors" runat="server">
            <HeaderTemplate>
                <tr>
                    <td>id</td>
                    <td>作者</td>
                    <td>性别</td>
                </tr>
                <br/>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Eval("id") %></td>
                    <td><%#Eval("authorName") %></td>
                    <td><%#Eval("authorSex") %></td>
                    <br/>
                </tr>
            </ItemTemplate>
        </asp:Repeater><br/><br/><br/>
        
    </div>
    </form>
</body>
</html>
