extends MarginContainer

onready var resume = $"%Resume"
onready var main_menu = $"%MainMenu"
onready var exit = $"%Exit"




# Called when the node enters the scene tree for the first time.
func _ready():
	resume.connect("pressed",self, "on_resume_pressed")
	main_menu.connect("pressed",self, "on_main_menu_pressed")
	exit.connect("pressed",self, "on_exit_pressed")
	
	hide()
	resume.grab_focus()
	
	
func _input(event):
	if event.is_action_pressed("menu"):
		visible =! visible
		get_tree().paused = visible 
		
	
func on_resume_pressed():
	hide()
	get_tree().paused = false
	
func on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scene/menu_scenes/menu.tscn")
	
func on_exit_pressed():
	get_tree().quit()
	
