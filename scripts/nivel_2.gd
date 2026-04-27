extends Node2D
@export var numNivel = 2

func _ready() -> void:
		
	var cantidad = get_tree().get_nodes_in_group("comidita").size()
	Global.iniciarComiditas(cantidad)
	
	$ganasteCartel/Label.visible = false
	$perdisteCartel/Label.visible = false
	$perdisteCartel/Label2.visible = false
