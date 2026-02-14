extends Control

@onready var video_player = $VideoStreamPlayer

func _ready():
	# --- 1. إيقاف الموسيقى القديمة ---
	if MusicManager.has_node("AudioStreamPlayer"):
		MusicManager.get_node("AudioStreamPlayer").stop()
	elif MusicManager.get_child_count() > 0:
		var sound_node = MusicManager.get_child(0)
		if sound_node.has_method("stop"):
			sound_node.stop()

	# --- 2. تشغيل الفيديو حسب الاختيار ---
	print("الاختيار المحفوظ هو: ", GameManager.player_choice)
	
	var video_path = ""
	if GameManager.player_choice == "KIDS":
		video_path = "res://Assets/videos/Intro Final.ogv"
	elif GameManager.player_choice == "WIZARD":
		video_path = "res://Assets/videos/Intro Final.ogv"
	
	if video_path != "" and FileAccess.file_exists(video_path):
		video_player.stream = load(video_path)
		video_player.play()
	else:
		print("خطأ! الفيديو مش موجود أو المسار غلط")


# ---------------------------------------------------------
# الحل السحري للتعليق (call_deferred)
# الدالة دي بتوقف الفيديو وتأجل النقل "فيمتو ثانية" عشان اللعبة متضربش
func go_to_loading():
	video_player.stop()
	# الكود لازم يكون كده (الأمر الأول، وبعدين العنوان)
	get_tree().call_deferred("change_scene_to_file", "res://LoadingScreen.tscn")
# ---------------------------------------------------------


func _on_video_stream_player_finished():
	# الحالة 1: الفيديو خلص لوحده
	go_to_loading()


func _on_btn_skip_pressed() -> void:
	# الحالة 2: زرار السكب
	go_to_loading()
