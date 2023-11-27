using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tst.userPages
{
    public partial class pagCadastro : System.Web.UI.Page
    {
        ClasseConexao conn;
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

            strFolder = Server.MapPath("~/userPages/userIcons/");
            strFileName = inputImage.PostedFile.FileName;
            strFileName = Path.GetFileName(strFileName);

            try
            {
                if (inputImage.Value != "")
                {

                    if (!Directory.Exists(strFolder))
                    {
                        Directory.CreateDirectory(strFolder);
                    }
                    strFilePath = strFolder + strFileName;
                    if (File.Exists(strFilePath))
                    {
                        userIcon = strFileName;
                    }
                    else
                    {
                        inputImage.PostedFile.SaveAs(strFilePath);
                        userIcon = strFileName;
                    }

                }
                else
                {
                    throw new Exception("Selecione um arquivo!");
                }

            }catch(Exception exce)
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


        private void clearFields()
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