extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_volver_pressed() -> void:
	$btnVolver/sonidoSelect.play()
	await $btnVolver/sonidoSelect.finished
	get_tree().change_scene_to_file("res://escenas/menu.tscn")
