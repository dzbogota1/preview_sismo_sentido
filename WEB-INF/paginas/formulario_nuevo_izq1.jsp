<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html style="height:100%;">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="css/formulario.css">
	
	<script type="text/javascript" src="js/_externos/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="js/_externos/jquery/jquery-ui-1.10.2.js"></script>
	<script type="text/javascript" src="js/_externos/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="js/conexiones.js?v=224"></script>
	<script type="text/javascript" src="js/formulario_nuevo_izq.js?v=224"></script>
	<script type="text/javascript" src="js/validacion.js?v=224"></script>
	<script type="text/javascript" src="js/general.js?v=224"></script>
	<script type="text/javascript" src="js/selector_tabla.js?v=224"></script>
	<script type="text/javascript" src="js/i18n_es.js?v=224"></script>
	<script type="text/javascript" src="js/controles.js?v=224"></script>
	
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-RG6HZS21QF"></script>
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
	
		gtag('config', 'G-RG6HZS21QF');

		window.setTimeout(function() {
			document.getElementById("formulario").style.display="flex";			
		}, 1000)
	</script>	    
	
	<jsp:include page="monitor_html.html" />
	
	<style>
		:root {
		  --ancho_margen: 9.41vw;
		  --ancho_label: 35vw;
		}
	
		body {
			background-color:#f0eeef;
			padding:0; 
			margin:0;
			font-family: 'Roboto';
			font-size: 16px;			
		}
		
		.labelfake {
			color: rgb(104, 158, 55);
		}
		
		label {
			color:#444;
			font-size:16px;			
		}			
		
		<%--
		.panelPreguntas {
			text-align: left;
			border:solid 2px #555;
			padding:5px;
			margin: 0 var(--ancho_margen) 10px var(--ancho_margen); 
			padding-left: min(0.941vw, 10px);
			
		}	
		--%>	
		
		fieldset label {
            width: auto;  
        }
        
        fieldset input {
            width: auto;                      
        }
		
		.elemColor1 {
			background-color: #ddd;
		}
		.elemColor2 {
			background-color: #ddd;
		}
		
		select {
			width: auto;
			font-family: 'Roboto';
		}
		
		option { font-family: 'Roboto', sans-serif; }
		
		.control_error { border: 2px solid red; }
		
		<%-- por defecto los dependientes de daño están ocultos--%>
		.dependientesDano { display:none;}
		
		fieldset {
			display:grid;
			gap: 10px 1px;
			grid-template-columns: 500px auto;
			background-color: #ddd;
			margin: 20px var(--ancho_margen) 10px var(--ancho_margen);
			padding: 10px;
			text-align:left;
		}
		
		fieldset > *:nth-child(odd) {
            background-color: lightblue; /* Color de fondo para la primera columna */
        }

        fieldset > *:nth-child(even) {
            background-color: lightgreen; /* Color de fondo para la segunda columna */
        }
		
		legend {			 
			background-color: rgb(104, 158, 55);  
			color: #fff; font-weight: bold; font-size: 18px; 
			padding: 5px 10px 5px 10px;
		}
		
				
	</style>
	
	<title>Formulario nuevo - Evaluaci&oacute;n de intensidades</title>
</head>

