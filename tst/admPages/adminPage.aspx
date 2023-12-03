<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminPage.aspx.cs" Inherits="tst.admPages.adminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="./styles/styleAdmin.css"/>
    <title>Painel administrativo</title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
             <h1 class="page-Title">Painel administrativo</h1>
             <h2 class="page-Subtitle">Selecione o que deseja incluir!</h2>
        </header>
       <section class="buttons">
           <asp:Button ID="btnCadastrarJogo" CssClass="buttonModel" runat="server"  Text="Jogo" OnClick="btnCadastrarJogo_Click"/>
           <asp:Button ID="btnCadastrarGenero" CssClass="buttonModel" runat="server" Text="Genero" OnClick="btnCadastrarGenero_Click"/>
           <asp:Button ID="btnCadastrarPlataforma" CssClass="buttonModel" runat="server" Text="Plataforma" OnClick="btnCadastrarPlataforma_Click"/>
       </section>

        <section class="formSection">
            <div id="gameForm" class="gameForm" runat="server">
                <div class="formHolder">                
                    <h3>Insira os dados do jogo</h3>

                    <div class="innerBox">
                        <label class="lblModel" for="txtGameName">Nome do jogo</label>
                        <asp:TextBox ID="txtGameName" CssClass="txtInputModel" runat="server"></asp:TextBox>
                    </div>
                 
               
                    <div class="innerBox">
                        <p class="lblModel">Selecione a sua foto do jogo</p>
                        <label for="inputGameImage" id="lblUploadGame"></label>
                        <input ID="inputGameImage" type="file" runat="server" name="theFile" accept="image/png, image/gif, image/jpeg, image/jpg"/>
                    </div>
                
                    <div class="innerBox">
                        <label class="lblModel" for="txtGameCat">Codigo da categoria <span class="small-info">(somente números)</span></label>
                        <asp:TextBox ID="txtGameCat" TextMode="Number" CssClass="txtInputModel" runat="server"></asp:TextBox>
                    </div>

                    <div class="innerBox">
                        <label class="lblModel" for="txtGameSin">Sinopse do jogo</label>
                        <asp:TextBox ID="txtGameSin" TextMode="MultiLine" MaxLength="1000" CssClass="txtAreaModel" runat="server"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnCadastrar" CssClass="buttonModelEnviar" runat="server" Text="Cadastrar" OnClick="btnCadastrar_Click" />
                </div>
            </div>

            <div id="genderForm" class="genderForm" runat="server">
                <div class="formHolder">                
                    <h3>Insira os dados do genero</h3>

                    <div class="innerBox">
                        <label class="lblModel" for="txtCatName">Nome do genero</label>
                        <asp:TextBox ID="txtGenName" CssClass="txtInputModel" runat="server"></asp:TextBox>
                    </div>

                    <div class="innerBox">
                        <label class="lblModel" for="txtGameSin">Descrição do genero</label>
                        <asp:TextBox ID="txtGenDesc" TextMode="MultiLine" MaxLength="255" CssClass="txtAreaModel" runat="server"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnCadGender" CssClass="buttonModelEnviar" runat="server" Text="Cadastrar" OnClick="btnCadGender_Click"/>
                </div>
            </div>

            <div id="platForm" class="platForm" runat="server">
                <div class="formHolder">                
                    <h3>Insira os dados da plataforma</h3>

                    <div class="innerBox">
                        <label class="lblModel" for="txtCatName">Nome da plataforma</label>
                        <asp:TextBox ID="txtPlatName" CssClass="txtInputModel" runat="server"></asp:TextBox>
                    </div>

                    <div class="innerBox">
                        <label class="lblModel" for="txtGameSin">Descrição da plataforma</label>
                        <asp:TextBox ID="txtPlatDesc" TextMode="MultiLine" MaxLength="255" CssClass="txtAreaModel" runat="server"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnCadPlat" CssClass="buttonModelEnviar" runat="server" Text="Cadastrar" OnClick="btnCadPlat_Click"/>
                </div>
            </div>
        </section>

        <footer>
            <asp:Button ID="btnLogOut" CssClass="btnFooter" runat="server" Text="Deslogar-se" OnClick="btnLogOut_Click" />
            <asp:Button ID="btnLeave" CssClass="btnFooter" runat="server" Text="Sair" OnClick="btnLeave_Click" />
            
        </footer>
    </form>

     <script>
        let img = document.querySelector("#inputGameImage")
         let imgPreview = document.querySelector("#lblUploadGame")


         img.addEventListener('change', (e) => {
             let imgUrl = URL.createObjectURL(img.files[0])
             imgPreview.style.backgroundImage = `url(${imgUrl})`
         })


     </script>
</body>
</html>
