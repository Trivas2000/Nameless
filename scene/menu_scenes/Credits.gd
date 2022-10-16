extends MarginContainer


onready var Back = $ScrollContainer/VBoxContainer/Back

func _ready():
	Back.connect("pressed", self, "_on_back_press")



func _on_back_press():
	get_tree(). change_scene("res://scene/menu_scenes/menu.tscn")
