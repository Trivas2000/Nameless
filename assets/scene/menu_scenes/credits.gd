extends MarginContainer


onready var Back = $ScrollContainer/VBoxContainer/VBoxContainer/Back
onready var fondo = $TextureRect
var timer=50

func _ready():
	Back.connect("pressed", self, "_on_back_press")

func _physics_process(delta):
	timer= timer -1
	if timer <0:
		fondo.flip_h = !fondo.flip_h
		timer = 50

func _on_back_press():
	get_tree(). change_scene("res://scene/menu_scenes/menu.tscn")



