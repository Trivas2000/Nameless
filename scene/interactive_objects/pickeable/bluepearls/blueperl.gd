extends RigidBody2D

var is_picked=false;
var origin_position=Vector2(-445, -1247)

var picked_by;
#onready var pos_player = get_node("../../players/player/Position2D").global_position;



func _ready():
	#print(position)
	add_to_group("objects_pickeable")

#Al usarse debe mostrar en pantalla un mensaje
func use(): 
	picked_by.can_teletransport(0) 

	
	

func reaparecer():
	var cont=50
	while cont>0:
		cont= cont-1
	position = origin_position
	
