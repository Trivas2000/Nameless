extends MarginContainer

onready var play = $VBoxContainer/Play
onready var exit = $VBoxContainer/Exit
onready var credits = $VBoxContainer/Credits

func _ready():
	play.connect("pressed", self, "_on_play_press")
	credits.connect("pressed", self, "_on_credits_press")
	exit.connect("pressed", self, "_on_exit_press")

func _on_play_press():
	get_tree(). change_scene("res://scene/map1.tscn")


func _on_credits_press():
	get_tree(). change_scene("res://scene/credits.tscn")
	
func _on_exit_press():
	get_tree().quit()
