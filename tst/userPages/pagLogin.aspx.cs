using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tst.userPages
{
    public partial class pagLogin : System.Web.UI.Page
    {
        ClasseConexao conn;
        DataTable dt;
        bool userLogged;
        string userEmail, userPassword, username, dbEmail, dbPassword;
        byte dbUserType;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["codUser"] = 0;
        }

        protected void linkLogar_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("pagCadastro.aspx");
        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
            try
            {
                userLogged = false;
                userEmail = (String.IsNullOrEmpty(txtEmail.Text)) ? throw new Exception("Insira os dados") : txtEmail.Text;
                userPassword = (String.IsNullOrEmpty(txtSenha.Text)) ? throw new Exception("Insira os dados") : txtSenha.Text;
                // username = (String.IsNullOrEmpty(txtUserName.Text)) ? throw new Exception("Insira os dados") : txtUserName.Text;

               

                conn = new ClasseConexao();

                dt = conn.executarSQL("exec usp_GetUsuarios");

                foreach(DataRow dr in dt.Rows)
                {
                    dbEmail = dr["Email_Usuario"].ToString();
                    dbPassword = dr["Senha_Usuario"].ToString();

                    dbUserType = Convert.ToByte(dr["Tipo_Usuario"]);

                    if (userEmail == dbEmail && userPassword == dbPassword && dbUserType != 0)
                    {
                        userLogged=true;
                        Session["codUser"] = Convert.ToInt32(dr["Cod_Usuario"]);
                        Session["userImgUrl"] = dr["Icone_Usuario"];

                        

                        Response.Redirect("itemModel.aspx");
                    }else if(userEmail == dbEmail && userPassword == dbPassword && dbUserType == 0)
                    {

                        Response.Redirect("~/admPages/adminPage.aspx");
                    }

                    
                }

                if (userLogged == false)
                    throw new Exception("Email ou senha invalidos!");
                
            }catch(Exception ex)
            {
                Response.Write($"<script>alert('{ex.Message}')</script>");
            }
            
        }
    }
}