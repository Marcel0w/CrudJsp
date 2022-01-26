<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/style.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght
              @0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">

        <title>Cadastro de Clientes</title>
    </head>
    <body>
        <div id="conteudo">
            <form method="post" action="ExInserirCliente.jsp" 
                  onSubmit="return confirm('Os dados estão corretos?')">
                <h1>CADASTRO CLIENTES</h1>
                <p>
                    <label  for="nome"></label>
                    <input type="text" name="nome" placeholder="Nome" 
                           required="required"/><span class="required"></span>
                </p>
                <p>
                    <label for="email"></label>
                    <input type="email" name="email" placeholder="E-Mail" 
                           required="required"/><span class="required"></span>
                </p>
                <p>
                    <label for="telefone"></label>
                    <input type="tel" name="telefone" placeholder="Telefone" 
                           required="required"/><span class="required"></span>
                </p>
                <p>
                    <input type="submit" value="ENVIAR"/>
                </p>
            </form>
        </div>
        <p class="link">
            <a href="consultar_cliente.jsp">Consultar Clientes</a>
            <a href="index.jsp"> Voltar </a>
        </p>
    </body>
</html>