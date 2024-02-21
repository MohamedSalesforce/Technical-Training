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
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Net;
using System.Net.Mail;

public partial class patedit : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PreservingConnectionString"].ConnectionString);
    string ids, pna,pn,adm,des,ec,sc,xr,ut,bt,hel,disc,iidd;
    SqlDataReader rd;
    static byte[] bytes = ASCIIEncoding.ASCII.GetBytes("ZeroCool");
    bool pat;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Label15.Text=Session["duuname"].ToString();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("doctorid.aspx");
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
      
        
       
    }
    protected void DropDownList1_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        iidd=Session["idss"].ToString();
      // Response.Redirect("patedit.aspx");
       // Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);

        CheckBox4.Checked = false;
        CheckBox5.Checked = false;
        CheckBox6.Checked = false;
        CheckBox7.Checked = false;
        CheckBox8.Checked = false;
        CheckBox9.Checked = false;
        CheckBox10.Checked = false; 
        CheckBox11.Checked = false; 
        CheckBox12.Checked = false;
        CheckBox13.Checked = false;

        CheckBox4.Enabled = true;
        CheckBox5.Enabled = true;
        CheckBox6.Enabled = true;
        CheckBox7.Enabled = true;
        CheckBox8.Enabled = true;
        CheckBox9.Enabled = true;
        CheckBox10.Enabled = true;
        CheckBox11.Enabled = true;
        CheckBox12.Enabled = true;
        CheckBox13.Enabled = true;
        ImageButton2.Enabled = true;
        ImageButton3.Enabled = true;
        
        ids = DropDownList1.SelectedValue.ToString();
       
        con.Open();
        SqlCommand cmd = new SqlCommand("select name from pregis where id='" + ids + "'", con);
        pna = Convert.ToString(cmd.ExecuteScalar());
        SqlCommand cmd1 = new SqlCommand("select * from entry where patid='" + ids + "' AND  doctid='" + iidd + "' ", con);
        rd = cmd1.ExecuteReader();
        while (rd.Read())
        {
            pat = true;
            Label29.Text = rd["doctid"].ToString();
            Label30.Text = rd["docname"].ToString();
            Label31.Text = rd["patname"].ToString();
            TextBox1.Text = rd["admission"].ToString();
            TextBox2.Text = rd["disease"].ToString();
            TextBox3.Text = rd["ecg"].ToString();
            TextBox4.Text = rd["scan"].ToString();
            TextBox5.Text = rd["xray"].ToString();
            TextBox6.Text = rd["utest"].ToString();
            TextBox7.Text = rd["btest"].ToString();
            TextBox8.Text = rd["health"].ToString();
            TextBox9.Text = rd["discharge"].ToString();
        }
        rd.Close();
        con.Close();
        if (pat == true)
        {
            pn = Label31.Text.Substring(Label31.Text.Length - 1);
            //TextBox1.Text = rd["admission"].ToString();
            adm = TextBox1.Text.Substring(TextBox1.Text.Length - 1);
            //TextBox2.Text = rd["disease"].ToString();
            des = TextBox2.Text.Substring(TextBox2.Text.Length - 1);
            // TextBox3.Text = rd["ecg"].ToString();
            ec = TextBox3.Text.Substring(TextBox3.Text.Length - 1);
            //TextBox4.Text = rd["scan"].ToString();
            sc = TextBox4.Text.Substring(TextBox4.Text.Length - 1);
            // TextBox5.Text = rd["xray"].ToString();
            xr = TextBox5.Text.Substring(TextBox5.Text.Length - 1);
            // TextBox6.Text = rd["utest"].ToString();
            ut = TextBox6.Text.Substring(TextBox6.Text.Length - 1);
            //TextBox7.Text = rd["btest"].ToString();
            bt = TextBox7.Text.Substring(TextBox7.Text.Length - 1);
            //TextBox8.Text = rd["health"].ToString();
            hel = TextBox8.Text.Substring(TextBox8.Text.Length - 1);
            // TextBox9.Text = rd["discharge"].ToString();
            disc = TextBox9.Text.Substring(TextBox9.Text.Length - 1);
            if (pn == "=")
            {
                CheckBox4.Checked = true;
                CheckBox4.Enabled = false;
            }
            if (adm == "=")
            {
                CheckBox5.Checked = true;
                CheckBox5.Enabled = false;
            }
            if (des == "=")
            {
                CheckBox6.Checked = true;
                CheckBox6.Enabled = false;
            }
            if (ec == "=")
            {
                CheckBox7.Checked = true;
                CheckBox7.Enabled = false;
            }
            if (sc == "=")
            {
                CheckBox8.Checked = true;
                CheckBox8.Enabled = false;
            }
            if (xr == "=")
            {
                CheckBox9.Checked = true;
                CheckBox9.Enabled = false;
            }
            if (ut == "=")
            {
                CheckBox10.Checked = true;
                CheckBox10.Enabled = false;
            }
            if (bt == "=")
            {
                CheckBox11.Checked = true;
                CheckBox11.Enabled = false;
            }
            if (hel == "=")
            {
                CheckBox12.Checked = true;
                CheckBox12.Enabled = false;
            }
            if (disc == "=")
            {
                CheckBox13.Checked = true;
                CheckBox13.Enabled = false;
            }

            pn = "";
            adm = "";
            des = "";
            ec = "";
            sc = "";
            xr = "";
            ut = "";
            bt = "";
            hel = "";
            disc = "";
        }
        else
        {
            Response.Write("<script>alert('patient is already viewd')</script>");
            ImageButton2.Enabled = false;
            ImageButton3.Enabled = false;
        }
            
     
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("doctorid.aspx");
    }
    public static string Encrypt(string originalString)
    {
        if (String.IsNullOrEmpty(originalString))
        {
            throw new ArgumentNullException
                   ("The string which needs to be encrypted can not be null.");
        }
        DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider();
        MemoryStream memoryStream = new MemoryStream();
        CryptoStream cryptoStream = new CryptoStream(memoryStream,
            cryptoProvider.CreateEncryptor(bytes, bytes), CryptoStreamMode.Write);
        StreamWriter writer = new StreamWriter(cryptoStream);
        writer.Write(originalString);
        writer.Flush();
        cryptoStream.FlushFinalBlock();
        writer.Flush();
        return Convert.ToBase64String(memoryStream.GetBuffer(), 0, (int)memoryStream.Length);
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
         ids = DropDownList1.SelectedValue.ToString();
        con.Open();
        SqlCommand cmmd = new SqlCommand("update entry set doctid='"+Label29.Text+"',docname='"+Label30.Text+"',patid='"+ids+"',patname='"+Label31.Text+"',admission='"+TextBox1.Text+"',disease='"+TextBox2.Text+"',ecg='"+TextBox3.Text+"',scan='"+TextBox4.Text+"',xray='"+TextBox5.Text+"',utest='"+TextBox6.Text+"',btest='"+TextBox7.Text+"',health='"+TextBox8.Text+"',discharge='"+TextBox9.Text+"' where patid='"+ids+"' AND docname='"+Label15.Text+"'",con);
        cmmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('Edit Data Updated Successfully')</script>");
    }
    protected void CheckBox4_CheckedChanged1(object sender, EventArgs e)
    {
        Label31.Text = Encrypt(Label31.Text);
        CheckBox4.Enabled = false;
    }
    protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            TextBox1.Text = Encrypt(TextBox1.Text);
            CheckBox5.Enabled = false;
        }
        else
        {
            Response.Write("<script>alert('fill the text first')</script>");
            CheckBox5.Checked = false;
        }
    }
    protected void CheckBox6_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox2.Text != "")
        {
            TextBox2.Text = Encrypt(TextBox2.Text);
            CheckBox6.Enabled = false;
        }
        else
        {
            Response.Write("<script>alert('fill the text first')</script>");
            CheckBox6.Checked = false;
        }
    }
    protected void CheckBox7_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox3.Text != "")
        {
            TextBox3.Text = Encrypt(TextBox3.Text);
            CheckBox7.Enabled = false;
        }
        else
        {
            Response.Write("<script>alert('fill the text first')</script>");
            CheckBox7.Checked = false;
        }
    }
    protected void CheckBox8_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox4.Text != "")
        {
            TextBox4.Text = Encrypt(TextBox4.Text);
            CheckBox8.Enabled = false;
        }
        else
        {
            Response.Write("<script>alert('fill the text first')</script>");
            CheckBox8.Checked = false;
        }
    }
    protected void CheckBox9_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox5.Text != "")
        {
            TextBox5.Text = Encrypt(TextBox5.Text);
            CheckBox9.Enabled = false;
        }
        else
        {
            Response.Write("<script>alert('fill the text first')</script>");
            CheckBox9.Checked = false;
        }
    }
    protected void CheckBox10_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox6.Text != "")
        {
            TextBox6.Text = Encrypt(TextBox6.Text);
            CheckBox10.Enabled = false;
        }
        else
        {
            Response.Write("<script>alert('fill the text first')</script>");
            CheckBox10.Checked = false;
        }
    }
    protected void CheckBox11_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox7.Text != "")
        {
            TextBox7.Text = Encrypt(TextBox7.Text);
            CheckBox11.Enabled = false;
        }
        else
        {
            Response.Write("<script>alert('fill the text first')</script>");
            CheckBox11.Checked = false;
        }
    }
    protected void CheckBox12_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox8.Text != "")
        {
            TextBox8.Text = Encrypt(TextBox8.Text);
            CheckBox12.Enabled = false;
        }
        else
        {
            Response.Write("<script>alert('fill the text first')</script>");
            CheckBox12.Checked = false;
        }
    }
    protected void CheckBox13_CheckedChanged(object sender, EventArgs e)
    {
        if (TextBox9.Text != "")
        {
            TextBox9.Text = Encrypt(TextBox9.Text);
            CheckBox13.Enabled = false;
        }
        else
        {
            Response.Write("<script>alert('fill the text first')</script>");
            CheckBox13.Checked = false;
        }
    }
    protected void CheckBox14_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {
       //Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);
    }
}