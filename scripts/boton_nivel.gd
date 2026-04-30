extends TextureButton

@export var numNivel = 1
@export var dirNivel =""

func _ready() -> void:
	if numNivel <= Global.nivelActual:
		disabled = false
		$Label.visible = true
		$Label.text = str(numNivel)
	else:
		disabled = true
		$Label.visible = false
		
func _on_pressed() -> void:
	$"../sonidoSelect".play()
	if dirNivel != "":
		await$"../sonidoSelect".finished
		get_tree().change_scene_to_file(dirNivel)
