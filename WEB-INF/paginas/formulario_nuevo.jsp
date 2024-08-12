<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
	<style>
		body {
			background-color:#000;
			padding:0; margin:0;
			font-family: 'Roboto';
		}
	    .panelPreguntas {
            display: grid;
            grid-template-columns: 50% 50%;            
            background-color: #bbb;
            width:100%;
            border:solid 2px black;
			padding:5px;
			gap: 10px 5px;
			
        }
        .panelPreguntas>label {
            text-align: right;                                   
        }
        .panelPreguntas>input, .panelPreguntas>select {
            text-align: left;            
            width: 200px; 
            font-size:12px;
        }
        
         .panelPreguntas>span {
            font-size:12px;
        }
        
        .elemColor1 {
			background-color: #ddd;
		}
		.elemColor2 {
			background-color: #bbb;
		}
	</style>
	<script type="text/javascript" src="js/general.js?v=224"></script>
	<script type="text/javascript">
		function toggleAdentroEdificacion() {		
			var display; 
			
			if (get("adentro").checked == true) {
				display ="grid";
			} else {
				display = "none";
			}
			
			get("dependientesAdentroEdificio").style.display = display;
		}
	</script>
</head>
<body>
	<form id="formularioForm"  action="EvaluacionIntensidadesServlet?metodo=procesarDatosWebInf" method="post">
		<div id="tituloPagina" style="background-color: rgb(104, 158, 55); color: #EEEEEE; font-size: 2em; width:100%;"></div>			

		<div style="background-image: url('img/pattern_peq.png'); ">
			<img src="img/mundo.png" height=50  style="margin: 0 auto;"> 
			<span style="font-weight: bold; font-size: 24px;">Formulario de Sismo Sentido</span>
		</div>
		
		<div class="panelPreguntas elemColor1">
			<label>Sismo</label>
			<select id="id_sismo" name="id_sismo"></select>
			
			<label>Departamento</label>
			<select id="id_departamento" name="id_departamento"	onchange="cargarMunicipios(this.value);"></select>

			
			<label>Municipio</label>
			<select id="id_municipio" name="id_municipio" onchange="cargarCentrosPoblados(this.value);"></select>
			
			<label>Centro poblado</label>
			<select id="id_centro_poblado" name="id_centro_poblado"></select>
					
			<label style="margin-bottom: 0px;">Direcci&oacute;n aproximada</label>											
			<input type="text" name="direccion" required="required" title="Direcci&oacute;n" />		
		</div>
		
		<div class="panelPreguntas elemColor2">
			<label>&iquest;En qu&eacute; lugar te encontrabas en el momento del sismo?</label>			
			<span>
				<label class="radio-inline">Dentro de una edificaci&oacute;n</label>
				<input id="adentro" type="radio" name="donde_estaba" value="1" onclick="toggleAdentroEdificacion();" checked="checked" />
								
				<label class="radio-inline"> En la calle</label>			
				<input type="radio"	name="donde_estaba" id="afuera" value="0" onclick="toggleAdentroEdificacion();" /> 
			</span>												
		</div>
		
		<div id="dependientesAdentroEdificio" class="panelPreguntas elemColor2">
			<label>&iquest;En qu&eacute; piso estabas?</label>

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

			<label>&iquest;Saliste a la calle?</label>

			<span id="divRtasSalioCalle" >
				<input type="radio" name="salio_calle" value="0" id="saliste_calle_no" onchange="desmarcar('divRtasSalioCalle');"/> No 
				<input type="radio" name="salio_calle" value="1" onchange="desmarcar('divRtasSalioCalle');"/> S&iacute; &nbsp;
			</span>

			<label>&iquest;Percibiste vibraci&oacute;n o balanceo de?</label>

			<span>
			<input type="checkbox" id="balanceo_edificio"
				name="balanceo_edificio" value="1" />Edificio &nbsp; 
			<input type="checkbox" id="balanceo_habitacion"
				name="balanceo_habitacion" value="1" />Habitaci&oacute;n &nbsp;
			<input type="checkbox" id="balanceo_mueble"
				name="balanceo_mueble" value="1" />Mueble
			</span>
		</div>
		
		<div class="panelPreguntas elemColor1">
			<label>&iquest;Con qu&eacute; intensidad sentiste el sismo?</label>
				
			<select id="intensidad_sentida" name="intensidad_sentida"
				title="&#191;Con qu&#233; intensidad sentiste el sismo?">
				<option value="-1">Selecciona</option>
				<option value="1">Leve</option>
				<option value="2">Moderado</option>
				<option value="3">Fuerte</option>
				<option value="4">Muy fuerte</option>
			</select>
			
			<label>&iquest;Qu&eacute; actividad realizabas cuando sentiste el sismo?</label>

			<span>
				<input id="actividad_reposo" type="radio" name="actividad" value="0" checked="checked" />
				<label for="actividad_reposo" style="font-weight: normal;">En
					reposo</label> &nbsp; 
				
				<input id="actividad_movimiento" type="radio" name="actividad" value="0" />
				<label for="actividad_movimiento" style="font-weight: normal;">En
					movimiento</label> &nbsp; 
				
				<input id="actividad_durmiendo" type="radio" name="actividad" value="1" />
				<label for="actividad_durmiendo" style="font-weight: normal;">Durmiendo
					y me despert&eacute;</label>
			</span>
			
			<label>&iquest;Cu&aacute;l fue tu reacci&oacute;n?</label>
			<span id="divRtasTuReaccion" >
				<input id="reaccion_ninguna" type="checkbox" onclick="toggleReaccion(this.id);" />Ninguna&nbsp; 
				<input id="reaccion_1" type="checkbox" name="reaccion_asombro" value="1" onclick="toggleReaccion(this.id);" />Asombro &nbsp; 
				<input id="reaccion_2" type="checkbox" name="reaccion_susto" value="2" onclick="toggleReaccion(this.id);" />Susto&nbsp; 
				<input id="reaccion_3" type="checkbox" name="reaccion_panico" value="3" onclick="toggleReaccion(this.id);" />P&aacute;nico
			</span>
		
			<label>&iquest;Perdiste el equilibrio?</label>
			<select id="perdida_estabilidad" name="perdida_estabilidad"
				title="&#191;Perdiste el equilibrio?">
				<option value="-1">Selecciona</option>
				<option value="0">No</option>
				<option value="1">Sent&iacute; mareo</option>
				<option value="2">Perd&iacute; el equilibrio</option>
				<option value="3">Tuve dificultad para mantenerme de pie</option>
			</select>
			
			<label>&iquest;Las personas que estaban cerca de ti lo	sintieron?</label>
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
		
		<div class="panelPreguntas elemColor1">
				<label>Selecciona los efectos que observaste en los objetos a tu alrededor:</label>
				<span>
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
				</span>
				<label>&iquest;Hubo alg&uacute;n da&ntilde;o en la construcci&oacute;n donde te encontrabas?</label>

				<span>
					<input id="dano_constr_si" type="radio" value="1"
						name="dano_construccion" onclick="toggleDanoConstruccion();" />
					<label for="dano_constr_si" style="font-weight: normal;">S&iacute;</label>
					&nbsp; <input type="radio" id="dano_constr_no" value="0"
						name="dano_construccion" onclick="toggleDanoConstruccion();"
						checked="checked" /> <label for="dano_constr_no"
						style="font-weight: normal;">No</label>
				</span>								
			</div>
			
			<div id="dependientesDano" class="panelPreguntas elemColor1">
					<label>Material de la construcci&oacute;n averiada</label>

					<select name="material_construccion">
						<option value="1">No s&eacute;</option>
						<option value="2">Adobe bahareque, tapia o roca</option>
						<option value="3">Ladrillo</option>
						<option value="4">Concreto reforzado</option>
						<option value="5">Madera</option>
						<option value="6">Acero</option>
					</select>

					<label>Tipo de da&ntilde;o</label>
					<span>
					<input type="checkbox" value="1" id="tipo_danos_grietas_revest"
						name="tipo_danos_grietas_revest" />Grietas delgadas en el
					pa&ntilde;ete o revestimiento<br /> <input type="checkbox"
						value="2" id="tipo_danos_caida_revest"
						name="tipo_danos_caida_revest" />Ca&iacute;da de trozos de
					pa&ntilde;ete<br /> <input type="checkbox" value="2"
						id="tipo_danos_caida_tejas" name="tipo_danos_caida_tejas" />Ca&iacute;da
					de tejas o chimeneas<br /> <input type="checkbox" value="3"
						id="tipo_danos_grietas_muros" name="tipo_danos_grietas_muros" />Grietas
					en muros
					</span>
				</div>			
			
		<div class="elemColor2">
			<label>&iquest;Hubo alg&uacute;n efecto sobre la naturaleza
				cerca de donde estabas? Por ejemplo deslizamientos de tierra,
				grietas en el suelo, cambios en el curso de r&iacute;os, etc. Si
				la respuesta es afirmativa, por favor especifica.</label>
			<br/>
			<input type="text" name="efectos_naturaleza" maxlength="500" style="width:500px;" />

			<div>
				<label>&iquest;Alg&uacute;n comentario adicional sobre el sismo
				que resulte &uacute;til (Duraci&oacute;n, ruido, direcci&oacute;n
				del movimiento, etc.)?</label><br/>
				<input type="text" name="comentarios"style="width:500px;" maxlength="500" />
			</div>
			<label>Informaci&oacute;n de contacto (opcional)</label>

			<div>
				<table style="width: 100%;" class="table">
					<tr style="width: 100%;">
						<td style="padding-right: 5px;">Nombre</td>
						<td style="width: 100%;">
							<input type="text" name="contacto_nombre" style="width: 900%;" maxlength="100" /></td>
					</tr>
					<tr style="width: 100%;">
						<td>E-mail</td>
						<td style="width: 100%;"><input type="text"
							name="contacto_correo" style="width: 100%;" maxlength="100" /></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>