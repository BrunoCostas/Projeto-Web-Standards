<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Casdastro</title>
        <link rel="stylesheet" href="stylejsp.css">
        <div class="logo">
         <a href="Home.html">
           <img src="Imagens/gamestart.png" alt="Games Start" title="Games Start">
        </a>
        </div>
    </header>

    <body>
        <div class="teste">
            <%@page language="java" import="java.sql.*" %>
            <%
            // Cria as variaveis e armazena as informações digitadas pelo usuario
            String vnome      = request.getParameter("txtNome");
            String vusuario   = request.getParameter("txtUser");
            String vemail     = request.getParameter("txtEmail");
            String vsenha     = request.getParameter("txtSenha");
            
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
            
            //Abrir a conexao com o banco
            conexao = DriverManager.getConnection(endereco, usuario, senha) ;
            
            String sql = "INSERT INTO usuario (nome, usuario, email, senha) values (?,?,?,?) " ;
            
            // Cria o statement para executar o camando no banco
            PreparedStatement stm = conexao.prepareStatement( sql );
            stm.setString    ( 1 , vnome ) ;
            stm.setString    ( 2 , vusuario ) ;
            stm.setString    (3 , vemail) ;
            stm.setString    (4 , vsenha) ;
            
            stm.execute();
            
            conexao.close() ;
            stm.close() ;
            
            //Não consigo fazer a formatação funcionar
            out.print("<h1>Dados gravados com sucesso.</h1>"); 
            out.print("<br><br>");
            out.print("<a href='Home.html'>Voltar</a>");
            %>
        </div>
    </body>
</html>