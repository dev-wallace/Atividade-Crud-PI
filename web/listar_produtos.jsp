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
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/atividade_pi", "root", "root");

                // Verificar se o produto com o id informado está na tabela do banco de dados 
                st = conecta.prepareStatement("SELECT * FROM funcionario");

                // Esse comando executa o comando SELECT na tabela do BD
                resultado = st.executeQuery(); 

                out.print("<table border='1'>");
                out.print("<tr><th>matricula</th><th>nome</th><th>salario</th></tr>");

                while(resultado.next()){
                    out.print("<tr><td>" + resultado.getString("matricula") + "</td>" +
                              "<td>" + resultado.getString("nome") + "</td>" +
                              "<td>" + resultado.getString("salario") + "</td>");
                }
                out.print("</table>");

            } catch (SQLException e) {
                out.print("Erro ao acessar o banco de dados: " + e.getMessage());
            } 
        %>
        
    </body>
</html>
