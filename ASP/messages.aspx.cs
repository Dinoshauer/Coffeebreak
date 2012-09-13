using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class messages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HyperLink_Create.NavigateUrl = "reader.aspx?create=new";
    }
    protected void MessageOverviewRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DelMsg")
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "DELETE FROM internal_messages WHERE internal_message_id=@internal_message_id";
            cmd.Parameters.Add("@internal_message_id", SqlDbType.VarChar).Value = e.CommandArgument;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("messages.aspx");
        }
        if (e.CommandName == "ReplyMsg")
        {
            Response.Redirect("reader.aspx?ReplyTo=" + e.CommandArgument);
        }
        if (e.CommandName == "ForwardMsg")
        {
            Response.Redirect("reader.aspx?Forward=" + e.CommandArgument);
        }
    }
}