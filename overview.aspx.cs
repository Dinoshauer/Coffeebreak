using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class overview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserOverviewRepeater.Visible = false;
        UserGroupRepeater.Visible = false;

        if (Request.QueryString["view"] == "users")
        {
            UserOverviewRepeater.Visible = true;
            Label_Heading.Text = "User list";
            Label_Descr.Text = "Click on user to see details";
            HyperLink_Create.NavigateUrl = "create.aspx?new=user";
        }
        else if (Request.QueryString["view"] == "groups")
        {
            UserGroupRepeater.Visible = true;
            Label_Heading.Text = "User levels";
            Label_Descr.Text = "Click on role to see details";
            HyperLink_Create.NavigateUrl = "create.aspx?new=role";
        }
        else
        {
            Response.Write("Something must have happened, please go back.");
        }
    }
    protected void UserOverviewRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DelUser")
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "DELETE FROM users WHERE user_id=@user_id";
            cmd.Parameters.Add("@user_id", SqlDbType.VarChar).Value = e.CommandArgument;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("overview.aspx?view=users");
        }
        if (e.CommandName == "EditUser")
        {
            Response.Redirect("add-user.aspx?Edit=" + e.CommandArgument);
        }
    }
    protected void UserGroupRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DelLevel")
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "DELETE FROM user_levels WHERE user_level_id=@user_level_id";
            cmd.Parameters.Add("@user_level_id", SqlDbType.VarChar).Value = e.CommandArgument;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("overview.aspx?view=groups");
        }
        if (e.CommandName == "EditLevel")
        {
            Response.Redirect("add-level.aspx?Edit=" + e.CommandArgument);
        }
    }
}