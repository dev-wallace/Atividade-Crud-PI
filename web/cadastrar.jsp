

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        
        <%
            
        //Declara as vari�veis
        Connection conecta;
        String matricula, nome, salario;
        PreparedStatement st;
        
        
        //Receber os dados digitados no formul�rio
        matricula = request.getParameter("matricula");
        nome = request.getParameter("nome");
        salario = request.getParameter("salario");
        //Conectar com o banco de dados
        
        
        //aponta para a biblioteca JDBC
         Class.forName("com.mysql.cj.jdbc.Driver");
         
      conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/atividade_pi", "root", "root");
        //Enviar os dados recebidos para a tabela do banco de dados
        
        st = conecta.prepareStatement("INSERT INTO funcionario (matricula, nome, salario) VALUES (?, ?, ?)");

        st.setString(1,matricula);
        st.setString(2,nome);
        st.setString(3,salario);
        st.executeUpdate();
        out.print("Usuario cadastrado com sucesso");
        
        %>
        
        

    </body>
</html>