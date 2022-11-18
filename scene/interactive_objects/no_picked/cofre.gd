extends StaticBody2D

onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
onready var hiden_object = $blackBook
export (PackedScene) var book 

var used = false;
var picked=true;
#onready var pos_player = get_node("../../players/player/Position2D").global_position;

func _ready():
	add_to_group("objects_not_pickeable")
	anim_tree.active=true


func _physics_process(delta):
	if (used == false):

		playback.travel("close")
	else:
		playback.travel("stay_open")

#add an action to this object
func use():
	if (used == false):

		used = true;
		playback.travel("open")
		if (book):
			var instance = book.instance()
			get_parent().add_child(instance)
			instance.global_position = global_position+Vector2.UP*3
