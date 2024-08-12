<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

<title>Formulario de intensidad</title>

<script type="text/javascript" src="js/_externos/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/_externos/bootstrap.min.js"></script>

<script type="text/javascript">

function abrirCorreo(link) {
	link.href ="mailto:sismo-sentido@sgc.gov.co?subject=ref:<%=request.getAttribute("idForm") %>&body=ref:<%=request.getAttribute("idForm") %>";
}
</script>

<jsp:include page="monitor_html.html"/>
</head>

<body>
	<div class="container-fluid" style="text-align: center;">
		<div id= "pagina_final">
			<div class="row">
			    <div class="col-sm-12">
			    <h2>!Muchas gracias por tu colaboraci&oacute;n!</h2>			    
			    </div>	    	 	    	
			</div>
		
			<div class="row">
			    <div class="col-sm-12" style="background-image: url('img/pattern_peq.png');">	    	 	    	
			    	<img src="img/gracias.png" class="img-responsive" style="margin: 0 auto; width: 322px"  >	    	  
			    </div>
			</div>
						
			<div class="row">
				<div class="col-sm-12" style="color: rgb(104, 158, 55); padding-left:15%; padding-right:15%;">
			    	<h4>Si tienes im&aacute;genes y/o videos relacionados con los efectos del sismo por favor comp&aacute;rtelos: </h4>
	            	<a onclick="abrirCorreo(this);" target="_top">Cargar</a>	           	           	            	           	            
	        	</div>
	    	</div>
			
			<div class="row">
			    <div class="col-sm-12">
			    	<h4>
			    	Muchas gracias por haber completado el formulario para la evaluaci&oacute;n de intensidades del sismo.
			    	<br/><br/> Te invitamos a conocer los productos que se elaboran con la informaci&oacute;n que nos proporcionaste en el siguiente enlace:
			    	</h4>
			    	<br/>
			    	<form		
					action="EvaluacionIntensidadesServlet"	
					method="get">		
						<input type="hidden" id="metodo" name="metodo"  value="irASelector">	
			    		<button  class="btn btn-success" style="background-color: #008CBA; color:#FFFFFF;" 
			    		type="submit">
							Haz click aqu&iacute;
						</button>			    					    		
			    	</form>
			    </div>	    	 	    	
			</div>
			
			<br/>
			
			<div class="row">
			    <div class="col-sm-12">			    
				    <a href = "EvaluacionIntensidadesServlet?metodo=irAFormulario">Inicio</a> 
			    </div>
			</div>
		</div>
	</div>
</body>
</html>