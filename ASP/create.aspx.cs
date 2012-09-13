using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel_CreateRoleTeam.Visible = false;
        Panel_CreateUser.Visible = false;
        LabelHeading.Text = "Oops!";
        LabelDescr.Text = "Something has gone wrong, please, go back and try again.";

        if (Request.QueryString["new"] == "user")
        {
            LabelHeading.Text = "Create new user";
            LabelDescr.Text = "Remember - You can assign more than one team!";
            Panel_CreateUser.Visible = true;
        }
        else if(Request.QueryString["new"] == "role")
        {
            LabelHeading.Text = "Create new role";
            LabelDescr.Text = "Don't forget to add a description!";
            Panel_CreateRoleTeam.Visible = true;
        }
        else if (Request.QueryString["new"] == "team")
        {
            LabelHeading.Text = "Create new team";
            LabelDescr.Text = "Don't forget to add a description!";
            Panel_CreateRoleTeam.Visible = true;
        }
        else if (Request.QueryString == null)
        {
            Response.Write("Something must have happened. Please go back and try again.");
        }

    }

    protected void Button_Submit_CreateUser_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["new"] == "user")
        {
            DateTime dt = DateTime.Now;
            string nu = Convert.ToString(dt);

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "INSERT INTO [users] ([user_username], [user_password], [user_email], [user_name], [user_lastname], [user_phone], [user_company], [fk_user_level], [fk_user_team], [user_creationdate]) VALUES (@user_username, @user_password, @user_email, @user_name, @user_lastname, @user_phone, @user_company, @fk_user_level, @fk_user_team, @user_creationdate)";
            cmd.Parameters.Add("@user_username", SqlDbType.VarChar).Value = TB_email.Text;
            cmd.Parameters.Add("@user_password", SqlDbType.VarChar).Value = TB_password.Text;
            cmd.Parameters.Add("@user_email", SqlDbType.VarChar).Value = TB_email.Text;
            cmd.Parameters.Add("@user_name", SqlDbType.VarChar).Value = TB_name.Text;
            cmd.Parameters.Add("@user_lastname", SqlDbType.VarChar).Value = TB_lastname.Text;
            cmd.Parameters.Add("@user_phone", SqlDbType.Int).Value = TB_phone.Text;
            cmd.Parameters.Add("@user_company", SqlDbType.VarChar).Value = TB_company.Text;
            cmd.Parameters.Add("@fk_user_level", SqlDbType.Int).Value = DropDownList_Level.SelectedValue;
            cmd.Parameters.Add("@fk_user_team", SqlDbType.Int).Value = CheckBoxList_Team.SelectedValue;
            cmd.Parameters.Add("@user_creationdate", SqlDbType.DateTime).Value = nu;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("overview.aspx?view=users");
        }
        else
        {
            Response.Write("Something must have happened. Please go back and try again.");
        }
    }
    protected void Button_Submit_CreateRoleTeam_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["new"] == "role")
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "INSERT INTO [user_levels] ([user_level_name], [user_level_description]) VALUES (@user_level_name, @user_level_description)";
            cmd.Parameters.Add("@user_level_name", SqlDbType.VarChar).Value = TextBox_RoleTeamName.Text;
            cmd.Parameters.Add("@user_level_description", SqlDbType.Text).Value = TextBox_RoleTeamDescr.Text;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("overview.aspx?view=roles");
        }
        if (Request.QueryString["new"] == "team")
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "INSERT INTO [user_team] ([user_team_name], [user_team_description]) VALUES (@user_team_name, @user_team_description)";
            cmd.Parameters.Add("@user_team_name", SqlDbType.VarChar).Value = TextBox_RoleTeamName.Text;
            cmd.Parameters.Add("@user_team_description", SqlDbType.Text).Value = TextBox_RoleTeamDescr.Text;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("overview.aspx?view=teams");
        }
    }
}