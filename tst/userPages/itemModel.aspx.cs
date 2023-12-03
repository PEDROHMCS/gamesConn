using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tst.userPages
{
    public partial class itemModel : System.Web.UI.Page
    {
        ClasseConexao conn;
        DataTable dt;
        int codLista, codJogo;
        string estadoJogo, descricaoJogo;
        
        


        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            { return; }

            conn = new ClasseConexao();
            dt = conn.executarSQL("exec usp_GetJogos");
            game.DataSource = dt.DefaultView;
            game.DataBind();

        }

        protected void btnAddGame_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "runMod();", true);

            string cod;
            LinkButton lb = sender as LinkButton;
            Label lbl = (Label)lb.FindControl("lblCodHidden");
            cod = lbl.Text.Trim();


            Session["gameCode"] = Convert.ToInt32(cod);

            if (Convert.ToInt32(Session["codUser"]) != 0) {

                try
                {
                    conn = new ClasseConexao();
                    dt = conn.executarSQL($"exec usp_getLista {Convert.ToInt32(Session["codUser"])}");

                    if(dt.Rows.Count > 0)
                    {
                        Session["codLista"] = dt.Rows[0]["Cod_Lista"];



                    }
                    else
                    {
                        conn = new ClasseConexao();
                        conn.executarSQL($"exec usp_insertLista {Convert.ToInt32(Session["codUser"])}");

                        conn = new ClasseConexao();
                        dt = conn.executarSQL($"exec usp_getLista {Convert.ToInt32(Session["codUser"])}");
                        Session["codLista"] = dt.Rows[0]["Cod_Lista"];
                    }

                    

                }catch (Exception ex) {
                    // Response.Write($"<script>alert('Esse jogo já foi adicionado a sua lista!')</script>");
                }         

            } else {
                Response.Redirect("pagLogin.aspx");
            }

            
                
        }



        protected void btnEnviarComentario_Click(object sender, EventArgs e)
        {
            
            conn = new ClasseConexao();


            DropDownList drop;
            TextBox textDesc;

            LinkButton lb = sender as LinkButton;
            drop = (DropDownList)lb.FindControl("dropChoices");
            textDesc = (TextBox)lb.FindControl("txtDescription");

            Session["gameStatus"] = drop.SelectedItem.Text;
            Session["gamePersonalDesc"] = textDesc.Text;

            codLista = Convert.ToInt32(Session["codLista"]);
            codJogo = Convert.ToInt32(Session["gameCode"]);
            estadoJogo = Session["gameStatus"].ToString();
            descricaoJogo = Session["gamePersonalDesc"].ToString();


            Response.Write($"<script>alert('{Session["codLista"]}')</script>");
            Response.Write($"<script>alert('{Session["gameCode"]}')</script>");
            Response.Write($"<script>alert('{Session["gamePersonalDesc"]}')</script>");
            Response.Write($"<script>alert('{Session["gameStatus"]}')</script>");

            conn.executarSQL($"exec usp_InsertListaJogo {codLista}, {codJogo}, '{descricaoJogo}', '{estadoJogo}'");
            




            ScriptManager.RegisterStartupScript(this, this.GetType(), "Out", "closeMod();", true);
            //Response.Redirect("gameUserModel.aspx");
        }
    }
}