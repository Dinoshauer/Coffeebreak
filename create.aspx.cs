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
        Label_Fejl.Visible = false;
        LabelHeading.Text = "Opret bruger";
        LabelHeading.Visible = true;
        Button_SubmitEdit.Visible = false;
        creationDateLabel.Visible = false;
        lastLoginDateLabel.Visible = false;

        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();

        if (!IsPostBack)
        {
            if (Request.QueryString["Edit"] != null)
            {
                TB_password_again.Visible = false;
                password_again.Visible = false;
                CompareValidator1.Visible = false;
                LabelHeading.Text = "Rediger bruger";
                Button_SubmitEdit.Visible = true;
                Button_Submit.Visible = false;
                creationDateLabel.Visible = true;
                lastLoginDateLabel.Visible = true;

                SqlCommand cmd_GetData = new SqlCommand();
                cmd_GetData.Connection = conn;
                cmd_GetData.CommandText = "SELECT * FROM users INNER JOIN user_levels ON users.fk_user_level = user_levels.user_level_id INNER JOIN user_team ON users.fk_user_team = user_team.user_team_id WHERE user_id=@user_id";
                cmd_GetData.Parameters.Add("@user_id", SqlDbType.Int).Value = Request.QueryString["Edit"];

                conn.Open();

                SqlDataReader reader = cmd_GetData.ExecuteReader();
                if (reader.Read())
                {
                    TB_email.Text = Convert.ToString(reader["user_email"]);
                    TB_password.Text = Convert.ToString(reader["user_password"]);
                    TB_name.Text = Convert.ToString(reader["user_name"]);
                    TB_lastname.Text = Convert.ToString(reader["user_lastname"]);
                    TB_phone.Text = Convert.ToString(reader["user_phone"]);
                    TB_company.Text = Convert.ToString(reader["user_company"]);
                    DropDownList_Level.SelectedValue = Convert.ToString(reader["fk_user_level"]);
                    CheckBoxList_Team.SelectedValue = Convert.ToString(reader["fk_user_team"]);
                    creationDateLabel.Text = Convert.ToString(reader["user_creationdate"]);
                    lastLoginDateLabel.Text = Convert.ToString(reader["user_lastlogindate"]);
                }
                conn.Close();
            }
        }
    }
    protected void Button_Submit_Click(object sender, EventArgs e)
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

    protected void Button_SubmitEdit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();

            SqlCommand cmd_UpdateData = new SqlCommand();
            cmd_UpdateData.Connection = conn;
            cmd_UpdateData.CommandText = "UPDATE users SET user_username = @user_username, user_password = @user_password, user_email = @user_email, user_name = @user_name, user_lastname = @user_lastname, user_phone = @user_phone, user_company = @user_company, fk_user_level = @fk_user_level, fk_user_team = @fk_user_team, fk_user_team_secondary = @fk_user_team_secondary, fk_user_team_third = @fk_user_team_third, fk_user_team_fourth = @fk_user_team_fourth, fk_user_team_fifth = @fk_user_team_fifth, user_creationdate = @user_creationdate, user_lastlogindate = @user_lastlogindate WHERE user_id = @user_id";
            cmd_UpdateData.Parameters.Add("@user_id", SqlDbType.Int).Value = Request.QueryString["Edit"];
            cmd_UpdateData.Parameters.Add("@user_username", SqlDbType.VarChar).Value = TB_email.Text;
            cmd_UpdateData.Parameters.Add("@user_password", SqlDbType.VarChar).Value = TB_password.Text;
            cmd_UpdateData.Parameters.Add("@user_email", SqlDbType.VarChar).Value = TB_email.Text;
            cmd_UpdateData.Parameters.Add("@user_name", SqlDbType.VarChar).Value = TB_name.Text;
            cmd_UpdateData.Parameters.Add("@user_lastname", SqlDbType.VarChar).Value = TB_lastname.Text;
            cmd_UpdateData.Parameters.Add("@user_phone", SqlDbType.Int).Value = TB_phone.Text;
            cmd_UpdateData.Parameters.Add("@user_company", SqlDbType.VarChar).Value = TB_company.Text;
            cmd_UpdateData.Parameters.Add("@fk_user_level", SqlDbType.Int).Value = DropDownList_Level.SelectedValue;
            cmd_UpdateData.Parameters.Add("@fk_user_team", SqlDbType.Int).Value = CheckBoxList_Team.SelectedValue;
            cmd_UpdateData.Parameters.Add("@fk_user_team_secondary", SqlDbType.Int).Value = CheckBoxList_Team.SelectedValue;
            cmd_UpdateData.Parameters.Add("@fk_user_team_third", SqlDbType.Int).Value = CheckBoxList_Team.SelectedValue;
            cmd_UpdateData.Parameters.Add("@fk_user_team_fourth", SqlDbType.Int).Value = CheckBoxList_Team.SelectedValue;
            cmd_UpdateData.Parameters.Add("@fk_user_team_fifth", SqlDbType.Int).Value = CheckBoxList_Team.SelectedValue;
            cmd_UpdateData.Parameters.Add("@user_creationdate", SqlDbType.DateTime).Value = creationDateLabel.Text;
            cmd_UpdateData.Parameters.Add("@user_lastlogindate", SqlDbType.DateTime).Value = lastLoginDateLabel.Text;

            conn.Open();
            cmd_UpdateData.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("overview.aspx?view=users");
        }
        catch (Exception ex)
        {
            Label_Fejl.Visible = true;
            Label_Fejl.Text = ex.Message;
        }
    }
}