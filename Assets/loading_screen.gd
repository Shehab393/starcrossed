extends Control

func _ready():
	# 1. نتأكد إن فيديو التحميل شغال
	$VideoStreamPlayer.play()
	
	# 2. اللعبة "بتمثل" إنها بتحمل (نستنى 4 ثواني مثلاً)
	# (ده الوقت اللي هيتعرض فيه فيديو الظلال الزرقاء)
	await get_tree().create_timer(4.0).timeout
	
	# 3. نشوف المخ حافظ مين، وننقل على الليفل بتاعه
	if GameManager.player_choice == "KIDS":
		get_tree().change_scene_to_file("res://scenes_kids/level 1 children pov.tscn")
		
	elif GameManager.player_choice == "WIZARD":
		get_tree().change_scene_to_file("res://Scenes_Gasser/gassermap.tscn")
	
	
