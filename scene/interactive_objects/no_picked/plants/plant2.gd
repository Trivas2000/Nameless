extends StaticBody2D
#export (PackedScene) var scene

var scene = preload("res://scene/interactive_objects/no_picked/plants/bullet3.tscn")
onready var timer = $Timer

onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
var vidas =3

var timer2 := Timer.new()
 

func _ready():
	anim_tree.active=true  
	
	timer.connect("timeout",self,"spawn")
	#timer.set_paused(0.35)
			
func _physics_process(delta):
	for object in $Area_attacked.get_overlapping_areas():
		if object is Espada:
			vidas =vidas -1
		if vidas==0:
			self.queue_free()
			
func spawn():
	var instance = scene.instance()
	instance.rotation = PI
	get_parent().add_child(instance)
	instance.global_position = global_position
	#print("bala enviada")
	


