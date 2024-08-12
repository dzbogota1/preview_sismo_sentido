<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
		
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="css/formulario.css">
	
	<script type="text/javascript" src="js/_externos/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="js/_externos/jquery/jquery-ui-1.10.2.js"></script>	
	
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
		body {			
			background-color:#f0eeef;
			padding:0; 
			margin:0;
			font-family: 'Roboto';
			font-size: 16px;			
		}
				
		label {			
			font-size:16px;			
		}			
		
		.labelRadioButton {
			margin-right:20px; font-weight:normal;
		}
		
		.panelPreguntas {
			display:grid;
			gap: 10px 1px;
			grid-template-columns: 40vw auto;
			background-color: #ddd;
			margin: 20px 6.41vw 10px 6.41vw;
			padding: 20px min(1vw, 20px) 20px min(1vw, 20px);
			text-align:left;
			opacity:1;
			z-index:2;
		}			
				
		.panelPreguntass label {
           width: 100%;  
        }
               
        legend {
            width: auto;  
           	background-color: rgb(104, 158, 55);  
			color: #fff; font-weight: bold; font-size: 18px; 
			padding: 5px 10px 5px 10px;           
        }
                
        .panelPreguntas input {
        	box-sizing:border-box;
        	width:100%;            
            padding:0;
            margin:0;           
        }

		.panelPreguntas select {
			width: 100%; 
			font-family: 'Roboto';
			padding:0;
            margin:0;
			
		}
		
		.panelPreguntas input[type="checkbox"] {
			margin-right:6px;
			width:auto;
		}
		
		.panelPreguntas input[type="radio"] {
			margin-right:6px;
			width:auto;
		}
		
		.panelPreguntas textarea {
			width: 100%; resize: none; margin-top:10px;
		}
		
		.panelOtrosEfectos {
			display: flex;
			flex-direction: column;
			background-color: #ddd;
			margin: 20px 6.41vw 10px 6.41vw;
			padding: 20px;
			text-align:left;
			opacity:1;
			z-index:2;		
		}
		
		.contenedorMultiRespuesta {
			display:flex; flex-direction: row; flex-wrap: wrap; align-items:center;	gap:10px;			
		}
		
		.rtaMultiRespuesta {
			display:flex;
		}
				
		.elemColor1 {
			background-color: #ddd;
		}
		.elemColor2 {
			background-color: #ddd;
		}				
		
		option { font-family: 'Roboto', sans-serif; }
		
		.control_error { border: 2px solid red; }
		
		
		
		<%-- por defecto los dependientes de daño están ocultos--%>
		.dependientesDano { display:none;}
		
		
		<%--
		fieldset > *:nth-child(odd) {
            background-color: lightblue; /* Color de fondo para la primera columna */
        }

        fieldset > *:nth-child(even) {
            background-color: lightgreen; /* Color de fondo para la segunda columna */
        }
        --%>		
	</style>
	
	<script type="text/javascript">
	function mostrarAncho() {
		const ww = window.innerWidth;
		alert (ww + " "+( ww*0.015) )
	}
	</script>
	
	<title>Formulario nuevo - Evaluaci&oacute;n de intensidades</title>
</head>

