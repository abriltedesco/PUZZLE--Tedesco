extends Node

var nivelActual = 1 :
	set(value):
		nivelActual = value
		dataJuego['nivelActual'] = nivelActual
		guardarJuego()
		
var dataJuego = {	'nivelActual': 1 	}

func _ready() -> void:
	cargarJuego()

func guardarJuego():
	var archivo = FileAccess.open("user://data.save", FileAccess.WRITE)
	if archivo:
		archivo.store_line(JSON.stringify(dataJuego))
		archivo.close()
		
func cargarJuego():
	if !FileAccess.file_exists("user://data.save"):
		print("no existe. empezando 1")
		return
	var archivo = FileAccess.open("user://data.save", FileAccess.READ)
	if archivo:
		var linea = archivo.get_line()
		var resultado = JSON.parse_string(linea)
		if resultado and resultado.has('nivelActual'):
			nivelActual = resultado['nivelActual']
		archivo.close()
