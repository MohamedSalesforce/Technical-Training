using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PreservingConnectionString"].ConnectionString);
    string iid, gen,un,unp;
    string typ = "doctor";
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select max(id) from dregis ", con);
        object result = cmd.ExecuteScalar();
        int ID;
        if (result.GetType() != typeof(DBNull))
        {
            ID = Convert.ToInt32(result);
        }
        else
        {

            ID = 0;

        }

        ID = ID + 1;
        iid = ID.ToString();
        con.Close();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("home.aspx");
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        con.Open();
        SqlCommand cmd1 = new SqlCommand("select userid from dregis where userid='"+TextBox2.Text+"'",con);
        un =Convert.ToString(cmd1.ExecuteScalar());
        SqlCommand cmd3 = new SqlCommand("select userid from pregis where userid='" + TextBox2.Text + "'", con);
        unp = Convert.ToString(cmd3.ExecuteScalar());
        con.Close();
        if (un == TextBox2.Text || unp==TextBox2.Text)
        {
            Response.Write("<script>alert('This User id is already exists ')</script>");
        }
        else
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                gen = "Male";
            }
            else
            {
                gen = "Female";
            }
            con.Open();
            SqlCommand cmd2 = new SqlCommand("insert into dregis values('"+iid+"','"+TextBox1.Text+"','"+TextBox2.Text+"','"+TextBox3.Text+"','"+gen+"','"+TextBox4.Text+"','"+TextBox6.Text+"','"+TextBox7.Text+"','"+TextBox8.Text+"','"+TextBox9.Text+"','"+typ+"')",con);
            cmd2.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Registration Successfully ')</script>");
            TextBox1.Enabled = false;
            TextBox2.Enabled = false;
            TextBox3.Enabled = false;
            TextBox4.Enabled = false;
           
            TextBox6.Enabled = false;
            TextBox7.Enabled = false;
            TextBox8.Enabled = false;
            TextBox9.Enabled = false;
            RadioButtonList1.Enabled = false;
            ImageButton5.Enabled = false;
            ImageButton6.Enabled = false;
            Label11.Visible = true;
            ImageButton7.Visible = true;
            
            
            //Response.Redirect("home.aspx");
 
        }
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("reg.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("reg.aspx");
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("reg.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("patientreg.aspx");
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}