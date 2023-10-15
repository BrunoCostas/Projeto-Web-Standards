<%@page language="java" import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Consulta</title>
    <link rel="stylesheet" href="consulta.css">
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

        if(session.getAttribute("usuario") == null )
        {
            out.print("Conteúdo de acesso restrito");
        }
        else 
        {
            if(session.getAttribute("admin") == "nao" )
            {
                out.print( "<h1>Bem vindo(a) " +  "<br>" + session.getAttribute("usuario") + "</h1>." );    
                out.print("<a href='logout.jsp'>Logout</a>");
            }
            else{

            
            out.print( "<h1>Bem vindo(a) " +  "<br>" + session.getAttribute("usuario") + "</h1>" );

            out.print( "<br>" );
            out.print( "<a href='logout.jsp'>Logout</a>" );

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

            String sql = "SELECT * FROM usuario";

            // Cria o statement para executar o camando no banco
            PreparedStatement stm = conexao.prepareStatement( sql );

            ResultSet dados =  stm.executeQuery() ;
                
            out.print( "<table border=1>") ;
                
               out.print( "<tr>");
                    out.print("<td>");
                    out.print("<h2>Usuário</h2>");
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<h2>Nome</h2>");
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<h2>Email</h2>");
                    out.print("</td>");
                out.print("</tr>");

            while( dados.next()  ) 
            {
                out.print( "<tr>" ) ;
                out.print( "<td>" ) ;
                out.print( "<h3>" + dados.getString("usuario") + "</h3>" ) ;
                out.print( "</td>" ) ;
    
                out.print( "<td>" ) ;
                out.print("<h3>" + dados.getString("nome") + "</h3>" ) ;
                out.print( "</td>" ) ;
    
                out.print( "<td>" ) ;
                out.print("<h3>" + dados.getString("email") + "</h3>") ;
                out.print( "</td>" ) ;
              
                out.print( "</tr>" ) ;
            }
    
            out.print( "</table>" ) ;
    
            }
        }
    %>
</body>
</html>