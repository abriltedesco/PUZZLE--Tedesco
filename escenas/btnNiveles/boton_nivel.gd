extends TextureButton

var numNivel = 1
var dirNivel = ""

func _ready() -> void:
	pass 


func _on_pressed() -> void:
	if dirNivel != "":
		get_tree().change_scene(dirNivel)
