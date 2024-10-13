<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        
        <%
            // Declara as variáveis
            Connection conecta = null;
            PreparedStatement st = null;
            ResultSet resultado = null;

            try {
                // Aponta para a biblioteca JDBC
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa", "root", "root");

                // Verificar se o produto com o id informado está na tabela do banco de dados 
                st = conecta.prepareStatement("SELECT * FROM produtos");

                // Esse comando executa o comando SELECT na tabela do BD
                resultado = st.executeQuery(); 

                out.print("<table border='1'>");
                out.print("<tr><th>ID</th><th>Nome</th><th>Marca</th><th>Preço</th><th>Data de Fabricação</th></tr>");

                while(resultado.next()){
                    out.print("<tr><td>" + resultado.getString("id") + "</td>" +
                              "<td>" + resultado.getString("nome") + "</td>" +
                              "<td>" + resultado.getString("marca") + "</td>" +
                              "<td>" + resultado.getString("preco") + "</td>" +
                              "<td>" + resultado.getString("data_fab") + "</td></tr>");
                }
                out.print("</table>");

            } catch (SQLException e) {
                out.print("Erro ao acessar o banco de dados: " + e.getMessage());
            } 
        %>
        
    </body>
</html>
