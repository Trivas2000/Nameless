extends StaticBody2D

# Declare member variables here. Examples:

onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")  

var vidas = 1
var used = false;
var picked=true;
#onready var pos_player = get_node("../../players/player/Position2D").global_position;

func _ready():
	add_to_group("objects_not_pickeable")
	anim_tree.active=true


func _physics_process(delta):
	for object in $DamageArea.get_overlapping_areas():
		if object is Espada:
			vidas =vidas -1
		if vidas==0:
			self.queue_free()
			

#add an action to this object
func use():
	pass
