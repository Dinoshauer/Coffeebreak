using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel_TeamRoleEdit.Visible = false;
        Panel_UserEdit.Visible = false;
        LabelHeading.Text = "Oops!";
        LabelDescr.Text = "Something has gone wrong, please, go back and try again.";

        //Opret connection så vi kan bruge conn hele vejen igennem
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();

        SqlCommand cmd_GetData = new SqlCommand();
        cmd_GetData.Connection = conn;
            
        if (Request.QueryString["user"] != null)
        {
            Panel_UserEdit.Visible = true;
            LabelHeading.Text = "Editing user";
            cmd_GetData.CommandText = "SELECT * FROM users INNER JOIN user_levels ON users.fk_user_level = user_levels.user_level_id INNER JOIN user_team ON users.fk_user_team = user_team.user_team_id WHERE user_id=@user_id";
            cmd_GetData.Parameters.Add("@user_id", SqlDbType.Int).Value = Request.QueryString["user"];
            conn.Open();

            SqlDataReader reader = cmd_GetData.ExecuteReader();
            if (reader.Read())
            {
                TextBox_Email.Text = Convert.ToString(reader["user_email"]);
                TextBox_Password.Text = Convert.ToString(reader["user_password"]);
                TextBox_FirstName.Text = Convert.ToString(reader["user_name"]);
                TextBox_Lastname.Text = Convert.ToString(reader["user_lastname"]);
                TextBox_Phone.Text = Convert.ToString(reader["user_phone"]);
                TextBox_Company.Text = Convert.ToString(reader["user_company"]);
                DropDownList_Role.SelectedValue = Convert.ToString(reader["fk_user_level"]);
                CheckBoxList_Teams.SelectedValue = Convert.ToString(reader["fk_user_team"]);
                TextBox_CreationDate.Text = Convert.ToString(reader["user_creationdate"]);
                if (reader["user_lastlogindate"] == null)
                {
                    TextBox_LastLoginDate.Text = "This user has not yet logged in.";
                }
                else
                {
                    TextBox_LastLoginDate.Text = Convert.ToString(reader["user_lastlogindate"]);
                }
            }
        }
        else if (Request.QueryString["role"] != null)
        {
            Panel_TeamRoleEdit.Visible = true;
            LabelHeading.Text = "Editing role";
            cmd_GetData.CommandText = "SELECT * FROM user_levels WHERE user_level_id=@user_level_id";
            cmd_GetData.Parameters.Add("@user_level_id", SqlDbType.Int).Value = Request.QueryString["role"];
            conn.Open();

            SqlDataReader reader = cmd_GetData.ExecuteReader();
            if (reader.Read())
            {
                TextBox_TeamRoleName.Text = Convert.ToString(reader["user_level_name"]);
                TextBox_Descr.Text = Convert.ToString(reader["user_level_description"]);
            }
        }
        else if (Request.QueryString["team"] != null)
        {
            Panel_TeamRoleEdit.Visible = true;
            LabelHeading.Text = "Editing team";
            cmd_GetData.CommandText = "SELECT * FROM user_team WHERE user_team_id=@user_team_id";
            cmd_GetData.Parameters.Add("@user_team_id", SqlDbType.Int).Value = Request.QueryString["team"];
            conn.Open();

            SqlDataReader reader = cmd_GetData.ExecuteReader();
            if (reader.Read())
            {
                TextBox_TeamRoleName.Text = Convert.ToString(reader["user_team_name"]);
                TextBox_Descr.Text = Convert.ToString(reader["user_team_description"]);
            }
        }

        conn.Close();
    }
    protected void LinkButton_TeamRole_Submit_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (Request.QueryString["team"] != null)
            {
                try
                {
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();

                    SqlCommand cmd_UpdateData = new SqlCommand();
                    cmd_UpdateData.Connection = conn;
                    cmd_UpdateData.CommandText = "UPDATE user_team SET user_team_id = @user_team_id, user_team_name = @user_team_name, user_team_description = @user_team_description WHERE user_team_id = @user_team_id";
                    cmd_UpdateData.Parameters.Add("@user_team_id", SqlDbType.Int).Value = Request.QueryString["team"];
                    cmd_UpdateData.Parameters.Add("@user_team_name", SqlDbType.VarChar).Value = TextBox_TeamRoleName.Text;
                    cmd_UpdateData.Parameters.Add("@user_team_description", SqlDbType.Text).Value = TextBox_Descr.Text;

                    conn.Open();
                    cmd_UpdateData.ExecuteNonQuery();
                    conn.Close();

                    Response.Redirect("overview.aspx?view=teams");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            else if (Request.QueryString["role"] != null)
            {
                try
                {
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();

                    SqlCommand cmd_UpdateData = new SqlCommand();
                    cmd_UpdateData.Connection = conn;
                    cmd_UpdateData.CommandText = "UPDATE user_levels SET user_level_id = @user_level_id, user_level_name = @user_level_name, user_level_description = @user_level_description WHERE user_level_id = @user_level_id";
                    cmd_UpdateData.Parameters.Add("@user_level_id", SqlDbType.Int).Value = Request.QueryString["role"];
                    cmd_UpdateData.Parameters.Add("@user_level_name", SqlDbType.VarChar).Value = TextBox_TeamRoleName.Text;
                    cmd_UpdateData.Parameters.Add("@user_level_description", SqlDbType.Text).Value = TextBox_Descr.Text;

                    conn.Open();
                    cmd_UpdateData.ExecuteNonQuery();
                    conn.Close();

                    Response.Redirect("overview.aspx?view=roles");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
    protected void LinkButton_User_Submit_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            try
            {
                //Try convert textbox.text strings to datetime
                DateTime CreationDate;
                CreationDate = Convert.ToDateTime(TextBox_CreationDate.Text);
                DateTime LastLoginDate;
                LastLoginDate = Convert.ToDateTime(TextBox_LastLoginDate.Text);

                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();

                SqlCommand cmd_UpdateData = new SqlCommand();
                cmd_UpdateData.Connection = conn;
                cmd_UpdateData.CommandText = "UPDATE users SET user_username = @user_username, user_password = @user_password, user_email = @user_email, user_name = @user_name, user_lastname = @user_lastname, user_phone = @user_phone, user_company = @user_company, fk_user_level = @fk_user_level, fk_user_team = @fk_user_team, fk_user_team_secondary = @fk_user_team_secondary, fk_user_team_third = @fk_user_team_third, fk_user_team_fourth = @fk_user_team_fourth, fk_user_team_fifth = @fk_user_team_fifth, user_creationdate = @user_creationdate, user_lastlogindate = @user_lastlogindate WHERE user_id = @user_id";
                cmd_UpdateData.Parameters.Add("@user_id", SqlDbType.Int).Value = Request.QueryString["user"];
                cmd_UpdateData.Parameters.Add("@user_username", SqlDbType.VarChar).Value = TextBox_Email.Text;
                cmd_UpdateData.Parameters.Add("@user_password", SqlDbType.VarChar).Value = TextBox_Password.Text;
                cmd_UpdateData.Parameters.Add("@user_email", SqlDbType.VarChar).Value = TextBox_Email.Text;
                cmd_UpdateData.Parameters.Add("@user_name", SqlDbType.VarChar).Value = TextBox_FirstName.Text;
                cmd_UpdateData.Parameters.Add("@user_lastname", SqlDbType.VarChar).Value = TextBox_Lastname.Text;
                cmd_UpdateData.Parameters.Add("@user_phone", SqlDbType.Int).Value = TextBox_Phone.Text;
                cmd_UpdateData.Parameters.Add("@user_company", SqlDbType.VarChar).Value = TextBox_Company.Text;
                cmd_UpdateData.Parameters.Add("@fk_user_level", SqlDbType.Int).Value = DropDownList_Role.SelectedValue;
                cmd_UpdateData.Parameters.Add("@fk_user_team", SqlDbType.Int).Value = CheckBoxList_Teams.SelectedValue;
                cmd_UpdateData.Parameters.Add("@fk_user_team_secondary", SqlDbType.Int).Value = CheckBoxList_Teams.SelectedValue;
                cmd_UpdateData.Parameters.Add("@fk_user_team_third", SqlDbType.Int).Value = CheckBoxList_Teams.SelectedValue;
                cmd_UpdateData.Parameters.Add("@fk_user_team_fourth", SqlDbType.Int).Value = CheckBoxList_Teams.SelectedValue;
                cmd_UpdateData.Parameters.Add("@fk_user_team_fifth", SqlDbType.Int).Value = CheckBoxList_Teams.SelectedValue;
                cmd_UpdateData.Parameters.Add("@user_creationdate", SqlDbType.DateTime).Value = CreationDate;
                if (TextBox_LastLoginDate.Text == null)
                {
                    cmd_UpdateData.Parameters.Add("@user_lastlogindate", SqlDbType.DateTime).Value = null;
                }
                else
                {
                    cmd_UpdateData.Parameters.Add("@user_lastlogindate", SqlDbType.DateTime).Value = LastLoginDate;
                }

                conn.Open();
                cmd_UpdateData.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("overview.aspx?view=users");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}