extends RigidBody2D

var is_picked=false;
var origin_position=Vector2(-183, -1837)

var picked_by;
var cont=200;
#onready var pos_player = get_node("../../players/player/Position2D").global_position;



func _ready():

	add_to_group("objects_pickeable")

#Al usarse debe mostrar en pantalla un mensaje
func use(): 
	picked_by.can_teletransport(1) 
	self.queue_free()

func reaparecer():
	pass
