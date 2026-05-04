extends Node2D
@export var numNivel = 5
var porColor = {}
var cantidad = 0

func _ready() -> void:
	for comidita in get_tree().get_nodes_in_group("comidita"):
		var color = comidita.colorComida
		if not porColor.has(color):
			porColor[color] = 0
		porColor[color] += 1
		cantidad += 1
		
	Global.iniciarComiditas(cantidad, false)
	
	$avisoCartel/Label.visible = true
	$avisoCartel/Label2.visible = true
	await get_tree().create_timer(8.0).timeout
	$avisoCartel/Label.visible = false
	$avisoCartel/Label2.visible = false
	get_tree().paused = false
	$reloj/Timer.start()
