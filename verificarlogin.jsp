<%@page language="java" import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Consulta</title>
    <link rel="stylesheet" href="verifica.css">
</head>
<header>
    <div class="logo">
       <a href="Home.html">
          <img src="Imagens/gamestart.png" alt="Games Start" title="Games Start">
       </a>
    </div>
 </header>
<body>
    <%

            String vemail = request.getParameter("txtEmail");
            String vsenha = request.getParameter("txtSenha");

            // Variaveis para o banco de dados
            String banco    = "game_start" ;
            String endereco = "jdbc:mysql://localhost:3306/" + banco ;
            String usuario  = "root";
            String senha    = "" ;
        
            String driver   = "com.mysql.jdbc.Driver" ;

            //Carregar o driver na memória
            Class.forName( driver ) ;

            //Cria a variavel para conectar com banco
            Connection conexao ;

            // Abrir a conexao com o banco
            conexao = DriverManager.getConnection(endereco, usuario, senha) ;

            String sql = "SELECT * FROM usuario WHERE email=? AND senha=?";

            // Cria o statement para executar o camando no banco
            PreparedStatement stm = conexao.prepareStatement( sql );

            stm.setString(1, vemail) ;
            stm.setString(2, vsenha) ;

            ResultSet dados =  stm.executeQuery() ;

            if(dados.next())
            {
            session.setAttribute( "usuario"  ,  dados.getString("email")  ) ;
            session.setAttribute( "admin"  ,  "nao"  ) ;
            response.sendRedirect("consulta.jsp");
            }
            else
            {
                String sql2 = "SELECT * FROM administrador WHERE email=? AND senha=?";

                // Cria o statement para executar o camando no banco
                PreparedStatement stm2 = conexao.prepareStatement( sql2 );
            
                stm2.setString(1, vemail) ;
                stm2.setString(2, vsenha) ;
            
                ResultSet dados2 =  stm2.executeQuery() ;
                if(dados2.next())
                {
                session.setAttribute( "usuario"  ,  dados2.getString("email")  ) ;
                session.setAttribute( "admin"  ,  "sim"  ) ;
                response.sendRedirect("consulta.jsp");
                }
                else{
                    out.print("<h1>Login incorreto</h1>");
                    out.print("<a href='Login.html'>Home</a>");
                }
            }
            

        %>
</body>
</html>
