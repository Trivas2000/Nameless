extends RigidBody2D

var picked=false;
#onready var pos_player = get_node("../../players/player/Position2D").global_position;
func _ready():
	add_to_group("objects_pickeable")


#add an action to this object
func use():
	print("Apretdo la llave")
