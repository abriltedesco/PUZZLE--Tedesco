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
	$ganasteCartel/Label.visible = false
	$perdisteCartel/Label.visible = false
	$perdisteCartel/Label2.visible = false
	
	if Global.esReinicio == true:
		$avisoCartel.visible = false
		Global.esReinicio = false 
		$reloj/Timer.start()
	else:
		get_tree().paused = true
		$avisoCartel.visible = true
		await get_tree().create_timer(5.0).timeout
		$avisoCartel.visible = false
		get_tree().paused = false
		$reloj/Timer.start()
