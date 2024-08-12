/**
 * Valida que se elija una opcion de los radiobuttons
 * */

function validarCBoxes(idsCBoxes, textoCuandoVacio) {		
	for (var i = 0; i < idsCBoxes.length; i++) {
		//console.log(idsCBoxes[i])
		if (get(idsCBoxes[i]).checked == true) {
			return true;
		} 
	}
	
	alert(textoCuandoVacio);
	return false;
}

function validarRadioButtons(nombre, textoCuandoVacio) {
	var cbs = document.getElementsByName(nombre);	
	for (var i = 0; i < cbs.length; i++) {
		if (cbs[i].checked == true) {
			return true;
		}
	}
	alert(textoCuandoVacio);
	return false;
}

function validarInputs(idPagina, validarRequireds) {		
	var itexts = $("#" + idPagina + " input");
	for (var i = 0; i < itexts.length; i++) {
		var req = true;
		if (validarRequireds == true) {
			req = itexts[i].hasAttribute('required'); 
		}
		
		if (req && (itexts[i].value == null || itexts[i].value.trim() == "") ) {		 
			alert("El campo " + itexts[i].title + " es requerido, por favor ingresa el valor correspondiente. " );
			itexts[i].focus();
			return false;
		}
	}
	
	return true;
}

/**
 * Se utiliza en el formulario viejo.
 * Valida los selects de la pagina dada. 
 * Un valor de -1 en un select significa que el usuario no ha seleccionado nada. 
 * */
function validarSelects(idsSelects) {	
	for (var i = 0; i < idsSelects.length; i++) {
		var sel = get(idsSelects[i]);
		var val = sel.value;
		if (val == -1) {
			alert("El campo "+ sel.title +" es requerido, por favor selecciona una opci\u00f3n" );
			sel.focus();
			return false;
		}	
	}
	
	return true;
}

// Funciones del nuevo formulario

function validarCheckBoxes(idsCBoxes, idRecuadro, mensaje, mensajes) {
	const recuadro = get(idRecuadro); 
	for (var i = 0; i < idsCBoxes.length; i++) {		
		if (get(idsCBoxes[i]).checked == true) {
			recuadro.classList.remove("control_error");
			return true;
		} 
	}
	
	recuadro.classList.add("control_error");
	mensajes.push(mensaje);
	return false;
}


function validarSelect(idSelect, mensaje, mensajes) {
	const select = get(idSelect); 	
	if ( select.value == -1 || select.value == "") {
		select.classList.add("control_error");
		mensajes.push(mensaje);
		return false;	
	} else {
		select.classList.remove("control_error");
		return true;
	}
}

function validarInput(idInput, mensaje, mensajes) {
	var input = get(idInput);
	if ( esCadenaNoVacia(input.value) ) {
		input.classList.remove("control_error");
		return true;
	} else {
		input.classList.add("control_error");
		mensajes.push(mensaje)				
		return false;
	}
}



function validarIdSismo(mensajes) {			
	if (parseInt(get("esSismoManual").value) == 1) {
		get("id_sismo").classList.remove("control_error");		
		validarInput("sismo_alterno_fecha", "indica fecha del sismo", mensajes);
	} else {
		get("sismo_alterno_fecha").classList.remove("control_error");		
		validarSelect("id_sismo", "Por favor selecciona un sismo", mensajes)
	}	
}

function validarDepartamento(mensajes) {
	validarSelect("id_departamento", "Por favor selecciona un departamento", mensajes)
}

function validarMunicipio(mensajes) {
	validarSelect("id_municipio", "Por favor selecciona un municipio", mensajes)
}

function validarCentroPoblado(mensajes) {
	validarSelect("id_centro_poblado", "Por favor selecciona un centro poblado", mensajes)
}

function validarDireccion(mensajes) {
	validarInput("direccion", "indica direccion", mensajes);
}

function validarPiso(mensajes) {
	validarSelect("piso", "Por favor selecciona un piso", mensajes);
}

function validarSalioCalle(mensajes) {
	const cbxs = document.getElementsByName("salio_calle");
	var ch = false;
	for (var i = 0; i < cbxs.length; i++) {
		if (cbxs[i].checked == true) {
			ch = true;
			break;
		}
	}
	const divRtasSalioCalle = get("divRtasSalioCalle");
	if (ch) {
		divRtasSalioCalle.classList.remove("control_error");
	} else {
		divRtasSalioCalle.classList.add("control_error");
		mensajes.push("Indica si saliste a la calle")
	}	
}

function validarIntensidad(mensajes) {
	validarSelect("intensidad_sentida", "Por favor selecciona la intensidad", mensajes);
} 

function validarReaccion(mensajes) {
	validarCheckBoxes(["reaccion_ninguna", "reaccion_1", "reaccion_2", "reaccion_3" ], "divRtasTuReaccion", "Ingresa una reaccion", mensajes)
}

function validarPerdidaEstabilidad(mensajes) {
	validarSelect("perdida_estabilidad", "Por favor indica si perdiste el equilibrio", mensajes);
}

function validarPersonasCerca(mensajes) {
	validarSelect("personas_cerca", "Por favor indica si las personas cercanas lo sintieron", mensajes);
}

function validarForm(opciones) {	
	var mensajes = [];	
	
	validarIdSismo(mensajes); 
	validarDepartamento(mensajes);
	validarMunicipio(mensajes);
	validarCentroPoblado(mensajes);
	validarDireccion(mensajes);	
	
	if (get("adentro").checked) {
		validarPiso(mensajes);
		validarSalioCalle(mensajes);
	}
	
	validarIntensidad(mensajes);
	validarReaccion(mensajes);
	validarPerdidaEstabilidad(mensajes)
	validarPersonasCerca(mensajes);	
		
	if (opciones && opciones.mostrarMensaje) {
		if (mensajes.length > 0) {
			var m = "";
			for (var i = 0; i < mensajes.length; i ++) {
				m += mensajes[i] + "\n";
			} 
			alert(m);
			return false;
		}
	}
	
	return mensajes.length == 0;
}
