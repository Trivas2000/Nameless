extends StaticBody2D



onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
onready var detector = $Detector_hurt

var apagando=false
var timer := Timer.new()
var damage=10


# Called when the node enters the scene tree for the first time.
func _ready():
	anim_tree.active=true 
	add_child(timer)
	timer.wait_time = 2.0
	timer.one_shot = true


func _physics_process(delta):
	detect_player ()

func detect_player ():
	for body in detector.get_overlapping_bodies():
		if body.is_in_group("players"):
			body.burning(damage)
			


func apagandose():
	playback.travel("Apagada")
	damage =3
	timer.start()
	timer.connect("timeout", self, "_on_timer_timeout")



func _on_timer_timeout() -> void:
	playback.travel("lava")
	damage=10
	
