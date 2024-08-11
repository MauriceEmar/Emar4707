<%-- 
    Document   : produit
    Created on : 26 févr. 2023, 14:32:59
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    if (request.getParameter("submit")!=null)
    {
        String libelle=request.getParameter("lib_prod");
        String nom=request.getParameter("nom_prod");
        String prix=request.getParameter("prix");
        String stocks=request.getParameter("stocks");
        
        Connection con;
        PreparedStatement  pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
         pst=con.prepareStatement("insert into produits(lib_prod,nom_prod,prix,stocks) values(?,?,?,?)");
         pst.setString(1,libelle);
          pst.setString(2,nom);
          pst.setString(3,prix);
          pst.setString(4,stocks);
          
          pst.executeUpdate();
          %>
          
          <script>
              alert("record add");
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
	
	<title>produit</title>

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
				<h1 class="lead">AJOTER UN NOUVEAU PRODUIT</h1>
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
        <form action="recherchep.jsp" method="post" class="form-inline">
                        <span><input type="text" placeholder="produit n*" class="form-control" name="recherchep"><input type="submit" value="seach" class="btn-warning"></span>
                        
                    </form>
		
	<!-- Highlights - jumbotron -->
	<div class="jumbotron top-space">
		<div class="container">
			
			<h3 class="text-center thin">Veuillez ajouter notre prochain produits ci dessous</h3>
			
			<div class="row">
				<div class=" col-sm-4 highlight">
                                    <div class="h-caption"><h4><i class="fa fa-cogs fa-5"></i>Formulaire Produits</h4></div>
					<form method="post" action="" >  
                       
                        <div alight="left" > 
                        <label class="form-label"> Libelle: </label>
                        <input type="text"class="form-control"name="lib_prod"placeholder="Libelle"  id="lib_prod" required>
                   </div>
                        
                        <div alight="left" > 
                        <label class="form-label"> Nom : </label>
                        <input type="text"class="form-control"name="nom_prod"placeholder="Nom du produit" id="nom_prod" required>
                        </div>
                    
                        <div alight="left" > 
                        <label class="form-label"> Prix: </label>
                        <input type="text"class="form-control"name="prix"placeholder="Prix" id="prix" required>
                        </div>
                                            
                        <div alight="left" > 
                        <label class="form-label"> Stocks en reserve : </label>
                        <input type="number"class="form-control"name="stocks"placeholder="stocks" id="stocks" required>
                        </div>
                    
                             </br>
                        <div alight="right" > 
                            <input type="submit" id="submit" value="submit" name="submit" class="btnn btn-primary">
                            <input type="reset" id="reset" value="reset" name="reset" class="btnn btn-warning">
                            </div>
                                
                                
                           </form>   
				</div>
				<div class=" col-sm-8 highlight">
					<div class="h-caption"><h4><i class="fa fa-flash fa-5"></i>Liste des produits</h4></div>
					<div class="panel-body">
                <table id="tbl-student" class="table table-responsive  table-bordered"cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <td> ID </td>
                            <td> LIBELLE </td>
                            <td> NOM </td>
                            <td> PRIX</td>
                            <td> STOCKS</td>
                            
                            <th align="center"> action
                            <td></td>
                            
                            </th>
                        </tr> 
                        
     <tr
         <% 
        Connection con;
        PreparedStatement  pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
         String query="select * from produits";
         Statement st=con.createStatement();
         rs=st.executeQuery(query);
         while(rs.next())
         {
             String id=rs.getString("id_prod");
             
         
       
         %>
           <tr>  
         <td><%=rs.getString("id_prod") %></td>               
         <td><%=rs.getString("lib_prod") %></td>
         <td><%=rs.getString("nom_prod") %></td>
         <td><%=rs.getString("prix") %></td>
         <td><%=rs.getString("stocks") %></td>
         
         <td><a href="updatep.jsp?id_prod=<%=id%>">Edit</a></td>
         <td><a href="deletep.jsp?id_prod=<%=id%>">Delete</a></td>
                 </tr>
                        
                    <%
                        
            }
                    %>     
                    
                </table>
                
                
            </div>
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
