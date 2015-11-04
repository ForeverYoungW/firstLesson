<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>新增作者(insert)(核心要点：SqlConnection/SqlCommand/ExecuteNonQuery)</h3>
        作者姓名：<asp:TextBox ID="txtCreateAuthorName" runat="server"></asp:TextBox>
        作者性别：<asp:DropDownList ID="ddlCreateAuthorSex" runat="server">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:DropDownList><br/><br/>
        <asp:Button ID="btnAddAuthor" runat="server" Text="增加作者" OnClick="btnAddAuthor_Click" Height="28px" Width="88px" /><br/>
    </div>

    <div>
        <h3>刪除作者(delete)(核心要点：SqlConnection/SqlCommand/ExecuteNonQuery)</h3>
        请输入要删除的作者id：<asp:TextBox ID="txtDeleteAuthorId" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnDeleteAuthor" runat="server" Text="删除作者" OnClick="btnDeleteAuthor_Click" Height="28px" Width="88px" /><br/>
    </div>

    <div>
        <h3>修改作者(update)(核心要点：SqlConnection/SqlCommand/ExecuteNonQuery)</h3>
        作者id  ：<asp:TextBox ID="txtUpdateAuthorId" runat="server"></asp:TextBox>
        作者姓名：<asp:TextBox ID="txtUpdateAuthorName" runat="server"></asp:TextBox>
        作者性别：<asp:DropDownList ID="ddlUpdateAuthorSex" runat="server">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:DropDownList><br/><br/>
        <asp:Button ID="btnUpdateAuthor" runat="server" Text="修改作者" OnClick="btnUpdateAuthor_Click" Height="28px" Width="88px" /><br/>
    </div>

    <div>
        <h3>查看作者是否存在(核心要点：SqlConnection/SqlCommand/ExecuteScalar)</h3>
        作者姓名：<asp:TextBox ID="authorName" runat="server"></asp:TextBox><br/><br/>
        <asp:Button ID="judge" runat="server" Text="查看作者是否存在" OnClick="btnjudge_Click" Height="28px" Width="119px" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="跳转" />
        <br/>
    </div>
    </form>
</body>
</html>
