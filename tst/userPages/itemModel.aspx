<%@ Page Title="" Language="C#" MasterPageFile="~/userPages/gamesPage.Master" AutoEventWireup="true" CodeBehind="itemModel.aspx.cs" Inherits="tst.userPages.itemModel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content1" runat="server">

    <asp:Repeater ID="game" runat="server">
        <ItemTemplate >        
            <div class="gameBox">

                <img class="gameImage" src="./gamesImages/<%#Eval("Imagem_Jogo") %>" />
                <asp:Label ID="lblCodHidden" CssClass="hidden" runat="server" Text='<%#Eval("Cod_Jogo") %>'></asp:Label>
                <div class="contentDiv">
                    <p class="gameTitle"><%#Eval("Nome_Jogo")%></p>
                    <p class="gameDescription"><%#Eval("Sinopse_Jogo") %></p>
                </div>
    
                
                <asp:LinkButton ID="btnAddGame"  CssClass="btnAdd" runat="server" OnClick="btnAddGame_Click">Adicionar</asp:LinkButton>

                 <dialog> 
                     <asp:TextBox MaxLength="255" TextMode="MultiLine" CssClass="personalDesc" ID="txtDescription" runat="server" placeholder="Insira seus comentários sobre o jogo!"></asp:TextBox>
                     <asp:DropDownList ID="dropChoices" CssClass="dropdown" runat="server">
                            <asp:ListItem Text="Pretendo Jogar" Value="1" />
                            <asp:ListItem Text="Jogando" Value="2" />
                            <asp:ListItem Text="Finalizado" Value="3" />
                     </asp:DropDownList>
                     <asp:LinkButton ID="btnEnviarComentario" CssClass="btnComment" runat="server" Text="Enviar comentário" OnClick="btnEnviarComentario_Click"></asp:LinkButton>
                 </dialog>
               
            </div>

            <script>
                
                const modal = document.querySelector("dialog")

                function runMod() {
                    
                    modal.show();
                    
                }

                function closeMod() {
                    modal.close();
                }
            </script>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
