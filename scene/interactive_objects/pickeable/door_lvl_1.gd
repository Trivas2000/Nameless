extends StaticBody2D


onready var anim_player= $AnimationPlayer3
onready var detector = $Detector_door_1

var open = false;
var picked=true;
#onready var pos_player = get_node("../../players/player/Position2D").global_position;

func _ready():
	add_to_group("objects_not_pickeable")
	anim_player.play("close")


func _process(delta):
	if Game.door_first_level == true:
		anim_player.play("stay_open")
		$CollisionShape2D.disabled = true
		
