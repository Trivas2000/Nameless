extends StaticBody2D

var picked=true;
onready var detector = $Detector

var water = preload("res://scene/interactive_objects/pickeable/conteiners/waterConteiner.tscn").instance()
#onready var pos_player = get_node("../../players/player/Position2D").global_position;

func _ready():
	add_to_group("objects_not_pickeable") 


func _physics_process(delta):
	pass

#add an action to this object
func use():
	for body in detector.get_overlapping_bodies():
		if body.is_in_group("container"):
			body.picked_by.picked =water
