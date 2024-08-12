function get(id) {
	return document.getElementById(id);
}

function ajaxReq(url, metodo, onSuccess) {
    var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {		
	    if (xhttp.readyState == 4 && xhttp.status == 200) {
	    	onSuccess(xhttp.responseText);
	    }
	};
	xhttp.open(metodo, url, true);
	xhttp.send();	
}

function iniciarCarga() {
	get("overlay_carga").style.display="block";
	get("formulario").style.display="none";		
}
function terminarCarga() {
	get("overlay_carga").style.display="none";
	get("formulario").style.display="block";
}

function tableRow(tabla, celdas, id) {
	var tbody = document.getElementsByTagName("tbody")[0];
	var row = tbody.insertRow(tbody.rows.length);

	for (var i = 0; i < celdas.length; i++) {
		var cell = row.insertCell(i);		
		cell.innerHTML = celdas[i];	
		cell.style.paddingRight= "5px";
	}
	
	row.idSismo = id;
	
	return row;
}

function listaSismos(url, campos, idSismo) {
	iniciarCarga();
	ajaxReq(url, "GET", function(responseText) {
    	var tabla = document.getElementById("tablaSismosBody");
    	tabla.innerHTML="";
    	console.log("tabla.innerHTML")
    	console.log(tabla.innerHTML)
    	
    	var sismos = JSON.parse(responseText);
    	//console.log(sismos)    	    	
    	    	    
    	for (var i = 0; i < sismos.length; i++) {
    		var sismo = sismos[i];
    		
    		let prof = sismos[i].profundidad;
    		if (prof && parseFloat(prof) < 30) {
    			sismos[i].profundidad ="< 30";
    		}
    		
    		const imax= sismos[i].I_MAX;
    		
    		if (imax && parseFloat(imax) > 7) {
    			sismos[i].I_MAX =">7";
    		}
    		
    		
    		var valoresCeldas = [];
    		for (var j = 0; j < campos.length; j++) {
    			valoresCeldas.push(sismo[campos[j]]);
    		}
    		var row = tableRow(tabla, valoresCeldas, sismo.ID);
    		
    		if (idSismo && idSismo != null) {
    			if (sismo.ID == idSismo) {
    				seleccionarSismo(row);
    			}
    		} else{       			
    			if (i== 0) {
    				seleccionarSismo(row);
    			}
    		}
    	}
    	
    	$('#tablaSismos tbody tr ').on('click', function(event) {
    		seleccionarSismo(this);
    	});    	    
    	
    	terminarCarga();
	});
}

function seleccionarSismo(tr, forzarSeleccion) {	
	$(tr).siblings().removeClass("filaSeleccionada"); 
	
	if (forzarSeleccion) {
		$(tr).addClass("filaSeleccionada");
	} else {
		$(tr).toggleClass("filaSeleccionada");
	}
	
	get("id_sismo").value = tr.idSismo;
	var q = get("descripcion_sismo");
	if (q && q != null) {
		var s ="";
		$(tr).find('td').each (function() {
			s += this.innerHTML+" ";
		});  
		q.value = s;
	}
}