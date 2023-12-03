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
                         <asp:Label ID="lblHiddenEdit" CssClass="hidden" Text='<%#Eval("Cod_Jogo") %>' runat="server" ></asp:Label>
                         <asp:Label ID="lblHiddenEditList" CssClass="hidden" Text='<%#Eval("Cod_Lista") %>' runat="server" ></asp:Label>
                         <asp:LinkButton ID="LinkButton1" CssClass="btnEdit" runat="server" OnClick="btnEdit_Click">Editar</asp:LinkButton>
                     </div >
                     <div class="gameComments">
                         <p><%#Eval("Descricao_Lista_Jogo") %></p>
                     </div>
                 </div>

                 <dialog> 
                    <asp:TextBox MaxLength="255" TextMode="MultiLine" CssClass="personalDesc" ID="txtEdit" runat="server" placeholder="Insira seus comentários sobre o jogo!"></asp:TextBox>
                     <asp:DropDownList ID="dropEditChoices" CssClass="dropdown" runat="server">
                           <asp:ListItem Text="Pretendo Jogar" Value="1" />
                           <asp:ListItem Text="Jogando" Value="2" />
                           <asp:ListItem Text="Finalizado" Value="3" />
                    </asp:DropDownList>
                    <asp:LinkButton ID="btnUpdateComentario" CssClass="btnComment" runat="server" Text="Atualizar comentário" OnClick="btnUpdateComentario_Click"></asp:LinkButton>
                </dialog>
               
             </div>

             <script>

                 const modal = document.querySelector("dialog")

                 function runMod() {

                     modal.showModal();

                 }

                 function closeMod() {
                     modal.close();
                 }
             </script>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>