<%-- 
    Document   : index
    Created on : 26 févr. 2023, 14:32:59
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    if (request.getParameter("submit")!=null)
    {
        String id_cli=request.getParameter("id_cli");
        String id_prod=request.getParameter("id_prod");
        String qte=request.getParameter("qte");
        String date=request.getParameter("date");
        String ptot=request.getParameter("ptot");
        Connection con;
        PreparedStatement  pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
         pst=con.prepareStatement("insert into achats(id_cli,id_prod,qte,date,ptot) values(?,?,?,?,?)");
         pst.setString(1,id_cli);
         pst.setString(2,id_prod);
         pst.setString(3,qte);
         pst.setString(4,date);
         pst.setString(5,ptot);
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
	
	<title>achat</title>

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
				<h1 class="lead">UN NOUVEAU ACHAT? VEUILLEZ L'ENREGISTRER</h1>
				<p class="tagline">Faite attention vous devez enregistrer tout les achats pour eviter des rembourssement inutiles</p>
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
			Tout nos achats doivent être traités et enregistrer
		</p>
	</div>
	<!-- /Intro-->
		 <form action="rechercha.jsp" method="post" class="form-inline">
                        <span><input type="search" placeholder="achat n*" class="form-control" name="recherche"><input type="submit"value="search" class="btn-warning"></span>
                        
                    </form>
	<!-- Highlights - jumbotron -->
	<div class="jumbotron top-space">
		<div class="container">
			
			<h3 class="text-center thin">Veuillez enregistrer notre prochain achats ci dessous</h3>
			
			<div class="row">
				<div class=" col-sm-4 highlight">
                                    <div class="h-caption"><h4><i class="fa fa-cogs fa-5"></i>Formulaire Achats</h4></div>
					<form method="post" action="" >  
                       
                        <div alight="left" > 
                        <label class="form-label"> ID du Client: </label>
                        <select name="id_cli" id="id_cli">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
                                String query="select id_cli, nom_cli from client";
                                Statement st=con.createStatement();
                                ResultSet rs=st.executeQuery(query);
                                while (rs.next()){
                                    %>
                                    <option value="<%=rs.getInt("id_cli")%>"><%=rs.getInt("id_cli")%> - <%=rs.getString("nom_cli")%></option>
                                    <%
                                }
                            %>
                        </select>
                   </div>
                        
                        <div alight="left" > 
                        <label class="form-label"> ID du produit: </label>
                        <select name="id_prod" id="id_prod">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
                                String query1="select id_prod, nom_prod from produits";
                                Statement st1=con1.createStatement();
                                ResultSet rs1=st1.executeQuery(query1);
                                while (rs1.next()){
                                    %>
                                    <option value="<%=rs1.getInt("id_prod")%>"><%=rs1.getInt("id_prod")%> - <%=rs1.getString("nom_prod")%></option>
                                    <%
                                }
                            %>
                        </select>
                        </div>
                    
                        <div alight="left" > 
                        <label class="form-label"> Prix: </label>
                        <select name="prix" id="prix" onchange="calculer()">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con2=DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
                                String query2="select prix from produits";
                                Statement st2=con2.createStatement();
                                ResultSet rs2=st2.executeQuery(query2);
                                while (rs2.next()){
                                    %>
                                    <option value="<%=rs2.getInt("prix")%>"><%=rs2.getInt("prix")%></option>
                                    <%
                                }
                            %>
                        </select>
                        </div>
                    
                        <div alight="left" > 
                        <label class="form-label"> Quantite Achetée: </label>
                        <input type="number"class="form-control"name="qte"id="qte" required onchange="calculer()">
                        </div>
                    
                        <div alight="left" > 
                        <label class="form-label"> Date: </label>
                        <input type="date"class="form-control"name="date"id="date" required>
                        </div>
                    
                        <div alight="left" > 
                        <label class="form-label"> Prix total: </label>
                        <input type="number"class="form-control"name="ptot"id="ptot" readonly>
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
                            <td> ID du Achat</td>
                            <td> ID du Client</td>
                            <td> ID du produit </td>
                            <td> Quantite achete </td>
                            <td> Date d'achat</td>
                            <td> Montant</td>
                            
                            <td></td>
                            
                            </th>
                        </tr> 
                        
     <tr
         <% 
        Connection coon;
        PreparedStatement  pst;
        ResultSet rss;
        
        Class.forName("com.mysql.jdbc.Driver");
         coon = DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
         String queryy="select * from achats";
         Statement sta=coon.createStatement();
         rss=sta.executeQuery(queryy);
         while(rss.next())
         {
             String id=rss.getString("id_cli");
             
         
       
         %>
           <tr>  
         <td><%=rss.getString("id_achat") %></td>
         <td><%=rss.getString("id_cli") %></td>               
         <td><%=rss.getString("id_prod") %></td>
         <td><%=rss.getString("qte") %></td>
         <td><%=rss.getString("date") %></td>
         <td><%=rss.getString("ptot") %></td>
         
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
<script>
    function calculer() {
        // Récupérer les valeurs saisies par l'utilisateur
        var prix = document.getElementById("prix").value;
        var qte = document.getElementById("qte").value;
        // Effectuer le calcul
        var ptot = prix * qte;
        // Mettre à jour le champ de sortie avec le résultat
    document.getElementById("ptot").value = ptot;
}
</script>
</html>
