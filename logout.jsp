<link rel="stylesheet" href="styleconsulta.css">
<%

  if( session != null ){
    session.invalidate() ;
    response.sendRedirect("Home.html");
  }


%>