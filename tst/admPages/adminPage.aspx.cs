using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tst.logicClasses;

namespace tst.admPages
{
    public partial class adminPage : System.Web.UI.Page
    {
        ClasseConexao conn;
        gamesConn main;
        string strFileName, strFilePath, strFolder, gameIcon;
        string gameName, gameSin, genName, genDesc, platName, platDesc;
        int gameCat;

        static bool genderState = false;
        static bool gameState = false;
        static bool platState = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            genderForm.Visible = genderState;
            gameForm.Visible = gameState;
            platForm.Visible = platState;
        }

        #region openDivHandlers
        protected void btnCadastrarPlataforma_Click(object sender, EventArgs e)
        {
            if (!platForm.Visible)
            {
                genderState = false;
                gameState = false;
                platState = true;
            }
            else
            {
                genderState = false;
                gameState = false;
                platState = false;
            }

            genderForm.Visible = genderState;
            gameForm.Visible = gameState;
            platForm.Visible = platState;
        }

        protected void btnCadastrarGenero_Click(object sender, EventArgs e)
        {
            if (!genderForm.Visible)
            {
                genderState = true;
                gameState = false;
                platState = false;
            }
            else
            {
                genderState = false;
                gameState = false;
                platState = false;
            }

            genderForm.Visible = genderState;
            gameForm.Visible = gameState;
            platForm.Visible = platState;


        }

        protected void btnCadastrarJogo_Click(object sender, EventArgs e)
        {
            if (!gameForm.Visible)
            {
                gameState = true;
                genderState = false;
                platState = false;
            }
            else
            {
                gameState = false;
                genderState = false;
                platState = false;
            }

            genderForm.Visible = genderState;
            gameForm.Visible = gameState;
            platForm.Visible = platState;
        }
        #endregion




        protected void btnCadPlat_Click(object sender, EventArgs e)
        {
            platName = (String.IsNullOrEmpty(txtPlatName.Text)) ? throw new Exception("Insira os dados") : txtPlatName.Text;
            platDesc = (String.IsNullOrEmpty(txtPlatDesc.Text)) ? throw new Exception("Insira os dados") : txtPlatDesc.Text;

            try
            {
                conn = new ClasseConexao();

                conn.executarSQL($"exec usp_InsertPlataforma '{platName}', '{platDesc}'");
                Response.Write("<script>alert('Plataforma cadastrada com sucesso!')</script>");
                // clearFields();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Erro ao inserir os dados')</script>");
            }
        }


        protected void btnCadGender_Click(object sender, EventArgs e)
        {
            genName = (String.IsNullOrEmpty(txtGenName.Text)) ? throw new Exception("Insira os dados") : txtGenName.Text;
            genDesc = (String.IsNullOrEmpty(txtGenDesc.Text)) ? throw new Exception("Insira os dados") : txtGenDesc.Text;

            try
            {
                conn = new ClasseConexao();

                conn.executarSQL($"exec usp_InsertGenero '{genName}', '{genDesc}'");
                Response.Write("<script>alert('Genero cadastrado com sucesso!')</script>");
                // clearFields();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Erro ao inserir os dados')</script>");
            }
        }





        protected void btnCadastrar_Click(object sender, EventArgs e)
        {

            gameName = (String.IsNullOrEmpty(txtGameName.Text)) ? throw new Exception("Insira os dados") : txtGameName.Text;
            gameCat = (String.IsNullOrEmpty(txtGameCat.Text)) ? throw new Exception("Insira os dados") : Convert.ToInt32(txtGameCat.Text);
            gameSin = (String.IsNullOrEmpty(txtGameSin.Text)) ? throw new Exception("Insira os dados") : txtGameSin.Text;

            gameIcon = "userIcon.png";

            createIcon();

            try
            {

                conn = new ClasseConexao();


                conn.executarSQL($"exec usp_InsertJogo {gameCat}, '{gameName}', '{gameIcon}', '{gameSin}'");
                Response.Write("<script>alert('Jogo criado com sucesso!')</script>");
                // clearFields();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Erro ao inserir os dados')</script>");
            }

        }

        protected void btnLeave_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/userPages/itemModel.aspx");

        }


        protected void createIcon()
        {
           

            try
            {
                main = new gamesConn();
                main.StrFolder = "~/userPages/gamesImages/";
                main.ImgInput = inputGameImage;
                gameIcon = main.createIcon();

            }
            catch (Exception exce)
            {
                Response.Write(exce.Message);
            }
        }
    }
}