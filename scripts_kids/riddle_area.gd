extends Area2D


@export var required_stars := 3
@export var riddle_ui: Control
func _ready():
	riddle_ui.hide()


func _on_body_entered(body: Node2D) -> void:
	print("📦 Area2D collision happened")
	if not body.is_in_group("player"):
		return # Replace with function body.
		
	if body.stars_collected >= required_stars:
		riddle_ui.show_riddle () 
	else:
		print("You need more stars")
