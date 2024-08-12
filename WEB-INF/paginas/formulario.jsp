<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="css/formulario.css">
	
	<script type="text/javascript" src="js/_externos/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="js/_externos/jquery/jquery-ui-1.10.2.js"></script>
	<script type="text/javascript" src="js/_externos/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="js/conexiones.js?v=224"></script>
	<script type="text/javascript" src="js/formulario_intensidad.js?v=224"></script>
	<script type="text/javascript" src="js/validacion.js?v=224"></script>
	<script type="text/javascript" src="js/general.js?v=224"></script>
	<script type="text/javascript" src="js/selector_tabla.js?v=224"></script>
	<script type="text/javascript" src="js/i18n_es.js?v=224"></script>
	
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-RG6HZS21QF"></script>
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
	
		gtag('config', 'G-RG6HZS21QF');
	</script>
	
	<jsp:include page="monitor_html.html" />
	
	<title>Formulario - Evaluaci&oacute;n de intensidades</title>
</head>

<body onload="init('<%=request.getAttribute("REQ_SISMO_SELECCIONADO")%>');">
	<div id="overlay_carga"
	style="position: absolute; top: 0; bottom: 0; left: 0%; right: 0; margin: auto; height: 512px; width: 512px; display: block;">
		<img src="img/carga.gif" style="margin-left: auto; margin-right: auto;">
	</div>

	<div class="container-fluid" style="text-align: center; display: none;"
		id="formulario">
		<form id="formularioForm"
			action="EvaluacionIntensidadesServlet?metodo=procesarDatosWebInf"
			method="post">
			<input type="hidden" id="idForm" name="idForm" value="" /> <input
				type="hidden" id="metodo" name="metodo" value="verSalidas">
			<div class="row">
				<div id="tituloPagina" class="col-sm-12"
					style="background-color: rgb(104, 158, 55); color: #EEEEEE; font-size: 2em;">
				</div>
			</div>

			<div class="row">
				<div class="col-sm-12"
					style="background-image: url('img/pattern_peq.png');">
					<img id="imagenTitulo" class="img-responsive"
						style="margin: 0 auto;">
				</div>
			</div>

			<div class="row"
				style="background-color: #CCCCCC; padding-bottom: 5px; padding-top: 5px; font-size: 11px;">
				<div class="col-sm-1"></div>
				<div class="col-sm-10" style="color: #4e535b;">
					<div id="textoDescriptivo" style="font-weight: bold;"></div>
				</div>
				<div class="col-sm-1"></div>
			</div>

			<br />

			<!-- ------------------------------------------------------------------- -->
			<!-- Fin de encabezado -->
			<!-- ------------------------------------------------------------------- -->

			<div id="pagina_0">
				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>Por favor selecciona el sismo que sentiste del siguiente
							listado</h4>
					</div>
				</div>

				<div class="row">
					<!-- 
		<div class="col-sm-12" style="background-color:  color: rgb(244, 244, 243);">
		 -->
					<div
						style="background-color: #BBBBBB; overflow-x: auto; overflow-y: scroll; height: 200px; max-width: 200px; margin-left: auto; margin-right: auto;">
						<table id="tablaSismos"
							style="margin-left: auto; margin-right: auto; font-size: 12px;">
							<thead>
								<tr>
									<th style="text-align: center;">FECHA Y HORA</th>
									<!-- 
						<th style="text-align: center;">EPICENTRO</th>
						 -->
								</tr>
							</thead>
							<tbody id="tablaSismosBody"></tbody>
						</table>
						<input type="hidden" id="id_sismo" name="id_sismo" value="">
						<input type="hidden" id="descripcion_sismo"
							name="descripcion_sismo" value="">
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>
							Si el sismo que sentiste no est&aacute; en la lista, haz click <a
								href="#" onclick="irAPaginaSismoAlterno();">aqu&iacute;</a>
						</h4>
					</div>
				</div>
			</div>

			<!-- ------------------------------------------------------------------- -->
			<!-- Fin de pagina 0 -->
			<!-- ------------------------------------------------------------------- -->


			<div id="pagina_sismo_alterno" style="display: none;">
				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>&iquest;En que fecha percibiste el sismo?</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<input type="text" id="sismo_alterno_fecha"
							name="sismo_alterno_fecha" title="Fecha">
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>&iquest;A qu&eacute; hora lo sentiste?</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<select name="sismo_alterno_hora" id="sismo_alterno_hora"
							style="max-width: 50px;"></select> <select
							name="sismo_alterno_minuto" id="sismo_alterno_minuto"
							style="max-width: 50px;"></select> <select
							name="sismo_alterno_tarde">
							<option value="AM">AM</option>
							<option value="PM">PM</option>
						</select>
					</div>
				</div>
			</div>

			<!-- ------------------------------------------------------------------- -->
			<!-- Fin de pagina sismo alterno -->
			<!-- ------------------------------------------------------------------- -->


			<div id="pagina_1" style="display: none;">
				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>Departamento</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" >
						<select id="id_departamento" name="id_departamento"
							onchange="cargarMunicipios(this.value, false);"></select>
					</div>
				</div>


				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>Municipio</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12"
						>
						<select id="id_municipio" name="id_municipio"
							onchange="cargarCentrosPoblados(this.value);"></select>
					</div>
				</div>


				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>Centro poblado</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12"
						>
						<select id="id_centro_poblado" name="id_centro_poblado"></select>
					</div>
				</div>


				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4 style="margin-bottom: 0px;">Direcci&oacute;n aproximada</h4>
					</div>
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						(Por ejemplo: Calle 5 con carrera 2)</div>
				</div>
				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<input type="text" style="width: 50%;" name="direccion"
							required="required" title="Direcci&oacute;n" maxlength="100" />
					</div>
				</div>

			</div>

			<!-- ------------------------------------------------------------------- -->
			<!-- Fin de pagina 1 -->
			<!-- ------------------------------------------------------------------- -->


			<div id="pagina_2" style="display: none;">
				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>&iquest;En qu&eacute; lugar te encontrabas en el momento
							del sismo?</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12"
						>
						<label class="radio-inline"> <input id="adentro"
							type="radio" name="donde_estaba" value="1"
							onclick="toggleAdentroEdificacion();" checked="checked" />
							Dentro de una edificaci&oacute;n
						</label> <label class="radio-inline"> <input type="radio"
							name="donde_estaba" id="afuera" value="0"
							onclick="toggleAdentroEdificacion();" /> En la calle
						</label>

					</div>
				</div>

				<div id="dependientesAdentroEdificio" style="display: block;">
					<div class="row">
						<div class="col-sm-12" style="color: rgb(104, 158, 55);">
							<h4>&iquest;En qu&eacute; piso estabas?</h4>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12"
							>
							<select id="piso" name="piso"
								title="Piso en el que te encontrabas">
								<option value="-1">Selecciona</option>
								<option value="0">S&oacute;tano</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">Mayor a 5</option>
							</select>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12" style="color: rgb(104, 158, 55);">
							<h4>&iquest;Saliste a la calle?</h4>
						</div>
					</div>

					<div class="row">
						<div  class="col-sm-12">
							<span id="divRtasSalioCalle" style="border-width: 1; border-style: solid; border-color:#fff;">
								<input type="radio" name="salio_calle" value="0" id="saliste_calle_no" onchange="desmarcar('divRtasSalioCalle');"/> No 
								<input type="radio" name="salio_calle" value="1" onchange="desmarcar('divRtasSalioCalle');"/> S&iacute; &nbsp;
							</span>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12" style="color: rgb(104, 158, 55);">
							<h4>&iquest;Percibiste vibraci&oacute;n o balanceo de?</h4>
						</div>

						<div class="col-sm-12"
							>
							<input type="checkbox" id="balanceo_edificio"
								name="balanceo_edificio" value="1" />Edificio &nbsp; <input
								type="checkbox" id="balanceo_habitacion"
								name="balanceo_habitacion" value="1" />Habitaci&oacute;n &nbsp;
							<input type="checkbox" id="balanceo_mueble"
								name="balanceo_mueble" value="1" />Mueble
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>&iquest;Con qu&eacute; intensidad sentiste el sismo?</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12"
						>
						<select id="intensidad_sentida" name="intensidad_sentida"
							title="&#191;Con qu&#233; intensidad sentiste el sismo?">
							<option value="-1">Selecciona</option>
							<option value="1">Leve</option>
							<option value="2">Moderado</option>
							<option value="3">Fuerte</option>
							<option value="4">Muy fuerte</option>
						</select>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>&iquest;Qu&eacute; actividad realizabas cuando sentiste
							el sismo?</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12"
						>
						<input id="actividad_reposo" type="radio" name="actividad" value="0" checked="checked" />
						<label for="actividad_reposo" style="font-weight: normal;">En
							reposo</label> &nbsp; 
						
						<input id="actividad_movimiento" type="radio" name="actividad" value="0" />
						<label for="actividad_movimiento" style="font-weight: normal;">En
							movimiento</label> &nbsp; 
						
						<input id="actividad_durmiendo" type="radio" name="actividad" value="1" />
						<label for="actividad_durmiendo" style="font-weight: normal;">Durmiendo
							y me despert&eacute;</label>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>&iquest;Cu&aacute;l fue tu reacci&oacute;n?</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" >
						<span id="divRtasTuReaccion" style="border-width: 1; border-style: solid; border-color:#fff;">
							<input id="reaccion_ninguna" type="checkbox" onclick="toggleReaccion(this.id);" />Ninguna&nbsp; 
							<input id="reaccion_1" type="checkbox" name="reaccion_asombro" value="1" onclick="toggleReaccion(this.id);" />Asombro &nbsp; 
							<input id="reaccion_2" type="checkbox" name="reaccion_susto" value="2" onclick="toggleReaccion(this.id);" />Susto&nbsp; 
							<input id="reaccion_3" type="checkbox" name="reaccion_panico" value="3" onclick="toggleReaccion(this.id);" />P&aacute;nico
						</span>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>&iquest;Perdiste el equilibrio?</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12"
						>
						<select id="perdida_estabilidad" name="perdida_estabilidad"
							title="&#191;Perdiste el equilibrio?">
							<option value="-1">Selecciona</option>
							<option value="0">No</option>
							<option value="1">Sent&iacute; mareo</option>
							<option value="2">Perd&iacute; el equilibrio</option>
							<option value="3">Tuve dificultad para mantenerme de pie</option>
						</select>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>&iquest;Las personas que estaban cerca de ti lo
							sintieron?</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12"
						>
						<select id="personas_cerca" name="personas_cerca"
							title="&#191;Las personas que estaban cerca de ti lo sintieron?">
							<option value="-1">Selecciona</option>
							<option value="0.2">No s&eacute;</option>
							<option value="0">Nadie lo sinti&oacute;</option>
							<option value="0.5">Algunos lo sintieron y otros no</option>
							<option value="1">La mayor&iacute;a lo sinti&oacute;</option>
							<option value="1">Todos lo sentimos</option>
							<option value="0">Estaba solo/a</option>
						</select>
					</div>
				</div>
			</div>
			<!-- ------------------------------------------------------------------- -->
			<!-- Fin de pagina 2 -->
			<!-- ------------------------------------------------------------------- -->
			<div id="pagina_3" style="display: none;">
				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>Selecciona los efectos que observaste en los objetos a tu
							alrededor:</h4>
					</div>
				</div>


				<div class="row">
					<div class="col-sm-12"
						>
						<input id="" type="checkbox" value="1" name="balanceo_colgantes" />Balanceo
						de objetos colgantes<br /> <input id="" type="checkbox" value="1"
							name="ruido_puertas" />Ruido de puertas, ventanas, vidrios o
						porcelanas<br /> <input id="" type="checkbox" value="1"
							name="golpeteo_porcelana" />Golpeteo de porcelana, frascos o
						vasos<br /> <input id="" type="checkbox" value="1"
							name="vaiven_puertas" />Vaiv&eacute;n de puertas o ventanas<br />
						<input id="" type="checkbox" value="1" name="oscilacion_liquidos" />Oscilaci&oacute;n
						o vertimiento de l&iacute;quidos<br /> <input id=""
							type="checkbox" value="1" name="reaccion_animales" />Reacci&oacute;n
						de susto en los animales<br /> <input id="" type="checkbox"
							value="1" name="caida_pequenos" />Ca&iacute;da o desplazamiento
						de objetos peque&ntilde;os<br /> <input id="" type="checkbox"
							value="1" name="volcamiento_pesados" />Desplazamiento o
						volcamiento de objetos pesados o muebles<br /> <input id=""
							type="checkbox" value="1" name="caida_pesados" />Ca&iacute;da de
						objetos pesados como televisores, computadores, etc.
					</div>
				</div>

				<br />

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>&iquest;Hubo alg&uacute;n da&ntilde;o en la
							construcci&oacute;n donde te encontrabas?</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12"
						>
						<input id="dano_constr_si" type="radio" value="1"
							name="dano_construccion" onclick="toggleDanoConstruccion();" />
						<label for="dano_constr_si" style="font-weight: normal;">S&iacute;</label>
						&nbsp; <input type="radio" id="dano_constr_no" value="0"
							name="dano_construccion" onclick="toggleDanoConstruccion();"
							checked="checked" /> <label for="dano_constr_no"
							style="font-weight: normal;">No</label>
					</div>
				</div>

				<div id="dependientesDano" style="display: none;">
					<div class="row">
						<div class="col-sm-12" style="color: rgb(104, 158, 55);">
							<h4>Material de la construcci&oacute;n averiada</h4>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12"
							>
							<select name="material_construccion">
								<option value="1">No s&eacute;</option>
								<option value="2">Adobe bahareque, tapia o roca</option>
								<option value="3">Ladrillo</option>
								<option value="4">Concreto reforzado</option>
								<option value="5">Madera</option>
								<option value="6">Acero</option>
							</select>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12" style="color: rgb(104, 158, 55);">
							<h4>Tipo de da&ntilde;o</h4>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12"
							>
							<input type="checkbox" value="1" id="tipo_danos_grietas_revest"
								name="tipo_danos_grietas_revest" />Grietas delgadas en el
							pa&ntilde;ete o revestimiento<br /> <input type="checkbox"
								value="2" id="tipo_danos_caida_revest"
								name="tipo_danos_caida_revest" />Ca&iacute;da de trozos de
							pa&ntilde;ete<br /> <input type="checkbox" value="2"
								id="tipo_danos_caida_tejas" name="tipo_danos_caida_tejas" />Ca&iacute;da
							de tejas o chimeneas<br /> <input type="checkbox" value="3"
								id="tipo_danos_grietas_muros" name="tipo_danos_grietas_muros" />Grietas
							en muros<br />

						</div>
					</div>
				</div>
			</div>
			<!-- ------------------------------------------------------------------- -->
			<!-- Fin de pagina 3 -->
			<!-- ------------------------------------------------------------------- -->

			<div id="pagina_4" style="display: none;">
				<div class="row">
					<div class="col-sm-12"
						style="color: rgb(104, 158, 55); padding-left: 15%; padding-right: 15%;">
						<h4>&iquest;Hubo alg&uacute;n efecto sobre la naturaleza
							cerca de donde estabas? Por ejemplo deslizamientos de tierra,
							grietas en el suelo, cambios en el curso de r&iacute;os, etc. Si
							la respuesta es afirmativa, por favor especifica.</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12"
						style="color: rgb(104, 158, 55); padding-left: 15%; padding-right: 15%;">
						<input type="text" style="width: 100%;" name="efectos_naturaleza"
							maxlength="500" />
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>&iquest;Alg&uacute;n comentario adicional sobre el sismo
							que resulte &uacute;til (Duraci&oacute;n, ruido, direcci&oacute;n
							del movimiento, etc.)?</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12"
						style="color: rgb(104, 158, 55); padding-left: 15%; padding-right: 15%;">
						<input type="text" style="width: 100%;" name="comentarios"
							maxlength="500" />
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12" style="color: rgb(104, 158, 55);">
						<h4>Informaci&oacute;n de contacto (opcional)</h4>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12"
						style="color: rgb(104, 158, 55); padding-left: 15%; padding-right: 15%;">

						<div class="table-responsive">
							<table style="width: 100%;" class="table">
								<tr style="width: 100%;">
									<td style="padding-right: 5px;">Nombre</td>
									<td style="width: 100%;"><input type="text"
										name="contacto_nombre" style="width: 100%;" maxlength="100" /></td>
								</tr>
								<tr style="width: 100%;">
									<td>E-mail</td>
									<td style="width: 100%;"><input type="text"
										name="contacto_correo" style="width: 100%;" maxlength="100" /></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- ------------------------------------------------------------------- -->
			<!-- Fin de pagina 4 -->
			<!-- ------------------------------------------------------------------- -->

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

			<br />
			
			<div id="divContenedorCaptcha" style="display: none; flex-direction:row; justify-content: center; padding-bottom:10px;">
				<div class="g-recaptcha"
				data-sitekey="6LccZqwpAAAAADvZGVjcSlwsIJs6yhB2aUowwpIk"
				data-callback="captchaDiligenciado"
				data-expired-callback="captchaExpirado"></div>
			</div>

			<button id="boton_anterior" type="button" class="btn btn-warning"
				style="background-color: #CCCCCC; color: #FFFFFF;">
				Anterior</button>
			&nbsp;&nbsp;
			<button id="boton_siguiente" type="button" class="btn btn-success"
				style="background-color: rgb(104, 158, 55); color: #FFFFFF;">
				Siguiente</button>									
	
			<button id="boton_enviar" type="button" class="btn btn-success"
				disabled
				style="background-color: rgb(104, 158, 55); color: #FFFFFF; display: none;"
				onclick="enviarFormulario();">Enviar</button>
			
		</form>

		<br /> <br />

		<div id="div_link_resultados" class="row" style="display: none;">
			<div class="col-sm-12"
				style="color: #545454; background-color: #DDDDDD; font-weight: bold;">
				&iexcl;Conoce los sismos sentidos y los resultados generados a
				partir del formulario de intensidades!
				<!-- 
			Te invitamos a conocer los productos de más de 1000 sismos que se han elaborado con la información que tú y otros usuarios nos han proporcionado a partir del formulario de intensidades, dándo click siguiente enlace:
			 -->
			</div>
			<div class="col-sm-12">&nbsp;</div>

			<form action="EvaluacionIntensidadesServlet">
				<input type="hidden" name="metodo" value="irASelector">
				<button type="submit" class="btn btn-success"
				style="background-color: rgb(104, 158, 55); color: #FFFFFF;">
					Ver	sismos sentidos
				</button>
			</form>
		</div>

		&nbsp;
		<div class="row" style="font-size: 11px;">
			<div class="col-sm-12"
				style="background-color: #545454; color: #DDDDDD;">
				<div>
					<b>Direcci&oacute;n: </b> Diagonal 53 No 34 - 53 Bogot&aacute; D.C.
					Colombia, <b>Tel&eacute;fono:</b> (571)220 0200 - (571)220 0100 -
					(571)222 1811, F&aacute;x: (571) 222 07 97
				</div>
				<div>
					Todos los derechos reservados 2016-2017 Apartado A&eacute;reo 4865<br />
					<a href="https://www2.sgc.gov.co/Nosotros/AcercaDelSgc/Paginas/Politicas-de-Calidad.aspx"
						class="link_oficial">Pol&iacute;ticas y cumplimiento legal</a> | 
					<a href="https://www2.sgc.gov.co/Nosotros/NuestrasSedes/Paginas/nuestras-sedes.aspx"
						class="link_oficial">Nuestras sedes</a> | <a
						href="mailto:cliente@sgc.gov.co" class="link_oficial">Cont&aacute;ctenos</a> |
					<a href="mailto:notificacionesjudiciales@sgc.gov.co"
						class="link_oficial">Notificaciones Judiciales</a> | 
					<a href="https://www2.sgc.gov.co/AtencionAlCiudadano/Paginas/PQRDS.aspx"
						class="link_oficial">PQRD</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>