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

        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new ClasseConexao();
            dt = conn.executarSQL("select * from tblJogo");
            game.DataSource = dt.DefaultView;
            game.DataBind();
        }
    }
}