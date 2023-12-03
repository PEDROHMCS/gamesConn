<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userPage.aspx.cs" Inherits="tst.userPages.userPagePlaceHolder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="./styles/userPage.css"/>
    <title>Meus jogos</title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>GamesConn</h1>

            <div class="header-userInfos">
                <asp:ImageButton ID="imgUserIcon" runat="server" ImageUrl="./userIcons/userIcon.png" />
                <asp:LinkButton ID="lbUserLogoff" runat="server">Deslogar-se</asp:LinkButton>
            </div>
        </header>

        <main>
            <div class="gameModel">
                <div class="gameModelImage">
                    <img class="imgUserGame" src="./gamesImages/hollow.jpg"/>
                </div>

                <div class="contentArea">
                    <div class="contentHeader">
                        <div class="gameInfos">
                            <p class="gameName">Game Name</p>
                            <p class="gameGender">Game Gender</p>
                            <p class="gameStatus">Game Status</p>
                        </div>
                        <asp:Button ID="btnEdit" CssClass="btnEdit" runat="server" Text="Editar" />
                    </div >
                    <div class="gameComments">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus posuere lectus nunc, sed interdum metus cursus a. In hac habitasse platea dictumst. Maecenas dolor nisi, volutpat sed facilisis eget, vestibulum et urna. Etiam ut ligula aliquet tellus commodo auctor a facilisis nibh. Nam malesuada ultrices eros ut venenatis. Quisque diam quam, consequat nec risus non, maximus pharetra lacus. In mattis iaculis porta. Proin neque mauris, consectetur id elit ut, accumsan ultrices lorem. Cras suscipit nec purus id tincidunt. Vivamus placerat ullamcorper metus, in convallis tortor. Suspendisse volutpat ligula ante, eget euismod eros dapibus a. Vestibulum auctor pretium velit sit amet varius.Nullam malesuada porttitor dolor, quis congue turpis ultrices ut. Sed in turpis nec ante porta condimentum nec ut metus. In id sapien nec ex mattis accumsan. Vestibulum non ex quis massa tristique scelerisque. Fusce ante purus, laoreet eu libero id, tincidunt posuere enim. Quisque aliquet, turpis at porta ultrices, arcu elit accumsan felis, sed malesuada nunc ipsum sit amet sapien. Suspendisse vel est diam. Mauris efficitur cursus purus, ac convallis est. Nullam viverra sem at ante malesuada, non tincidunt enim tempus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse eu felis ut orci mattis aliquet. Cras.</p>
                    </div>
                </div>
            </div>
        </main>
    </form>
</body>
</html>
