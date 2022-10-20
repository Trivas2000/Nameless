extends MarginContainer

onready var play = $VBoxContainer/Play
onready var exit = $VBoxContainer/Exit
onready var credits = $VBoxContainer/Credits
onready var fondo = $TextureRect

var timer=50

func _ready():
	play.connect("pressed", self, "_on_play_press")
	credits.connect("pressed", self, "_on_credits_press")
	exit.connect("pressed", self, "_on_exit_press")


func _physics_process(delta):
	timer= timer -1
	if timer <0:
		fondo.flip_h = !fondo.flip_h
		timer = 50
	
func _on_play_press():
	get_tree(). change_scene("res://scene/characterSelector/characterSelector.tscn")


func _on_credits_press():
	get_tree(). change_scene("res://scene/menu_scenes/credits.tscn")
	
func _on_exit_press():
	get_tree().quit()
