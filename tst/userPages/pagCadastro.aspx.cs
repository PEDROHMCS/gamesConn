using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tst.logicClasses;

namespace tst.userPages
{
    public partial class pagCadastro : System.Web.UI.Page
    {
        ClasseConexao conn;
        gamesConn main;
        string userEmail, userPassword, username, userIcon;

        string strFileName, strFilePath, strFolder;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkRegistre_Click(object sender, EventArgs e)
        {
            Response.Redirect("pagLogin.aspx");
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            userEmail = (String.IsNullOrEmpty(txtEmail.Text)) ? throw new Exception("Insira os dados") : txtEmail.Text;
            userPassword = (String.IsNullOrEmpty(txtSenha.Text)) ? throw new Exception("Insira os dados") : txtSenha.Text;
            username = (String.IsNullOrEmpty(txtUserName.Text)) ? throw new Exception("Insira os dados") : txtUserName.Text;
            userIcon = null;

            try
            {

                main = new gamesConn();
                main.StrFolder = "~/userPages/userIcons/";
                main.ImgInput = inputImage;
                userIcon = main.createIcon();

            }
            catch(Exception exce)
            {
                Response.Write(exce.Message);
            }           


            try
            {
                conn = new ClasseConexao();

                //conn.executarSQL($"insert into Usuario(nomeUsuario, email, senha) values ('{username}', '{userEmail}', '{userPassword}')");
                conn.executarSQL($"exec usp_InsertUsuario '{username}', '{userPassword}', '{userEmail}', '{userIcon}', 1");
                Response.Write("<script>alert('Conta criada com sucesso!')</script>");
                clearFields();
            }catch(Exception ex)
            {
                Response.Write("<script>alert('Erro ao inserir os dados')</script>");
            }
            
        }


        private void clearFields(TextBox t1, TextBox t2, TextBox)
        {
            txtEmail.Text = "";
            txtSenha.Text = "";
            txtUserName.Text = "";
        }

        private void CheckFields(TextBox field)
        {

        }
    }
}