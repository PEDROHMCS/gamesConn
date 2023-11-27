<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="tst.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link rel="stylesheet" href="style.css"/>
 <title></title>
</head>
<body>
    <form id="form1" runat="server">
           <header runat="server">
        <asp:ImageButton ID="userIcon" CssClass="userIcon" runat="server" ImageUrl="~/resources/jinxedejinx.jpg" />
        <nav>

        </nav>
    </header>


    <div class="gamesDiv">

    <div class="gameBox">
        <asp:Image CssClass="gameImage" ID="Image1" runat="server" ImageUrl="~/resources/hollow.jpg" />

        <div class="contentDiv">
            <p class="gameTitle">This is the game title</p>
            <p class="gameDescription">This is the whole game description This is the whole game description This is the whole game descriptionThis is the whole game descriptionThis is the whole game descriptionThis is the whole game descriptionThis is the whole game description</p>
        </div>
        
        <asp:Button ID="btnAddGameOne" runat="server" Text="Add" CssClass="btnAdd" OnClick="addButtonEventHandler" />
    </div>

    <div class="gameBox">
        <asp:Image CssClass="gameImage" ID="Image2" runat="server" ImageUrl="~/resources/hollow.jpg" />

        <div class="contentDiv">
            <p class="gameTitle">This is the game title</p>
            <p class="gameDescription">This is the whole game description This is the whole game description This is the whole game descriptionThis is the whole game descriptionThis is the whole game descriptionThis is the whole game descriptionThis is the whole game description</p>
        </div>
        
        <asp:Button ID="Button1" runat="server" CssClass="btnAdd" Text="Add" OnClick="addButtonEventHandler" />
    </div>

</div>
    </form>
</body>
</html>
