extends Node2D
@export var numNivel = 5
var porColor = {}
var cantidad = 0

func _ready() -> void:
	if numNivel >= Global.nivelActual:
		Global.nivelActual += 1

	for comidita in get_tree().get_nodes_in_group("comidita"):
		var color = comidita.colorComida
		if not porColor.has(color):
			porColor[color] = 0
		porColor[color] += 1
		cantidad += 1
		
	Global.iniciarComiditas(cantidad, false)
	
	$ganasteCartel/Label.visible = false
	$perdisteCartel/Label.visible = false
	$perdisteCartel/Label2.visible = false