<body  onload=" init('<%=request.getAttribute("REQ_SISMO_SELECCIONADO")%>');  /*mostrarAncho(); validarForm({mostrarMensaje:false});*/" 
style="background-image:url('img/pattern_peq_bn.png'); background-attachment: fixed; position:relative; z-index:0; <%--width: 100vw;--%> ">
	
	<%--
	<div id="overlay_carga"	style="position: absolute; top: 0; bottom: 0; left: 0; right: 0; margin: auto; height: 512px; width: 512px;
	display: block;">
		<img src="img/carga.gif" style="margin-left: auto; margin-right: auto;">
	</div>	
	 --%>
	 
	<%-- antes de publicar cambiar el metodo a procesarDatosPrueba procesarDatosWebInf --%>
	<form id="formularioForm" action="EvaluacionIntensidadesServlet?metodo=procesarDatosPrueba" method="post"
	style="background-color: rgba(255, 255, 255, 0.5); margin:0 min(50px, 0.037vw) 0 min(50px, 0.037vw); position:relative; z-index:1;" >
		<input type="hidden" id="idForm" name="idForm" value="" /> 
		<input type="hidden" id="metodo" name="metodo" value="verSalidas">		
			
		<div style="background-image: url('img/pattern_peq.png'); color: #EEEEEE; font-size: 2em; 
		padding: 10px 10px 10px 10px; display:flex; justify-content: space-between; align-items: center;" >			
			<div style="display:flex; align-items: center;">
				<img src="img/mundo.png" height=70  style="margin: 0 auto;">				
			</div>
			
			<p style="font-weight: bold; font-size: 28px;">Reporta el sismo</p>
			
			<img src="img/logo_sgc_transparente_blanco.png" height=70  >
		</div>			
			
		<div id="textoDescriptivo" style="font-weight: bold; text-align: center; color: #4e535b; background-color: #CCCCCC;
		margin: 0 var(--ancho_margen) 0 var(--ancho_margen);
		padding-left:80px; padding-right:80px;
		padding-bottom: 5px; padding-top: 5px; font-size: 14px;">
			Lo que reportas por medio de este sencillo formulario le sirve al Servicio Geológico Colombiano para recolectar información relacionada con el área en la que se sintió un sismo y los efectos que causó, con el fin de evaluar la intensidad sísmica. 
			<br>Igualmente les permite a los científicos tener un mejor entendimiento del riesgo sísmico en Colombia.
		</div>		
							
		<fieldset class="panelPreguntas">
			<legend>Elige el sismo</legend>
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
         
		<fieldset class="panelPreguntas">
			<legend>¿Dónde estabas?</legend>
								
			<button onclick="geolocalizar()" id="btnGeolocalizar" type="button" 
			style="width: min(100%, 195px); padding:5px 10px 5px 10px; margin-bottom: 10px; background-color:  #1a4480; color:#fff; display: inline-flex; align-items: center;">				
				Usar mi ubicación actual&nbsp;
				<svg  width="25" height="25" xmlns="http://www.w3.org/2000/svg">					
					<path fill="#ddd" d="M12 8c-2.21 0-4 1.79-4 4s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4zm8.94 3A8.994 8.994 0 0 0 13 3.06V1h-2v2.06A8.994 8.994 0 0 0 3.06 11H1v2h2.06A8.994 8.994 0 0 0 11 20.94V23h2v-2.06A8.994 8.994 0 0 0 20.94 13H23v-2h-2.06zM12 19c-3.87 0-7-3.13-7-7s3.13-7 7-7 7 3.13 7 7-3.13 7-7 7z"></path>					
				</svg>													
			</button>
			<label></label>
	
			<label>Departamento</label>
			<select id="id_departamento" name="id_departamento"	onchange="cargarMunicipios(this.value, false); validarDepartamento([]);"></select>
		
			<label>Municipio</label>
			<select id="id_municipio" name="id_municipio" onchange="cargarCentrosPoblados(this.value); validarMunicipio([])"></select>
			
			<label>Centro poblado</label>
			<select id="id_centro_poblado" name="id_centro_poblado" onchange="validarCentroPoblado([])"></select>
					
			<label >Direcci&oacute;n aproximada</label>			
			<input type="text"  id="direccion" name="direccion" required="required" title="Direcci&oacute;n" maxlength="100" 
			placeholder="Por ejemplo: Calle 5 con carrera 2" onchange="validarDireccion([]);"/>
		</fieldset>
		
		<fieldset class="panelPreguntas">
			<legend>Prueba</legend>
			<label>latitud</label>													
			<input type="text" id="latitud" name="latitud"  value="9.562"/>
										
			<label>longitud</label>													
			<input type="text" id="longitud" name="longitud" value="-74.558"/>
		
			<button onclick="probarDeteccion()" type="button">Probar deteccion centro poblado</button>				
			<label id="demo"></label>								
		</fieldset>
		
		<fieldset class="panelPreguntas">
			<legend>Efectos en personas</legend>

			<label>&iquest;En qu&eacute; lugar te encontrabas en el momento del sismo?</label>
			<div class="contenedorMultiRespuesta">
				<div class="rtaMultiRespuesta">
					<input type="radio" name="donde_estaba" id="adentro" value="1" onclick="toggleAdentroEdificacion();" checked="checked"/> 
					<label style="word-wrap: break-word;">Dentro de una edificaci&oacute;n</label> 								
				</div>
				<div class="rtaMultiRespuesta">
					<input type="radio" name="donde_estaba" id="afuera" value="0" 	onclick="toggleAdentroEdificacion();" />							
					En la calle
				</div>
			</div>
 			
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
					<input type="radio" name="salio_calle" value="1" onchange="validarSalioCalle([])"/> <label class="labelRadioButton">S&iacute;</label>
					<input type="radio" name="salio_calle" value="0" id="saliste_calle_no" onchange="validarSalioCalle([])"/> No
				</span>
					
				<label class="dependientesAdentroEdificio">&iquest;Percibiste vibraci&oacute;n o balanceo de?</label>				
				<div class="contenedorMultiRespuesta dependientesAdentroEdificio">
					<div class="rtaMultiRespuesta"><input type="checkbox" id="balanceo_edificio" name="balanceo_edificio" value="1"   />Edificio</div>  
					<div class="rtaMultiRespuesta"><input type="checkbox" id="balanceo_habitacion" name="balanceo_habitacion" value="1"  />Habitaci&oacute;n</div> 
					<div class="rtaMultiRespuesta"><input type="checkbox" id="balanceo_mueble" name="balanceo_mueble" value="1" />Mueble</div>
				</div>				

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
			 
			 	<%--
			<span>
				<input type="radio" />
				<label class="labelRadioButton">Leve</label> 
				<input type="radio" />
				<label class="labelRadioButton">Moderado</label> 
				<input type="radio" />
				<label class="labelRadioButton">Fuerte</label> 
				<input type="radio" />
				<label class="labelRadioButton">Muy fuerte</label> 				
			</span>
			--%>
		
			<label>&iquest;Qu&eacute; actividad realizabas cuando sentiste el sismo?</label>

			<div class="contenedorMultiRespuesta">
				<div class="rtaMultiRespuesta">
					<input id="actividad_reposo" type="radio" name="actividad" value="0" checked="checked" />
					<label class="labelRadioButton">En reposo</label> 
				</div>
				
				<div class="rtaMultiRespuesta">
					<input id="actividad_movimiento" type="radio" name="actividad" value="0" />
					<label class="labelRadioButton">En movimiento</label> 
				</div>
				<div class="rtaMultiRespuesta">
					<input id="actividad_durmiendo" type="radio" name="actividad" value="1" />
					Durmiendo y me despert&eacute;
				</div>
			</div>

			<label>&iquest;Cu&aacute;l fue tu reacci&oacute;n?</label>
			<div id="divRtasTuReaccion" class="contenedorMultiRespuesta">
				<div class="rtaMultiRespuesta">
					<input id="reaccion_ninguna" type="checkbox" onclick="validarReaccion([]);" />Ninguna&nbsp;
				</div> 
				<div class="rtaMultiRespuesta">
					<input id="reaccion_1" type="checkbox" name="reaccion_asombro" value="1" onclick="validarReaccion([]);" />Asombro &nbsp;
				</div>
				<div class="rtaMultiRespuesta"> 
					<input id="reaccion_2" type="checkbox" name="reaccion_susto" value="2" onclick="validarReaccion([]);" />Susto&nbsp;
				</div> 
				<div class="rtaMultiRespuesta">
					<input id="reaccion_3" type="checkbox" name="reaccion_panico" value="3" onclick="validarReaccion([]);" />P&aacute;nico
				</div>
			</div>
						
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
		
		<fieldset class="panelPreguntas">
			<legend>Objetos y construcciones</legend>
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
				<label class="labelRadioButton">S&iacute;</label>			
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
				<div class="dependientesDano contenedorMultiRespuesta">
					<div class="rtaMultiRespuesta">
						<input type="checkbox" value="1" id="tipo_danos_grietas_revest"	name="tipo_danos_grietas_revest" />Grietas delgadas en el
						pa&ntilde;ete o revestimiento
					</div>
					<div class="rtaMultiRespuesta"> 
						<input type="checkbox" value="2" id="tipo_danos_caida_revest" name="tipo_danos_caida_revest" />Ca&iacute;da de trozos de
						pa&ntilde;ete
					</div>
					<div class="rtaMultiRespuesta"> 
						<input type="checkbox" value="2" id="tipo_danos_caida_tejas" name="tipo_danos_caida_tejas" />Ca&iacute;da
						de tejas o chimeneas 
					</div> 
					<div class="rtaMultiRespuesta">
						<input type="checkbox" value="3" id="tipo_danos_grietas_muros" name="tipo_danos_grietas_muros" />Grietas
						en muros
					</div>
				</div>
			<%--dependientesDano --%>
		</fieldset>
		
		<fieldset class ="panelOtrosEfectos">
	
			<legend>Otros efectos</legend>
			
			<label>&iquest;Hubo alg&uacute;n efecto sobre la naturaleza cerca de donde estabas?</label>
			
			<textarea rows="4"  name="efectos_naturaleza" maxlength="500" style="margin-bottom: 10px; resize: none;"
			placeholder="Por ejemplo: deslizamientos de tierra, grietas en el suelo, cambios en el curso de r&iacute;os, etc. "></textarea>								
			
			<label>&iquest;Alg&uacute;n comentario adicional sobre el sismo	que resulte &uacute;til?</label>
			
			<textarea rows="4"  name="comentarios" maxlength="500"  
			style="margin-bottom: 10px; resize:none;" placeholder="Por ejemplo: duración, ruido, dirección del movimiento, etc."></textarea>
	
		
			<label>Informaci&oacute;n de contacto (opcional)</label>


			<div>
			
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
		
		<div id="divContenedorCaptcha" style="display:flex; flex-direction:row; justify-content: center; padding-bottom:10px;">
			<div class="g-recaptcha"
			data-sitekey="6LccZqwpAAAAADvZGVjcSlwsIJs6yhB2aUowwpIk"
			data-callback="captchaDiligenciado"
			data-expired-callback="captchaExpirado"></div>
		</div>
	
		<div style="display:flex; justify-content: center; align-items: center;">
			<button id="boton_enviar" type="button"	onclick="enviarForm({mostrarMensaje:true});" style="background-color: rgb(104, 158, 55); color: #FFFFFF; display: block;">
				Enviar
			</button>
		</div>		

		<div id="pagina_final" style="display: none;">
			<div >
				<h2>Muchas gracias por tu colaboraci&oacute;n</h2>
			</div>

			<div style="background-image: url('img/pattern_peq.png');">
				<img src="img/gracias.png" style="margin: 0 auto;">
			</div>
		</div>
	</form>

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

	<div style="font-size: 11px;background-color: #545454; color: #DDDDDD; display:flex; flex-direction:column; justify-content: center; align-items: center;">
		<div style="display:flex; flex-wrap:wrap; justify-content: center; align-items: center;">
			<div><b>Direcci&oacute;n: </b> Diagonal 53 No 34 - 53 Bogot&aacute; D.C.	Colombia, </div>
			<div><b>Tel&eacute;fono:</b> (571)220 0200 - (571)220 0100 -(571)222 1811,</div> 
			<div>F&aacute;x: (571) 222 07 97</div>
		</div>
		<div style="display:flex; flex-wrap:wrap; justify-content: center; align-items: center;">
			Todos los derechos reservados 2016-2017 Apartado A&eacute;reo 4865
		</div>
		<div style="display:flex; flex-wrap:wrap; justify-content: center; align-items: center;">			
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