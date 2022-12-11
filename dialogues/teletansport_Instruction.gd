extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	
	
func _input(event):
	if event.is_action_pressed("tele_instruction"):
		visible =! visible
	
	
	
