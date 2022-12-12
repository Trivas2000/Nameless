extends MarginContainer
 
onready var main_menu =$"%MainMenu"
onready var exit = $"%Exit"




# Called when the node enters the scene tree for the first time.
func _ready(): 
	main_menu.connect("pressed",self, "on_main_menu_pressed")
	exit.connect("pressed",self, "on_exit_pressed")
	
	hide() 
	
	
func _input(event):
	if Game.show_winner==true:
		visible =! visible
		get_tree().paused = visible 
		
	
func on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scene/menu_scenes/menu.tscn")
	
func on_exit_pressed():
	get_tree().quit()
	
	
