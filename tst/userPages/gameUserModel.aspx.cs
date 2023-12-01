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
        ClasseConexao conn;
        DataTable Dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new ClasseConexao();
            Dt = conn.executarSQL($"exec listarJogosUsuario {Session["codUser"]}");
            userGame.DataSource = Dt;
            userGame.DataBind();
        }
    }
}