extends Control
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/niveles.tscn")


func _on_btn_salir_pressed() -> void:
	get_tree().quit() 


func _on_btn_reglas_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/reglas.tscn")
