﻿<%@ Page Title="" Language="C#" MasterPageFile="~/userPages/userPages.Master" AutoEventWireup="true" CodeBehind="gameUserModel.aspx.cs" Inherits="tst.gameUserModel" %>
<asp:Content ID="userModel" ContentPlaceHolderID="main" runat="server">
    <asp:Repeater ID="userGame" runat="server">
        <ItemTemplate>            
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>