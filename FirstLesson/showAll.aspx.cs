using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class showAll : System.Web.UI.Page
{

    //SqlDataReader对象
    //SqlDataReader对象读取数据库中的数据，数据连接必须处于打开状态，而且每次从查询结果中读取一行数据到内存中。（只能向前读取）

    //SqlDataAdapter对象  数据适配器  充当数据库和DateSet之间的桥梁
    //DataSet对象可以在断开数据库连接的情况下查询数据
    static string str = @"server=(localdb)\v11.0;Integrated Security=SSPI;database=FirstLesson;";

    protected void Page_Load(object sender, EventArgs e)
    {
        /*
        using(SqlConnection conn = new SqlConnection(str))
        {
            string sqlSelect="select a.id,a.articleTitle,b.authorName from article as a full join author as b on a.authorId=b.id";
            SqlDataAdapter da = new SqlDataAdapter(sqlSelect, conn);//数据适配器
            DataSet ds = new DataSet();//数据集
            da.Fill(ds);//向DataSet对象填充数据
            rptShowArticles.DataSource = ds;
            rptShowArticles.DataBind();
        }

        using (SqlConnection conn = new SqlConnection(str))
        {
            string sqlSelect = "select * from author";
            SqlDataAdapter da = new SqlDataAdapter(sqlSelect, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);//向DataSet对象填充数据
            rptShowAuthors.DataSource = dt;
            rptShowAuthors.DataBind();
        }
        */
        
        using (SqlConnection conn = new SqlConnection(str))
        {
            string sqlSelect1 = "select a.id,a.articleTitle,b.authorName from article as a full join author as b on a.authorId=b.id";
            string sqlSelect2 = "select id,authorName,authorSex from author";
            SqlDataAdapter da1 = new SqlDataAdapter(sqlSelect1, conn);
            SqlDataAdapter da2 = new SqlDataAdapter(sqlSelect2, conn);
            DataTable dt1=new DataTable();
            DataTable dt2 = new DataTable();
            da1.Fill(dt1);
            da2.Fill(dt2);
            DataSet ds = new DataSet();
            ds.Tables.Add(dt1);
            ds.Tables.Add(dt2);
            rptShowArticles.DataSource = ds.Tables[0];
            rptShowArticles.DataBind();
            rptShowAuthors.DataSource = ds.Tables[1];
            rptShowAuthors.DataBind();
        }
         
    }
}