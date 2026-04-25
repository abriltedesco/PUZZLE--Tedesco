extends StaticBody2D
@export var colorNiebla = "-"

func _ready() -> void:
	add_to_group("niebla")
	
	if colorNiebla != "-":
		add_to_group("niebla" + colorNiebla)
	
	if colorNiebla != "-":
		match colorNiebla:
			"verde":
				$Sprite2D.modulate = Color(0.0, 1.299, 0.478, 1.0)
			"celeste":
				$Sprite2D.modulate = Color(0.0, 0.792, 0.849, 1.0)
			"violeta":
				$Sprite2D.modulate = Color(0.811, 0.064, 0.814, 1.0)
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
