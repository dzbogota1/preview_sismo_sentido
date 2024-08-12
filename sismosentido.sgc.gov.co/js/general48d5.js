
function get(id) {
	return document.getElementById(id);
}

function clog(s) {
	console.log(s);
}

function esCadenaNoVacia(s) {
	return s != null && s.trim() != "";
}

function option(valor, texto, idContenedor) {
	var o = document.createElement("option");
	o.value = valor;
	o.innerHTML = texto;
	get(idContenedor).appendChild(o);
	return o;
}

function removerHijos(idContenedor) {
	var myNode = get(idContenedor);
	while (myNode.firstChild) {
	    myNode.removeChild(myNode.firstChild);
	}
}

function removerHijosC(myNode) {
	while (myNode.firstChild) {
	    myNode.removeChild(myNode.firstChild);
	}
}

function cargarDepartamentos() {		
	ajaxReq("EvaluacionIntensidadesServlet?metodo=cargarDepartamentos", "GET", function(responseText) {
    	removerHijos("id_departamento");
    	
    	option(-1, "Selecciona", "id_departamento");
    	
    	var depts = JSON.parse(responseText);
    	for (var i = 0; i < depts.length; i++) {
    		option(depts[i].id, formatearPalabras(depts[i].nombre), "id_departamento");
    	}
	});	
}

function cargarMunicipios(idDepto, agregarSeleccioneCP) {		
	removerHijos("id_municipio");
	ajaxReq("EvaluacionIntensidadesServlet?metodo=cargarMunicipios&idDepartamento="+idDepto, "GET", function(responseText) {
		option(-1, "Selecciona", "id_municipio");
				
		var mpios = JSON.parse(responseText);
    	for (var i = 0; i < mpios.length; i++) {			
    		option(mpios[i].id, formatearPalabras(mpios[i].nombre), "id_municipio");    		
    	}    	
    	    	    	
    	cargarCentrosPoblados(get("id_municipio").value, agregarSeleccioneCP);
	});		
};

function cargarCentrosPoblados(idCabecera, agregarSeleccione) {
	ajaxReq("EvaluacionIntensidadesServlet?metodo=cargarCentrosPoblados&idCabecera="+idCabecera, "GET", function(responseText) {
    	removerHijos("id_centro_poblado");    	
    	
    	var autoSeleccionarCabeceraMun = true;
    	if (agregarSeleccione) {
    		option(-1, "Selecciona", "id_centro_poblado");
    		autoSeleccionarCabeceraMun = false;
    	}    
    		
    	var l = document.getElementById("id_municipio");
    	var s = l.options[l.selectedIndex].innerHTML;
    	var cps = JSON.parse(responseText);
    	for (var i = 0; i < cps.length; i++) {    		
    		var opt = option(cps[i].id, formatearPalabras(cps[i].nombre), "id_centro_poblado");
    		if (autoSeleccionarCabeceraMun && cps[i].tipo ==1) {    			
    			opt.selected="selected";
    		}
    	}
	});		
};

async function fetchMunicipios(idDepto, agregarSeleccioneCP, idMun) {
    removerHijos("id_municipio");
    option(-1, "Selecciona", "id_municipio");        
    const response = await fetch("EvaluacionIntensidadesServlet?metodo=cargarMunicipios&idDepartamento="+idDepto);
    const mpios = await response.json();
	for (var i = 0; i < mpios.length; i++) {			
		option(mpios[i].id, formatearPalabras(mpios[i].nombre), "id_municipio");
		if (idMun && mpios[i].id == idMun) {
			get("id_municipio").selectedIndex = i + 1; // se suma un 1 porque la opcion "selecciona" toma el indice 0.
		}    		
	}    	
    	    	    	
    await fetchCentrosPoblados(get("id_municipio").value, agregarSeleccioneCP);    
};

async function fetchCentrosPoblados(idCabecera, agregarSeleccione) {
	console.log("fetchCentrosPoblados")
	removerHijos("id_centro_poblado");
	var autoSeleccionarCabeceraMun = true;
	if (agregarSeleccione) {
		option(-1, "Selecciona", "id_centro_poblado");
		autoSeleccionarCabeceraMun = false;
	}    
	const response = await fetch("EvaluacionIntensidadesServlet?metodo=cargarCentrosPoblados&idCabecera="+idCabecera);		
	var cps = await response.json();
	for (var i = 0; i < cps.length; i++) {    		
		var opt = option(cps[i].id, formatearPalabras(cps[i].nombre), "id_centro_poblado");
		if (autoSeleccionarCabeceraMun && cps[i].tipo ==1) {    			
			opt.selected="selected";
		}
	}
};

// Convierte "LAGUNA DE LOS PATOS" en "Laguna De Los Patos".
function formatearPalabras(string) {
	if (string == null) {
		return null;
	}	
		
	const tokens = string.split(" ");
	var ret = "";
	for (var i = 0; i < tokens.length; i++) {
		var t = tokens[i];
		var nuevoToken = t.toLowerCase();
		
		if (nuevoToken == "d.c." || nuevoToken=="d.c.," ) {
			ret +=nuevoToken.toUpperCase();
		} else {		
			if (i>0 && (nuevoToken == "de" || nuevoToken == "del" || nuevoToken == "y" || nuevoToken == "el" || nuevoToken =="la" ||  nuevoToken=="los" || nuevoToken == "las")) {
				ret += nuevoToken;
			} else {
				ret += t.charAt(0).toUpperCase() + nuevoToken.slice(1);
			}
		}
		if (i < tokens.length -1) {
			ret +=" ";
		}
	}
	return ret;
}