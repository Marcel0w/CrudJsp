<%@page import="DAO.DAOCliente"%>
<%@page import="MODEL.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/style.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght
              @0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">

        <title>Alterar Cliente</title>
    </head>
    <body>
        <div class="conf">
            <p id="conf">
                <%
                    Cliente cli = new Cliente();
                    DAOCliente cld = new DAOCliente();
                    try {
                        // Pegar os valores passados pelo navegador via método POST
                        int id = Integer.parseInt(request.getParameter("id"));
                        String nome = request.getParameter("nome");
                        String email = request.getParameter("email");
                        String telefone = request.getParameter("telefone");
                        // Passar os valores para a MODEL
                        cli.setId(id);
                        cli.setNome(nome);
                        cli.setEmail(email);
                        cli.setTelefone(telefone);
                        cld.EditarCliente(cli);
                        out.print("Cliente " + cli.getNome() + " alterado com sucesso!");
                        out.print("<meta http-equiv+'refresh' content='3, url=index.jsp'>");
                    } catch (Exception erro) {
                        throw new RuntimeException("Erro executar editar cliente: " + erro);
                    }
                %>
            </p>
            <p class="link">
                <a href="consultar_cliente.jsp"> VOLTAR </a>
            </p>
        </div>
        <script>
            alert("Cliente alterado com sucesso !");
        </script>
    </body>
</html>
