extends Control

# 1. تعريف الـ 3 شاشات بتوعنا
@onready var video_player_1 = $VideoStreamPlayer
@onready var video_player_2 = $VideoStreamPlayer2
@onready var video_player_3 = $VideoStreamPlayer3

var current_kid = ""

func _ready():
	current_kid = ""
	# أول ما نفتح، نخفي كل الفيديوهات ونوقفها
	stop_and_hide_all()

# دالة صغيرة عشان تقفل وتخفي كله (عشان مفيش فيديوهين يشتغلوا فوق بعض)
func stop_and_hide_all():
	video_player_1.hide()
	video_player_1.stop()
	
	video_player_2.hide()
	video_player_2.stop()
	
	video_player_3.hide()
	video_player_3.stop()

# --- لما ندوس على الأطفال ---

func _on_btn_kid_1_pressed():
	current_kid = "KID_1"
	stop_and_hide_all() # نطفي الباقي
	video_player_1.show() # نظهر شاشة الولد الأول
	# حط مسار فيديو الطفل الأول هنا
	video_player_1.stream = load("res://Assets/videos/1.ogv") 
	video_player_1.play()

func _on_btn_kid_2_pressed():
	current_kid = "KID_2"
	stop_and_hide_all() # نطفي الباقي
	video_player_2.show() # نظهر شاشة الولد التاني
	# حط مسار فيديو الطفل التاني هنا
	video_player_2.stream = load("res://Assets/videos/2.ogv") 
	video_player_2.play()

func _on_btn_kid_3_pressed():
	current_kid = "KID_3"
	stop_and_hide_all() # نطفي الباقي
	video_player_3.show() # نظهر شاشة البنت الساحرة
	# حط مسار فيديو الطفل التالت هنا
	video_player_3.stream = load("res://Assets/videos/3.ogv") 
	video_player_3.play()


# --- لما ندوس على الشاشة عشان ندخل الليفل ---

func _on_btn_video_pressed():
	if current_kid == "":
		return
		
	GameManager.player_choice = current_kid
	stop_and_hide_all()
	
	# غيرنا المسار هنا لشاشة تحميل الأطفال الجديدة
	get_tree().change_scene_to_file("res://kids_loading.tscn")


func _on_btn_back_pressed() -> void:
# لو كان فيه فيديو شغال، نوقفه الأول عشان الصوت ميفضلش شغال واحنا بره
	stop_and_hide_all() 
	
	# الكود ده هيرجعك لشاشة اختيار الشخصية (الساحر أو الأطفال)
	get_tree().change_scene_to_file("res://character_select.tscn")
