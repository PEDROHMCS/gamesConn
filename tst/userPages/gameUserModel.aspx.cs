using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tst
{
    public partial class gameUserModel : System.Web.UI.Page
    {
        int codLista, codJogo;
        string newDesc, newState;
        ClasseConexao conn;
        DataTable Dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            { return; }

            conn = new ClasseConexao();
            Dt = conn.executarSQL($"exec listarJogosUsuario {Session["codUser"]}");
            userGame.DataSource = Dt;
            userGame.DataBind();
        }

        protected void btnUpdateComentario_Click(object sender, EventArgs e)
        {
            conn = new ClasseConexao();
            DropDownList drop;
            TextBox textDesc;

            LinkButton lb = sender as LinkButton;
            drop = (DropDownList)lb.FindControl("dropEditChoices");
            textDesc = (TextBox)lb.FindControl("txtEdit");

            Session["gameStatusClickedGame"] = drop.SelectedItem.Text;
            Session["GamePersonalDescClickedGame"] = textDesc.Text;

            codLista = Convert.ToInt32(Session["codClickedList"]);
            codJogo = Convert.ToInt32(Session["codClickedGame"]);
            newDesc = Session["GamePersonalDescClickedGame"].ToString();
            newState = Session["gameStatusClickedGame"].ToString();

            Response.Write($"<script>alert('{codLista}')</script>");
            Response.Write($"<script>alert('{codJogo}')</script>");
            Response.Write($"<script>alert('{newDesc}')</script>");
            Response.Write($"<script>alert('{newState}')</script>");
            try
            {
                conn.executarSQL($"exec usp_UpdateListaJogo {codLista}, {codJogo}, '{newDesc}', '{newState}'");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Out", "closeMod();", true);
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
            catch(Exception err)
            {
                Response.Write($"<script>alert('{err.Message}')</script>");
            }
           


            
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "runMod();", true);

            string codClickedGame, codClickedList;
            LinkButton lb = sender as LinkButton;
            Label lbl = (Label)lb.FindControl("lblHiddenEdit");
            Label lblCodLista = (Label)lb.FindControl("lblHiddenEditList");
            codClickedGame = lbl.Text.Trim();
            codClickedList = lblCodLista.Text.Trim();
            Session["codClickedGame"] = codClickedGame.ToString();
            Session["codClickedList"] = codClickedList.ToString();

        }
    }
}