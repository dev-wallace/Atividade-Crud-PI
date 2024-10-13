<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir produtos</title>
    </head>
    <body>
        <% 
            Connection conecta = null;
            PreparedStatement st = null;

            try {
                // Receber o ID do produto a ser excluído
                int id = Integer.parseInt(request.getParameter("id"));

                /* Conectar com o banco de dados */
                Class.forName("com.mysql.cj.jdbc.Driver"); // Aponta para a biblioteca JDBC
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/empresa", "root", "root");

                /* Excluir produto do banco de dados */
                st = conecta.prepareStatement("DELETE FROM produtos WHERE ID = ?");
                st.setInt(1, id); // Define o valor do parâmetro ID

                int status = st.executeUpdate(); // Executa o DELETE na tabela do DB

                if (status == 1) {
                    out.print("Produto excluído com sucesso.");
                } else {
                    out.print("Produto não encontrado.");
                }

            } catch (Exception e) {
                out.print("Erro ao excluir o produtos " + e.getMessage());
            } finally {
                // Fechar recursos para evitar vazamento de memória
                if (st != null) try { st.close(); } catch (Exception e) { e.printStackTrace(); }
                if (conecta != null) try { conecta.close(); } catch (Exception e) { e.printStackTrace(); }
            }
        %>
    </body>
</html>
