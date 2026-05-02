extends Control
func _ready() -> void:
	$sonidoStart.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_jugar_pressed() -> void:
	$CanvasLayer/HBoxContainer/btnJugar/sonidoSelect.play()
	await $CanvasLayer/HBoxContainer/btnJugar/sonidoSelect.finished
	get_tree().change_scene_to_file("res://escenas/niveles.tscn")


func _on_btn_salir_pressed() -> void:
	$CanvasLayer/HBoxContainer/btnSalir/sonidoSelect.play()
	await $CanvasLayer/HBoxContainer/btnSalir/sonidoSelect.finished
	get_tree().quit() 


func _on_btn_reglas_pressed() -> void:
	$CanvasLayer/HBoxContainer/btnReglas/sonidoSelect.play()
	await $CanvasLayer/HBoxContainer/btnReglas/sonidoSelect.finished
	get_tree().change_scene_to_file("res://escenas/reglas.tscn")
