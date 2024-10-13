

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            
        //Declara as variáveis
        Connection conecta;
        String matricula;
        PreparedStatement st;
        ResultSet resultado;
        //Receber o ID digitados no formulário
        matricula = request.getParameter("matricula");
       
        //Conectar com o banco de dados
        
        
        //aponta para a biblioteca JDBC
         Class.forName("com.mysql.cj.jdbc.Driver");
         
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/atividade_pi", "root", "root");
        //Enviar os dados recebidos para a tabela do banco de dados

        //verificar se o produto com o id inforado esta na tebela do banco de dapds 
        st = conecta.prepareStatement("SELECT * FROM funcionario WHERE matricula=?" );
        st.setString(1,matricula);
        resultado = st.executeQuery(); 
        //Esse comando executa o comando SELECT na tabela do BD
      
  //Informar o usuário que os dados foram gravados
        if(resultado.next()){
            out.print("matricula: "+resultado.getString("matricula")+"<br>");
             out.print("Nome: "+resultado.getString("nome")+"<br>");
              out.print("Salario: "+resultado.getString("salario")+"<br>");
        }
       else{
        out.print("Produto nao cadastrado");
       }
        
       
        
        %>
        
        

    </body>
</html>