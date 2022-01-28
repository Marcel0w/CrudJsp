<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DAOCliente"%>
<%@page import="MODEL.Cliente"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/style.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght
              @0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">

        <title>Alteração de Clientes</title>
    </head>
    <body>
        <div id="conteudo">
            <form method="post" action="ExAlterarCliente.jsp" 
                  onSubmit="return confirm('Os dados estão corretos?')">
                <fieldset>
                    <h1>ALTERAR CLIENTES</h1>
                    <p>
                        <label  for="id">Código do Cliente</label>
                        <input type="text" name="id" value="<%=request.getParameter("id")%>" 
                               required="required"/><span class="required"></span>
                    </p>
                    <p>
                        <label  for="nome">Nome</label>
                        <input type="text" name="nome" value="<%=request.getParameter("nome")%>"
                               required="required"/><span class="required"></span>
                    </p>
                    <p>
                        <label for="email">E-Mail</label>
                        <input type="email" name="email" value="<%=request.getParameter("email")%>"
                               required="required"/><span class="required"></span>
                    </p>
                    <p>
                        <label for="telefone">Telefone</label>
                        <input type="tel" name="telefone" value="<%=request.getParameter("telefone")%>"
                               required="required"/><span class="required"></span>
                    </p>
                    <p>
                        <input type="submit" value="ALTERAR"/>
                    </p>
                </fieldset>
            </form>
            <p class="link">
                <a href="consultar_cliente.jsp">Consultar Clientes</a>
                <a href="index.jsp"> Voltar </a>
            </p>
        </div>
    </body>
</html>