<body  onload="init('<%=request.getAttribute("REQ_SISMO_SELECCIONADO")%>'); /*validarForm({mostrarMensaje:false});*/" 
style="background-image:url('img/pattern_peq_bn.png'); background-attachment: fixed; position:relative;">
	<div id="overlay_carga"	style="position: absolute; top: 0; bottom: 0; left: 0%; right: 0; margin: auto; height: 512px; width: 512px; display: block;">
		<img src="img/carga.gif" style="margin-left: auto; margin-right: auto;">
	</div>	

	<div style="position:relative; background-color: orange; z-index:1; ">dd1</div>
	<div  style="position:relative; z-index:2;">
	<form id="formularioForm" action="EvaluacionIntensidadesServlet?metodo=procesarDatosWebInf" method="post">
		<input type="hidden" id="idForm" name="idForm" value="" /> 
		<input type="hidden" id="metodo" name="metodo" value="verSalidas">			
			
		<div style="background-image: url('img/pattern_peq.png'); color: #EEEEEE; font-size: 2em; margin: 40px var(--ancho_margen) 0 var(--ancho_margen);
		padding: 10px 10px 10px 10px; display:flex; justify-content: space-between; align-items: center;" >
			
			<div style="display:flex; align-items: center;">
				<img src="img/mundo.png" height=70  style="margin: 0 auto;">				
			</div>
			
			<p style="font-weight: bold; font-size: 28px;">Reporta el sismo 111</p>
			
			<img src="img/logo_sgc_transparente_blanco.png" height=70  >
		</div>												
				
		<div id="textoDescriptivo" style="font-weight: bold; text-align: center; color: #4e535b; background-color: #CCCCCC;
		margin: 0 var(--ancho_margen) 0 var(--ancho_margen);
		padding-left:80px; padding-right:80px;
		padding-bottom: 5px; padding-top: 5px; font-size: 14px;">
			Lo que reportas por medio de este sencillo formulario le sirve al Servicio Geológico Colombiano para recolectar información relacionada con el área en la que se sintió un sismo y los efectos que causó, con el fin de evaluar la intensidad sísmica. Igualmente les permite a los científicos tener un mejor entendimiento del riesgo sísmico en Colombia.
		</div>
							
		<fieldset>
			<legend style="width: auto;">Elige el sismo</legend>
			<label>Selecciona el sismo que sentiste</label>					
			<input type="hidden" id="esSismoManual"  value="" />
			  
			<select id="id_sismo" name="id_sismo" onchange="handleChangeIdSismo(); validarIdSismo([]);"></select>
			
			<p>Si el sismo no está en la lista, <a href="#" onclick="mostrarSismoManual(); validarIdSismo([]);">haz clic aquí.</a></p>
			
			<div id="panelSismoManual" style="display: none;">
			
				<label>¿En qué fecha percibiste el sismo?</label>
				<input type="text" id="sismo_alterno_fecha" name="sismo_alterno_fecha" title="Fecha"/>
				
				<label>&iquest;A qu&eacute; hora lo sentiste?</label>
				<select name="sismo_alterno_hora" id="sismo_alterno_hora" style="max-width: 50px;"></select> 
				<select	name="sismo_alterno_minuto" id="sismo_alterno_minuto" style="max-width: 50px;"></select> 
				<select name="sismo_alterno_tarde" style="max-width: 50px;" >
					<option value="AM">AM</option>
					<option value="PM">PM</option>
				</select>					
			</div>				
		</fieldset>
		
		<%--
		<div class="panelPreguntas elemColor2" style="margin-top:10px;"></div>
			--%>
			
		<fieldset>
			<legend style="width: 160px;">¿Dónde estabas?</legend>
			
			<%-- <span></span>
			<div style="display:flex; justify-content: center; margin-bottom:10px;">
			</div>
			--%>				
			<label></label>
			<button onclick="geolocalizar()" id="btnGeolocalizar" type="button" 
			style="width:300px; padding:5px 10px 5px 10px; margin-bottom: 10px; background-color:  #1a4480; color:#fff; display: inline-flex; align-items: center;">				
				Usar mi ubicación actual&nbsp;
				<svg  width="25" height="25" xmlns="http://www.w3.org/2000/svg">					
					<path fill="#ddd" d="M12 8c-2.21 0-4 1.79-4 4s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4zm8.94 3A8.994 8.994 0 0 0 13 3.06V1h-2v2.06A8.994 8.994 0 0 0 3.06 11H1v2h2.06A8.994 8.994 0 0 0 11 20.94V23h2v-2.06A8.994 8.994 0 0 0 20.94 13H23v-2h-2.06zM12 19c-3.87 0-7-3.13-7-7s3.13-7 7-7 7 3.13 7 7-3.13 7-7 7z"></path>					
				</svg>													
			</button>
			

			<label>Departamento</label>
			<select id="id_departamento" name="id_departamento"	onchange="cargarMunicipios(this.value, false); validarDepartamento([]);"></select>

			
			<label>Municipio</label>
			<select id="id_municipio" name="id_municipio" onchange="cargarCentrosPoblados(this.value); validarMunicipio([])"></select>
			
			
			<label>Centro poblado</label>
			<select id="id_centro_poblado" name="id_centro_poblado" onchange="validarCentroPoblado([])"></select>
			<label style="margin-bottom: 0px;">Direcci&oacute;n aproximada</label>														
			<input type="text" style="width: 33.36vw;" id="direccion" name="direccion" required="required" title="Direcci&oacute;n" maxlength="100" 
			placeholder="(Por ejemplo: Calle 5 con carrera 2)" onchange="validarDireccion([]);"/>						
		</fieldset>
		
		<fieldset>
			<legend style="width: 100px;">Prueba</legend>
			<label style="margin-bottom: 0px;">latitud</label>													
			<input type="text" id="latitud" name="latitud"  value="9.562"/>
										
			<label style="margin-bottom: 0px;">longitud</label>													
			<input type="text" id="longitud" name="longitud" value="-74.558"/>
		
			<button onclick="probarDeteccion()" type="button">Probar deteccion centro poblado</button>				
			<p id="demo"></p>								
		</fieldset>
		
		<fieldset>			
			<legend style="width: auto;">Efectos en personas</legend>
			<label>&iquest;En qu&eacute; lugar te encontrabas en el momento del sismo?</label>
			
			<span>
				<input type="radio" name="donde_estaba" id="adentro" value="1" onclick="toggleAdentroEdificacion();" checked="checked" /> Dentro de una edificaci&oacute;n
				
				<input type="radio" name="donde_estaba" id="afuera" value="0" 	onclick="toggleAdentroEdificacion();" /> En la calle					  
			</span>
			
			<%-- dependientesAdentroEdificio  --%>
				<label class="dependientesAdentroEdificio">&iquest;En qu&eacute; piso estabas?</label>

				<select class="dependientesAdentroEdificio" id="piso" name="piso" title="Piso en el que te encontrabas" onchange="validarPiso([])">
					<option value="-1">Selecciona</option>
					<option value="0">S&oacute;tano</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">Mayor a 5</option>
				</select>
				
				<label class="dependientesAdentroEdificio">&iquest;Saliste a la calle?</label>
				<span class="dependientesAdentroEdificio" id="divRtasSalioCalle">						
					<input type="radio" name="salio_calle" value="1" onchange="validarSalioCalle([])"/> S&iacute; &nbsp;
					<input type="radio" name="salio_calle" value="0" id="saliste_calle_no" onchange="validarSalioCalle([])"/> No
				</span>
				
				<label class="dependientesAdentroEdificio">&iquest;Percibiste vibraci&oacute;n o balanceo de?</label>
				<span class="dependientesAdentroEdificio">
					<input type="checkbox" id="balanceo_edificio" name="balanceo_edificio" value="1" />Edificio &nbsp; 
					<input type="checkbox" id="balanceo_habitacion" name="balanceo_habitacion" value="1" />Habitaci&oacute;n &nbsp;
					<input type="checkbox" id="balanceo_mueble" name="balanceo_mueble" value="1" />Mueble
				</span>
			
			<%-- dependientesAdentroEdificio  --%>
									
			<label>&iquest;Con qu&eacute; intensidad sentiste el sismo?</label>
			
			<select id="intensidad_sentida" name="intensidad_sentida" title="&#191;Con qu&#233; intensidad sentiste el sismo?"
			onchange="validarIntensidad([])">
				<option value="-1">Selecciona</option>
				<option value="1">Leve</option>
				<option value="2">Moderado</option>
				<option value="3">Fuerte</option>
				<option value="4">Muy fuerte</option>
			</select>
		
			<label>&iquest;Qu&eacute; actividad realizabas cuando sentiste el sismo?</label>

			<span>
				<input id="actividad_reposo" type="radio" name="actividad" value="0" checked="checked" />
				En reposo&nbsp; 
				
				<input id="actividad_movimiento" type="radio" name="actividad" value="0" />
				En movimiento &nbsp; 
				
				<input id="actividad_durmiendo" type="radio" name="actividad" value="1" />
				Durmiendo y me despert&eacute;
			</span>

			<label>&iquest;Cu&aacute;l fue tu reacci&oacute;n?</label>
			<span id="divRtasTuReaccion" >
				<input id="reaccion_ninguna" type="checkbox" onclick="validarReaccion([]);" />Ninguna&nbsp; 
				<input id="reaccion_1" type="checkbox" name="reaccion_asombro" value="1" onclick="validarReaccion([]);" />Asombro &nbsp; 
				<input id="reaccion_2" type="checkbox" name="reaccion_susto" value="2" onclick="validarReaccion([]);" />Susto&nbsp; 
				<input id="reaccion_3" type="checkbox" name="reaccion_panico" value="3" onclick="validarReaccion([]);" />P&aacute;nico
			</span>
						
			<label>&iquest;Perdiste el equilibrio?</label>
			<select id="perdida_estabilidad" name="perdida_estabilidad" title="&#191;Perdiste el equilibrio?" onchange="validarPerdidaEstabilidad([]);">
				<option value="-1">Selecciona</option>
				<option value="0">No</option>
				<option value="1">Sent&iacute; mareo</option>
				<option value="2">Perd&iacute; el equilibrio</option>
				<option value="3">Tuve dificultad para mantenerme de pie</option>
			</select>

			<label>&iquest;Las personas que estaban cerca de ti lo	sintieron?</label>
			<select id="personas_cerca" name="personas_cerca" onchange="validarPersonasCerca([])"
				title="&#191;Las personas que estaban cerca de ti lo sintieron?">
				<option value="-1">Selecciona</option>
				<option value="0.2">No s&eacute;</option>
				<option value="0">Nadie lo sinti&oacute;</option>
				<option value="0.5">Algunos lo sintieron y otros no</option>
				<option value="1">La mayor&iacute;a lo sinti&oacute;</option>
				<option value="1">Todos lo sentimos</option>
				<option value="0">Estaba solo/a</option>
			</select>
		</fieldset>
		
		<fieldset>
			<legend style="width: 250px;">Objetos y construcciones</legend>
			<label>Selecciona los efectos que observaste<br/> en los objetos a tu alrededor:</label>
			
			<div style="padding-left: 0px;"> 
				<input id="" type="checkbox" value="1" name="balanceo_colgantes" />Balanceo de objetos colgantes<br /> 
				<input id="" type="checkbox" value="1" name="ruido_puertas" />Ruido de puertas, ventanas, vidrios o porcelanas<br /> 
				<input id="" type="checkbox" value="1" name="golpeteo_porcelana" />Golpeteo de porcelana, frascos o vasos<br /> 
				<input id="" type="checkbox" value="1" name="vaiven_puertas" />Vaiv&eacute;n de puertas o ventanas<br />
				<input id="" type="checkbox" value="1" name="oscilacion_liquidos" />Oscilaci&oacute;n o vertimiento de l&iacute;quidos<br /> 
				<input id="" type="checkbox" value="1" name="reaccion_animales" />Reacci&oacute;n de susto en los animales<br /> 
				<input id="" type="checkbox" value="1" name="caida_pequenos" />Ca&iacute;da o desplazamiento de objetos peque&ntilde;os<br /> 
				<input id="" type="checkbox" value="1" name="volcamiento_pesados" />Desplazamiento o volcamiento de objetos pesados o muebles<br /> 
				<input id="" type="checkbox" value="1" name="caida_pesados" />Ca&iacute;da de objetos pesados como televisores, computadores, etc.
			</div>

			
			<label >&iquest;Hubo alg&uacute;n da&ntilde;o en la construcci&oacute;n donde te encontrabas?</label>
			<span>
				<input id="dano_constr_si" type="radio" value="1"	name="dano_construccion" onclick="toggleDanoConstruccion();" />
				S&iacute;			
				<input type="radio" id="dano_constr_no" value="0" name="dano_construccion" onclick="toggleDanoConstruccion();" checked="checked" /> 
				No
			</span>
			
			<%--dependientesDano --%>
				<label class="dependientesDano">Material de la construcci&oacute;n averiada</label>

				<select class="dependientesDano" name="material_construccion">
					<option value="1">No s&eacute;</option>
					<option value="2">Adobe bahareque, tapia o roca</option>
					<option value="3">Ladrillo</option>
					<option value="4">Concreto reforzado</option>
					<option value="5">Madera</option>
					<option value="6">Acero</option>
				</select>

				<label class="dependientesDano">Tipo de da&ntilde;o</label>
				<div class="dependientesDano">
					<input type="checkbox" value="1" id="tipo_danos_grietas_revest"	name="tipo_danos_grietas_revest" />Grietas delgadas en el
					pa&ntilde;ete o revestimiento<br /> 
					<input type="checkbox" value="2" id="tipo_danos_caida_revest" name="tipo_danos_caida_revest" />Ca&iacute;da de trozos de
					pa&ntilde;ete<br /> 
					<input type="checkbox" value="2" id="tipo_danos_caida_tejas" name="tipo_danos_caida_tejas" />Ca&iacute;da
					de tejas o chimeneas <br /> 
					<input type="checkbox" value="3" id="tipo_danos_grietas_muros" name="tipo_danos_grietas_muros" />Grietas
					en muros
				</div>
			<%--dependientesDano --%>
		</fieldset>
		
		<fieldset>
			<legend style="width: 200px;">Otros efectos</legend>
			<label style="width:100%;">&iquest;Hubo alg&uacute;n efecto sobre la naturaleza
				cerca de donde estabas? <br/>Por ejemplo deslizamientos de tierra,
				grietas en el suelo, cambios en el curso de r&iacute;os, etc. <br>Si
				la respuesta es afirmativa, por favor especifica.</label>
			
			<input type="text" style="width: 100%;" name="efectos_naturaleza" maxlength="500" />

			<label style="width:100%;">&iquest;Alg&uacute;n comentario adicional sobre el sismo
				que resulte &uacute;til (Duraci&oacute;n, ruido, direcci&oacute;n
				del movimiento, etc.)?
			</label>
			<input type="text" style="width: 100%;" name="comentarios" maxlength="500" />

			<label>Informaci&oacute;n de contacto (opcional)</label>

			<div >
				<table style="width: 100%;">
					<tr style="width: 100%;">
						<td style="padding-right: 5px;">Nombre</td>
						<td style="width: 100%;">
							<input type="text" name="contacto_nombre" style="width: 100%;" maxlength="100" />
						</td>
					</tr>
					<tr style="width: 100%;">
						<td>E-mail</td>
						<td style="width: 100%;">
							<input type="text" name="contacto_correo" style="width: 100%;" maxlength="100" />
						</td>
					</tr>
				</table>
			</div>
		</fieldset>

		<div id="divContenedorCaptcha" style="flex-direction:row; justify-content: center; padding-bottom:10px;">
			<div class="g-recaptcha"
			data-sitekey="6LccZqwpAAAAADvZGVjcSlwsIJs6yhB2aUowwpIk"
			data-callback="captchaDiligenciado"
			data-expired-callback="captchaExpirado"></div>
		</div>
		
		<button id="boton_enviar" type="button"	onclick="enviarForm({mostrarMensaje:true});" style="background-color: rgb(104, 158, 55); color: #FFFFFF; display: block;">
			Enviar
		</button>		

		<div id="pagina_final" style="display: none;">
			<div class="row">
				<div class="col-sm-12">
					<h2>Muchas gracias por tu colaboraci&oacute;n</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-12"
					style="background-image: url('img/pattern_peq.png');">
					<img src="img/gracias.png" class="img-responsive"
						style="margin: 0 auto;">
				</div>
			</div>
		</div>		
	</form>
	</div>


	<div id="div_link_resultados" style="display: none; ">
		<div style="color: #545454; background-color: #DDDDDD; font-weight: bold; margin-bottom: 10px;">
			&iexcl;Conoce los sismos sentidos y los resultados generados a
			partir del formulario de intensidades!
			<!-- 
		Te invitamos a conocer los productos de más de 1000 sismos que se han elaborado con la información que tú y otros usuarios nos han proporcionado a partir del formulario de intensidades, dándo click siguiente enlace:
		 -->
		</div>			

		<form action="EvaluacionIntensidadesServlet">
			<input type="hidden" name="metodo" value="irASelector">
			<button type="submit" class="btn btn-success"
			style="background-color: rgb(104, 158, 55); color: #FFFFFF;">
				Ver	sismos sentidos
			</button>
		</form>
	</div>

	&nbsp;
	<div style="font-size: 11px;background-color: #545454; color: #DDDDDD;">
		<div>
			<b>Direcci&oacute;n: </b> Diagonal 53 No 34 - 53 Bogot&aacute; D.C.
			Colombia, <b>Tel&eacute;fono:</b> (571)220 0200 - (571)220 0100 -
			(571)222 1811, F&aacute;x: (571) 222 07 97
		</div>
		<div>
			Todos los derechos reservados 2016-2017 Apartado A&eacute;reo 4865<br />
			<a href="https://www2.sgc.gov.co/Nosotros/AcercaDelSgc/Paginas/Politicas-de-Calidad.aspx" class="link_oficial">
				Pol&iacute;ticas y cumplimiento legal</a> | 
			<a href="https://www2.sgc.gov.co/Nosotros/NuestrasSedes/Paginas/nuestras-sedes.aspx" class="link_oficial">
				Nuestras sedes</a> | <a
				href="mailto:cliente@sgc.gov.co" class="link_oficial">Cont&aacute;ctenos</a> |
			<a href="mailto:notificacionesjudiciales@sgc.gov.co" class="link_oficial">
				Notificaciones Judiciales</a> | 
			<a href="https://www2.sgc.gov.co/AtencionAlCiudadano/Paginas/PQRDS.aspx" class="link_oficial">
			    PQRD
			</a>
		</div>
	</div>	
</body>
</html>