extends RigidBody2D


# Declare member variables here. Examples:

onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")  

var used = false;
var picked=true;
#onready var pos_player = get_node("../../players/player/Position2D").global_position;

func _ready():
	add_to_group("objects_not_pickeable")
	anim_tree.active=true


func _physics_process(delta):
	pass

#add an action to this object
func use():
	pass
