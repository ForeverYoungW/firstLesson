using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    static string str = @"server=(localdb)\v11.0;Integrated Security=SSPI;database=FirstLesson;";

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnAddAuthor_Click(object sender, EventArgs e)
    {
        if (txtCreateAuthorName.Text != null && txtCreateAuthorName.Text !="")
        {
            string sqlInsert ="insert into author(authorName,authorSex) values(N'"+txtCreateAuthorName.Text+"',N'"+ddlCreateAuthorSex.Text+"')";//定义sql语句（简单版）
            int result = 0;

            //using语句
            using (SqlConnection conn = new SqlConnection(str))//实例化数据库连接
            {
                conn.Open();                                   //打开数据库连接
                SqlCommand cmd = new SqlCommand(sqlInsert, conn);//创建SqlCommand对象,第一个参数为要执行的sql语句，insert,update,delete,第二个参数为数据库连接的实例
                result = cmd.ExecuteNonQuery();              //ExecuteNonQuery()方法返回受影响的行数。返回值为0失败，>0成功
            }

            if (result > 0)
            {
                Response.Write("作者添加成功！");
            }

            else
            {
                Response.Write("作者添加失败！");
            }
        }
    }
    protected void btnDeleteAuthor_Click(object sender, EventArgs e)
    {
        string sqlDelete = "delete from author where id='"+Convert.ToInt32(txtDeleteAuthorId.Text)+"'";
        int result = 0;

        using (SqlConnection conn = new SqlConnection(str))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlDelete, conn);
            result = cmd.ExecuteNonQuery();
        }

        if (result > 0)
        {
            Response.Write("作者删除成功！");
        }

        else
        {
            Response.Write("作者删除失败！");
        }
    }
    //可用参数化
    protected void btnUpdateAuthor_Click(object sender, EventArgs e)
    {
        string sqlUpdate = "update author set authorName=N'" + txtUpdateAuthorName.Text + "',authorSex=N'" + ddlUpdateAuthorSex.Text + "' where id='" + Convert.ToInt32(txtUpdateAuthorId.Text) + "'";
        int result = 0;

        using (SqlConnection conn = new SqlConnection(str))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlUpdate, conn);
            result = cmd.ExecuteNonQuery();
        }

        if (result > 0)
        {
            Response.Write("作者更新成功！");
        }

        else
        {
            Response.Write("作者更新失败！");
        }
    }
    protected void btnjudge_Click(object sender, EventArgs e)
    {
        string sqlJudge = "select * from author where authorName=N'" + authorName.Text + "'";
        SqlConnection conn = null;
        object result=null;
        //try.catch.finally
        try
        {
            conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlJudge, conn);
            result = cmd.ExecuteScalar();
        }
        
        finally
        {
            conn.Close();
        }

        if (result == null)
        {
            Response.Write("该作者不存在");
        }

        else
        {
            Response.Write("作者存在");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("showAll.aspx");
    }
}