<%-- 
    Document   : recherche
    Created on : 4 mars 2023, 15:28:58
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">
	
	<title>facture</title>

	<link rel="shortcut icon" href="assets/images/gt_favicon.png">
	
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">

	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="assets/css/main.css">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                                <a class="navbar-brand" href="index.jsp"><img src="assets/images/logo.jpg" alt="Logo Jovena" style="width: 10%;"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li class="active"><a href="index.jsp">Clients</a></li>
					<li><a href="produit.jsp">Produits</a></li>
					<li>
						<a href="achat.jsp">Achats</a>
					</li>
					<li><a href="facture.jsp">Facturation</a></li>
					<li><a class="btn" href="signin.html">SIGN IN / SIGN UP</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div> 
	<!-- /.navbar -->
        <!-- Header -->
	<header id="head">
		<div class="container">
			<div class="row">
				<h1 class="lead">Faites la recherche du facture a imprimer</h1>
				
				<p><a class="btn btn-default btn-lg" role="button">Vous pouvez y aller!</a>
			</div>
		</div>
	</header>
	<!-- /Header -->
        <!-- Intro -->
	<div class="container text-center">
		<br> <br>
		<h2 class="thin">STATION JOVENA</h2>
		
	</div>
	<!-- /Intro-->
        <div>
            <form action="facture.jsp" method="post" class="form-inline">
                        <span><input type="text" placeholder="facture n*" class="form-control" name="recherche"><input type="submit" value="search" class="btn-warning"></span>
                        
                    </form>
        </div>
        
        <div id="divToPrint">
    <table class="table table-responsive  table-bordered"cellpadding="0" width="100%">
    <tr>
        <th style="text-align: center" colspan="2">JOVENA MADAGASCAR</th>                
    </tr>
        <%
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con =DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
                Statement st =con.createStatement();
                String id_achat=request.getParameter("recherche");
                String sql="SELECT achats.id_achat,client.nom_cli,produits.nom_prod,achats.qte,achats.date,achats.ptot FROM achats,client,produits WHERE achats.id_cli=client.id_cli AND achats.id_prod=produits.id_prod AND id_achat='"+id_achat+"';";
                ResultSet rs = st.executeQuery(sql);
                while(rs.next()){
                    %>    
    
    <tr>
        <th>ID Achat</th>
        <td><%=rs.getInt("id_achat")%></td>
    </tr>
    <tr>
        <th> Client</th>
        <td><%=rs.getString("nom_cli")%></td>
    </tr>
    <tr>
        <th>Produit </th>
        <td><%=rs.getString("nom_prod")%></td>
    </tr>
    <tr>
        <th>Quantite</th>
        <td><%=rs.getString("qte")%></td>
    </tr>
    <tr>
        <th>Date</th>
        <td><%=rs.getString("date")%></td>
    </tr>
    <tr>
        <th>Montant</th>
        <td><%=rs.getString("ptot")%> Ar</td>
    </tr>

                    <%
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
    %>
    </table>
    </div>
    
        
    <div class="col-sm-2 offset-5">
        <button onclick="imprimerFacture()">Imprimer</button>
    </div>    
        
        
        
        
        
        
        <!-- Social links. @TODO: replace by link/instructions in template -->
	<section id="social">
		<div class="container">
			<div class="wrapper clearfix">
				<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_default_style">
				<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
				<a class="addthis_button_tweet"></a>
				<a class="addthis_button_linkedin_counter"></a>
				<a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
				</div>
				<!-- AddThis Button END -->
			</div>
		</div>
	</section>
	<!-- /social links -->


	<footer id="footer" class="top-space">

		<div class="footer1">
			<div class="container">
				<div class="row">
					
					<div class="col-md-3 widget">
						<h3 class="widget-title">Contact</h3>
						<div class="widget-body">
							<p>+261 34 84 410 62<br>
								<a href="mailto:#">mauriceemar@gmail.com</a><br>
								<br>
								Lot IE 89 Tsianolondroa
							</p>	
						</div>
					</div>

					<div class="col-md-3 widget">
						<h3 class="widget-title">Follow me</h3>
						<div class="widget-body">
							<p class="follow-me-icons">
								<a href=""><i class="fa fa-twitter fa-2"></i></a>
								<a href=""><i class="fa fa-dribbble fa-2"></i></a>
								<a href=""><i class="fa fa-github fa-2"></i></a>
								<a href=""><i class="fa fa-facebook fa-2"></i></a>
							</p>	
						</div>
					</div>

					<div class="col-md-6 widget">
						<h3 class="widget-title">NB:</h3>
						<div class="widget-body">
							<p>N"hesitez pas nous faire part de votre avis</p>
							
						</div>
					</div>

				</div> <!-- /row of widgets -->
			</div>
		</div>

		<div class="footer2">
			<div class="container">
				<div class="row">
					
					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="simplenav">
								<a href="#">Home</a> | 
								<a href="about.html">About</a> |
								<a href="sidebar-right.html">Sidebar</a> |
								<a href="contact.html">Contact</a> |
								<b><a href="signup.html">Sign up</a></b>
							</p>
						</div>
					</div>

					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="text-right">
								Copyright &copy; 2014, ZAFIMANJAKA Maurice Emar. Designed by <a href="h#" rel="designer">ZAFIMANJAKA Maurice Emar</a> 
							</p>
						</div>
					</div>

				</div> <!-- /row of widgets -->
			</div>
		</div>

	</footer>	
		




	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="assets/js/headroom.min.js"></script>
	<script src="assets/js/jQuery.headroom.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
<script>
        function imprimerFacture() {
            var divToPrint = document.getElementById("divToPrint"); // Le div à imprimer
            var contenu = divToPrint.innerHTML; // Le contenu HTML du div
            var nouvelleFenetre = window.open(); // Ouvre une nouvelle fenêtre

            // Insère le contenu HTML dans la nouvelle fenêtre
            nouvelleFenetre.document.write('<html><head><title>Votre facture</title>');
            nouvelleFenetre.document.write('<link href="asset/css/bootstrap.min.css" rel="stylesheet" type="text/css"/></head><body>');
            nouvelleFenetre.document.write(contenu);
            nouvelleFenetre.document.write('</body></html>');
  
            // Imprime le contenu de la nouvelle fenêtre
            nouvelleFenetre.print();
            nouvelleFenetre.close(); // Ferme la nouvelle fenêtre
}

    </script>
</html>
