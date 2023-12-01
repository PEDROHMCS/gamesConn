using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tst.userPages
{
    public partial class gamesPage : System.Web.UI.MasterPage
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {

            var x = (Convert.ToInt32(Session["codUser"]) != 0) ? userIcon.ImageUrl = $"~/userPages/userIcons/{Session["userImgUrl"]}" : userIcon.ImageUrl = "~/userPages/userIcons/userIcon.png";

            //Response.Write($"<script>alert('{Convert.ToInt32(Session["codUser"])}')</script>");

            
        }

        protected void userIcon_Click(object sender, ImageClickEventArgs e)
        {
            if (Convert.ToInt32(Session["codUser"]) != 0)
                if (Convert.ToInt32(Session["userType"]) != 0)
                {
                    Response.Redirect("gameUserModel.aspx");
                }
                else
                {
                    Response.Redirect("~/admPages/adminPage.aspx");
                }
                
            else
                Response.Redirect("pagLogin.aspx");
            

            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
        }
    }
}