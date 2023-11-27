<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pagCadastro.aspx.cs" Inherits="tst.userPages.pagCadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="./styles/styleCadastro.css"/>
    <title>Cadastre-se</title>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="container">
           <div class="headers">
               <h2>Bem vindo!</h2>
           </div>
          
           <div class="headers">
               <h1>Registre-se</h1>
           </div>
          

            <div class="inputBox">
                <asp:Label ID="lblEmail"  CssClass="lblInput" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEmail" CssClass="inputModel" placeholder="Insira seu Email" runat="server"></asp:TextBox>
            </div>
            
            <div class="inputBox">
                <asp:Label ID="lblUsername"  CssClass="lblInput" runat="server" Text="Nome de Usuario"></asp:Label>
                <asp:TextBox ID="txtUserName" CssClass="inputModel" placeholder="Insira seu nome de usuario" runat="server"></asp:TextBox>
            </div>


            <div class="inputBox">
                <asp:Label ID="lblPassword"  CssClass="lblInput" runat="server" Text="Senha"></asp:Label>
                <asp:TextBox runat="server" ID="txtSenha" CssClass="inputModel" placeholder="Insira sua senha" TextMode="Password"></asp:TextBox>
                
            </div>

            <div class="inputBox">
                <p class="lblInput">Selecione a sua foto de perfil</p>
                <label for="inputImage" id="lblUpload"></label>
                <input ID="inputImage" type="file" runat="server" name="theFile" accept="image/png, image/gif, image/jpeg, image/jpg"/>
                
            </div>


            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
            
            <p class="question">Não possui uma conta? <asp:LinkButton ID="linkRegistre" CssClass="bold" runat="server" OnClick="linkRegistre_Click">Logar-se</asp:LinkButton></p>
        </div>      

    </form>

    <script>
        let img = document.querySelector("#inputImage")
        let imgPreview = document.querySelector("#lblUpload")

        img.addEventListener('change', (e) => {
            console.log(img.files[0])
            let imgUrl = URL.createObjectURL(img.files[0])
            console.log(imgUrl)
            imgPreview.style.backgroundImage = `url(${imgUrl})`
        })

    </script>
</body>
</html>
