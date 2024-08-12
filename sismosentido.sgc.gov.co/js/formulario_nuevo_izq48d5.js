function init(idSismo) {	
	ajaxReq("EvaluacionIntensidadesServlet?metodo=ultimosSismosBatch", "GET", function(responseText) {
    	removerHijos("id_sismo");
    	option(-1, "Selecciona", "id_sismo");
    	
    	var sismos = JSON.parse(responseText);
    	for (var i = 0; i < sismos.length; i++) {
    		option(sismos[i].ID, sismos[i].Fecha + " " + sismos[i].Localizacion, "id_sismo");
    	}    	    	
	});	
	
	
	if (idSismo == "null") {
		idSismo = null;
	}

	cargarDepartamentos();
	terminarCarga();	
}

function mostrarSismoManual() {
	get("id_sismo").value=-1;
	get("esSismoManual").value="1";
	get("panelSismoManual").style.display="block";
	document.getElementById("sismo_alterno_fecha").value="";
	document.getElementById("sismo_alterno_hora").value="";
	document.getElementById("sismo_alterno_minuto").value="";
	
	numerosConCero("sismo_alterno_hora", 1, 13);
	numerosConCero("sismo_alterno_minuto", 0, 60);
	
	$(function() {
		$("#sismo_alterno_fecha").datepicker({
			maxDate:0,     			
			dayNamesMin:["Lu","Ma","Mi","Ju","Vi","S&aacute;","Do"]
		});	   
	    $("#sismo_alterno_fecha").empty();
	    $("#sismo_alterno_origen").empty();	    
	});
}

function handleChangeIdSismo() {	
	document.getElementById("sismo_alterno_fecha").value="";
	document.getElementById("sismo_alterno_hora").value="";
	document.getElementById("sismo_alterno_minuto").value="";
	get("esSismoManual").value="";
	get("panelSismoManual").style.display="none";
}

function geolocalizarCentroPoblado(position) {
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;				
	const x = document.getElementById("demo");
  	x.innerHTML = "Latitude: " + lat + "<br>Longitude: " + lon;

	get("id_centro_poblado").disabled=true;
	get("id_municipio").disabled=true;
	get("id_departamento").disabled=true;
	const textoGeoloc  = get("btnGeolocalizar").innerHTML;
	get("btnGeolocalizar").innerHTML = "geolocalizando...";

  	ajaxReq("rest/centroPobladoPorCoords/"+lon+"/"+lat, "GET", function(responseText) {
  		console.log(responseText)
  		const json = JSON.parse(responseText);
	    const codCP = json.COD_CENTRO_POBLADO;

  		const codDepto = JSON.parse(responseText).COD_DEPTO;
		seleccionarOpcion("id_departamento", codDepto, async function() { 
			await fetchMunicipios(codDepto, false, json.COD_MUNICIPIO);
			seleccionarOpcion("id_centro_poblado", json.COD_CENTRO_POBLADO, function() {console.log("!!!")})
			
			get("id_centro_poblado").disabled=false;
			get("id_municipio").disabled=false;
			get("id_departamento").disabled=false;
			get("btnGeolocalizar").innerHTML = textoGeoloc;
		});
	});	
}

function probarDeteccion() {
	alert(document.body.clientWidth)
	const objeto = { coords: { latitude: get("latitud").value, longitude: get("longitud").value} };
	geolocalizarCentroPoblado(objeto); 
}

function geolocalizar() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(geolocalizarCentroPoblado);
    } else { 
	    alert("error")
	    const x = document.getElementById("demo");		  
        x.innerHTML = "Este navegador no soporta geolocalizacion.";
    }
}

function toggleAdentroEdificacion() {
	var display; 
	
	if (get("adentro").checked == true) {
		display ="block";
	} else {
		display = "none";
	}
	
	const elementos = document.querySelectorAll('.dependientesAdentroEdificio');    
    elementos.forEach(elemento => {
        elemento.style.display = display;
    });
}

function toggleDanoConstruccion() {
	var display; 
	
	if (get("dano_constr_si").checked == true) {
		display ="block";
	} else {
		display = "none";
	}
	
	const elementos = document.querySelectorAll('.dependientesDano');    
    elementos.forEach(elemento => {
        elemento.style.display = display;
    });
	
}

function captchaDiligenciado() {
	document.getElementById("boton_enviar").disabled = false;
}

function captchaExpirado() {
	document.getElementById("boton_enviar").disabled = true;
}

function verResultados() {
	alert("fsdfdf");
}

function enviarForm(opciones) {
	alert("!!!")
	if (validarForm(opciones)) {		
		get("formularioForm").submit();
		alert ("enviado")
	} else {
		alert ("NO enviado")
	}
}