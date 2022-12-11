extends StaticBody2D

#export (PackedScene) var scene

var scene = preload("res://scene/interactive_objects/no_picked/plants/bullet3.tscn")
onready var timer = $Timer
onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")

 

func _ready():
	anim_tree.active=true  
	timer.connect("timeout",self,"spawn")


func spawn():
	var instance = scene.instance()
	get_parent().add_child(instance)
	instance.global_position = global_position

	


