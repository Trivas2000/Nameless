extends RigidBody2D
var used=false
var is_picked=false;
var picked_by=null

#onready var pos_player = get_node("../../players/player/Position2D").global_position;
func _ready():
	add_to_group("objects_pickeable")

#add an action to this object
func use():
	pass
