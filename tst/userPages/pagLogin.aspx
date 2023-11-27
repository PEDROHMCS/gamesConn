<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pagLogin.aspx.cs" Inherits="tst.userPages.pagLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="./styles/styleCadastro.css"/>
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="container">
           <div class="headers">
               <h2>Bem vindo!</h2>
           </div>
          
           <div class="headers">
               <h1>Login</h1>
           </div>
          

            <div class="inputBox">
                <asp:Label ID="lblEmail"  CssClass="lblInput" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEmail" CssClass="inputModel" placeholder="Insira seu Email" runat="server"></asp:TextBox>
            </div>
           

            <div class="inputBox">
                <asp:Label ID="lblPassword"  CssClass="lblInput" runat="server" Text="Senha"></asp:Label>
                 <asp:TextBox runat="server" ID="txtSenha" CssClass="inputModel" placeholder="Insira sua senha" TextMode="Password"></asp:TextBox>
            </div>

            

            <asp:Button ID="btnLogar" runat="server" Text="Logar-se" OnClick="btnLogar_Click"/>
            
            <p class="question">Ainda não possui uma conta? <asp:LinkButton ID="linkLogar" CssClass="bold" runat="server" OnClick="linkLogar_Click">Registrar-se</asp:LinkButton></p>
        </div>

       
        

    </form>
</body>
</html>
