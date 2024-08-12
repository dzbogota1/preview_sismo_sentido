// selecciona el valueASeleccionar y ejecuta el callback
function seleccionarOpcion(idSelect, valueASeleccionar, callback) {
	const select = get(idSelect);			
	var opciones = select.options;		

  	for (var i = 0; i < opciones.length; i++) {
  	    var option = opciones[i];
	  	    
  	    if (option.value == valueASeleccionar) {		  	  
  	    	select.selectedIndex = i;
  	    	callback();
  	        break;
  	    }
  	}
}

function numerosConCero(idPadre, valInf, limSup) {
	var padre = document.getElementById(idPadre);
	for (var i = valInf; i < limSup; i++) {
		if (i < 10) {
			valor =  "0" + i;
		} else {
			valor = i;
		};
		crearOption(padre, valor);
	}	
}

function crearOption(padre, valor) {
	var opt = document.createElement("option");
	opt.value = valor;
	opt.innerHTML = valor;
	padre.appendChild(opt);
}