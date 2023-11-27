<%@ Page Title="" Language="C#" MasterPageFile="~/userPages/gamesPage.Master" AutoEventWireup="true" CodeBehind="itemModel.aspx.cs" Inherits="tst.userPages.itemModel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content1" runat="server">

    <asp:Repeater ID="game" runat="server">
        <ItemTemplate >        
            <div class="gameBox">

                <img class="gameImage" src="./gamesImages/<%#Eval("Imagem_Jogo") %>" />

                <div class="contentDiv">
                    <p class="gameTitle"><%#Eval("Nome_Jogo")%></p>
                    <p class="gameDescription"><%#Eval("Sinopse_Jogo") %></p>
                </div>
    
                <asp:Button ID="btnAddGameOne" runat="server" Text="Add" CssClass="btnAdd" />
            </div>

        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
