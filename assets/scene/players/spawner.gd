extends Node2D
export (PackedScene) var scene
onready var timer = $Timer


func _ready():
	timer.connect("timeout",self,"spawn")
	
	
func spawn():
	var instance = scene.instance()
	instance.rotation = -PI/2
	get_parent().add_child(instance)
	instance.global_position = global_position
	

