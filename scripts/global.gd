extends Node

var nivelActual = 1 :
	set(value):
		nivelActual = value
		dataJuego['nivelActual'] = nivelActual
		guardarJuego()
		
var dataJuego = {	'nivelActual': 1 	}
var comiditasRestantes =0
var comiditasPorColor= {}
var salidaAbierta=false
var botonPisado= false 
var necesitaBtn=false
var esReinicio =false
var habilitadoParaRomper = {}

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
		
func iniciarComiditas(cantidad: int, necesita:bool = false) -> void: # si no le mandas nada, asume q es false
	comiditasRestantes = cantidad
	salidaAbierta = false
	botonPisado = false
	necesitaBtn = necesita
	comiditasPorColor.clear()
	habilitadoParaRomper.clear()
	
	for comida in get_tree().get_nodes_in_group("comidita"):
		if comida.colorComida != "-":
			habilitadoParaRomper[comida.colorComida] = false
			if comiditasPorColor.has(comida.colorComida):
				comiditasPorColor[comida.colorComida] += 1
			else:
				comiditasPorColor[comida.colorComida] = 1
			
	print("colores en este nivel: ", comiditasPorColor)
	
func abrirSalida():
	salidaAbierta = true
	
func recolectar(color) -> void:
	comiditasRestantes -= 1
	
	if color != "-" and comiditasPorColor.has(color):
		comiditasPorColor[color] -= 1
		if comiditasPorColor[color] <= 0:
			habilitadoParaRomper[color] = true 
			colorCompletado(color)
		
	if comiditasRestantes <= 0:
		chequearVictoria() 
		
func colorCompletado(color: String) -> void:
	for niebla in get_tree().get_nodes_in_group("niebla" + color):
		niebla.queue_free()
		print("nieblas " + color + " destruidas!")
		
func pisarBoton() -> void:
	botonPisado = true
	print("Botón activado.")
	chequearVictoria()
	
func chequearVictoria() -> void:
	if comiditasRestantes == 0 :
		if !necesitaBtn or botonPisado:
			salidaAbierta = true
			print("salida abierta")
