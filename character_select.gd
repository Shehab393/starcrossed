extends Control

func _on_btn_kids_pressed():
	GameManager.player_choice = "KIDS"
	get_tree().change_scene_to_file("res://intro_cutscene.tscn")

func _on_btn_wizard_pressed():
	GameManager.player_choice = "WIZARD"
	get_tree().change_scene_to_file("res://intro_cutscene.tscn")
