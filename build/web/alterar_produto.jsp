<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DAOProduto"%>
<%@page import="MODEL.Produto"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/style.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght
              @0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">

        <title>Alteração de Produtos</title>
    </head>
    <body>
        <div id="conteudo">
            <form method="post" action="ExAlterarProduto.jsp" 
                  onSubmit="return confirm('Os dados estão corretos?')">
                <h1>ALTERAR PRODUTOS</h1>
                <p>
                    <label  for="id">Código do Produto</label>
                    <input type="text" name="id" value="<%=request.getParameter("id")%>" placeholder="Código do Produto" 
                           required="required"/><span class="required"></span>
                </p>
                <p>
                    <label  for="nome">Nome</label>
                    <input type="text" name="nome" value="<%=request.getParameter("nome")%>" placeholder="Nome"
                           required="required"/><span class="required"></span>
                </p>
                <p>
                    <label for="qtd_produto">Quantidade</label>
                    <input type="text" name="quantidade" value="<%=request.getParameter("quantidade")%>"  placeholder="Quantidade"
                           required="required"/><span class="required"></span>
                </p>
                <p>
                    <input type="submit" value="ALTERAR"/>
                </p>
            </form>
            <p class="link">
                <a href="consultar_cliente.jsp">Consultar Clientes</a>
                <a href="index.jsp"> Voltar </a>
            </p>

        </div>
    </body>
</html>