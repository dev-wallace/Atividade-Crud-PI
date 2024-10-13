<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar Produto</title>
    </head>
    <body>
        <% 
            Connection conecta = null;
            PreparedStatement st = null;

            // Declaração de variáveis
            String n, m, d;
            int i;
            double p;

            // Receber os parâmetros do formulário
            i = Integer.parseInt(request.getParameter("id"));
            n = request.getParameter("nome");
            m = request.getParameter("marca");
            p = Double.parseDouble(request.getParameter("preco"));
            d = request.getParameter("data_fab");
          
            try {
                // Conectar com o banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver"); // Aponta para a biblioteca JDBC
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa", "root", "root");

                // Verificar se o produto já está armazenado e inserir um novo produto
                st = conecta.prepareStatement("INSERT INTO produtos (id, nome, marca, preco, data_fab) VALUES (?, ?, ?, ?, ?)");
                
                st.setInt(1, i);
                st.setString(2, n);
                st.setString(3, m);
                st.setDouble(4, p);
                st.setString(5, d);
                
                st.executeUpdate(); // Executa o INSERT na tabela do DB
                
                // Informar o usuário que os dados foram gravados
                out.print("Produto adicionado com sucesso!");

            } catch (SQLException erro) {
                // Tratar erro de chave duplicada
                if (erro.getMessage().contains("Duplicate entry")) {
                    out.print("Este produto já está cadastrado.");
                } else {
                    out.print("ERRO: Entre em contato com o administrador.");
                }
            } finally {
                // Fechar recursos
                if (st != null) try { st.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conecta != null) try { conecta.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>   
    </body>
</html>
