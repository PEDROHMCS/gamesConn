using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tst.userPages
{
    public partial class userPages : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var x = (Convert.ToInt32(Session["codUser"]) != 0) ? imgUserIcon.ImageUrl = $"~/userPages/userIcons/{Session["userImgUrl"]}" : imgUserIcon.ImageUrl = "~/userPages/userIcons/userIcon.png";
        }

        protected void lbUserLogoff_Click(object sender, EventArgs e)
        {
            Session["codUser"] = 0;
            Response.Redirect("~/userPages/itemModel.aspx");
        }

        protected void lblHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("itemModel.aspx");
        }
    }
}