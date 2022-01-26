<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/style.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght
              @0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">
        
        <title>Cadastro de Produtos</title>
    </head>

    <body>
        <div id="conteudo">
            <form method="post" action="ExInserirProduto.jsp" 
                  onSubmit="return confirm('Os dados estão corretos?')">
                <h1>CADASTRO PRODUTOS</h1>
                <p>
                    <label  for="nome"></label>
                    <input type="text" name="nome" placeholder="Nome" 
                           required="required"/><span class="required"></span>
                </p>
                <p>
                    <label for="qtd_produto"></label>
                    <input type="number" name="quantidade" placeholder="Quantidade" 
                           required="required"/><span class="required"></span>
                </p>
                <p>
                    <input type="submit" value="ENVIAR"/>
                </p>
            </form>
            <p class="link">
                <a href="consultar_produto.jsp">Consultar Produtos</a>
                <a href="index.jsp"> Voltar </a>
            </p>
        </div>        
    </body>
</html>
