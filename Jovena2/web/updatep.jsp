<%-- 
    Document   : update
    Created on : 26 févr. 2023, 14:33:43
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    if (request.getParameter("submit")!=null)
    {
        String id_prod=request.getParameter("id_prod");
        String lib_prod=request.getParameter("lib_prod");
        String nom_prod=request.getParameter("nom_prod");
        String prix=request.getParameter("prix");
        String stocks=request.getParameter("stocks");

        Connection con;
        PreparedStatement  pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
         pst=con.prepareStatement("update produits set lib_prod=?,nom_prod=?,prix=?,stocks=? where id_prod=?");
         pst.setString(1,lib_prod);
         pst.setString(2,nom_prod);
         pst.setString(3,prix);
         pst.setString(4,stocks);
         pst.setString(5,id_prod);

         pst.executeUpdate();
          %>
           <script>
              alert("update");
            </script>
          
  <%         
        
    }

%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">
	
	<title>Update</title>

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

<body class="home">
	<!-- Fixed navbar -->
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
				<h1 class="lead">MODIFIER L'INFO PRODUIT</h1>
				<p class="tagline">Faite attention vous devez enregistrer tout les produits</p>
				<p><a class="btn btn-default btn-lg" role="button">Vous pouvez y aller!</a>
			</div>
		</div>
	</header>
	<!-- /Header -->

	<!-- Intro -->
	<div class="container text-center">
		<br> <br>
		<h2 class="thin">STATION JOVENA</h2>
		<p class="text-muted">
			Tout nos produits doivent être traités et enregistrer
		</p>
	</div>
	<!-- /Intro-->
        
        <!-- Highlights - jumbotron -->
	<div class="jumbotron top-space">
		<div class="container">
			
			<h3 class="text-center thin">Veuillez modifier notre prochain produit ci dessous</h3>
			
			<div class="row">
				<div class=" highlight">
                                    <div class="h-caption"><h4><i class="fa fa-cogs fa-5"></i>Formulaire Produits</h4></div>
					<form  method="post" action="" >  
                    <% 
        Connection con;
        PreparedStatement  pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
        String id_prod=request.getParameter("id_prod");
        pst=con.prepareStatement("select*from produits where id_prod=?");
        pst.setString(1,id_prod);
        
        rs=pst.executeQuery();
        while(rs.next()){
            
        
         

                    %>
                    
                    <div alight="left" > 
                        <label class="form-label"> LIBELLE:</label>
                        <input type="text"class="form-control"name="lib_prod" placeholder="Libelle" value="<%=rs.getString("lib_prod")%>" id="lib_prod" required>
                    </div>
                        
                        <div alight="left" > 
                        <label class="form-label"> NOM DU PRODUIT:</label>
                        <input type="text"class="form-control"name="nom_prod"placeholder="Nom du produit" value="<%=rs.getString("nom_prod")%>" id="nom_prod" required>
                   </div>
                        
                        <div alight="left" > 
                        <label class="form-label"> PRIX: </label>
                        <input type="text"class="form-control"name="prix"placeholder="Prix"  value="<%=rs.getString("prix")%>" id="prix" required>
                        </div>
                        
                        <div alight="left" > 
                        <label class="form-label"> STOCKS: </label>
                        <input type="number"class="form-control"name="stocks"placeholder="Stocks"  value="<%=rs.getString("stocks")%>" id="stocks" required>
                        </div>
                        
                        
                        <%
                            }
                        %>
                            </br>
                        <div alight="right" > 
                            <input type="submit" id="submit" value="submit" name="submit" class="btnn btn-info">
                            <input type="reset" id="reset" value="reset" name="reset" class="btnn btn-info">
                            </div>
                            <div align="right">
                                <P><a href="produit.jsp" >click Back</a></p>
                            </div>
                               
                                
                                
                           </form>   
				</div>
				
				
				
			</div> <!-- /row  -->
		
		</div>
	</div>
	<!-- /Highlights -->

        
        
        
        
        
        
        
        
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
							<p>N"hesitez pas nous faire par de votre avis</p>
							
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
</html>


