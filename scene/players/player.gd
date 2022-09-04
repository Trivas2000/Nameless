extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speedx =10
export (int) var accelerationX =10

var SPEED=200
var accelerationY=0

onready var sprite= $Pivot
onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	anim_tree.active=true




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var movementp1:Vector2 = Input.get_vector("Izquierda","Derecha","Arriba","Abajo")
	move_and_slide(movementp1*SPEED)
	if abs(movementp1.x)>0 or abs(movementp1.y)>0:
		playback.travel("run")
	else:
		playback.travel("idle")
	if movementp1.x<0:
		sprite.set_scale(Vector2(-1,1))
	else:
		sprite.set_scale(Vector2(1,1))
