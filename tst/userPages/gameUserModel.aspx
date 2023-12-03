<%@ Page Title="" Language="C#" MasterPageFile="~/userPages/userPages.Master" AutoEventWireup="true" CodeBehind="gameUserModel.aspx.cs" Inherits="tst.gameUserModel" %>
<asp:Content ID="userModel" ContentPlaceHolderID="main" runat="server">
    <asp:Repeater ID="userGame" runat="server">
        <ItemTemplate>            
             <div class="gameModel">
                 <div class="gameModelImage">
                     <img class="imgUserGame" src="./gamesImages/<%#Eval("Imagem_Jogo") %>"/>
                 </div>

                 <div class="contentArea">
                     <div class="contentHeader">
                         <div class="gameInfos">
                             <p class="gameTitle"><%#Eval("Nome_Jogo") %></p>
                             <p class="gameGender"><%#Eval("Nome_Genero") %></p>
                             <p class="gameStatus"><%#Eval("Estado_Lista_Jogo") %></p>
                         </div>
                         <asp:Button ID="btnEdit" CssClass="btnEdit" runat="server" Text="Editar" />
                     </div >
                     <div class="gameComments">
                         <p><%#Eval("Descricao_Lista_Jogo") %></p>
                     </div>
                 </div>
             </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>