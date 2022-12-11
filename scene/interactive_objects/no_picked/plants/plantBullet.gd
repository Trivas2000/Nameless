extends Area2D

onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
var velocity = Vector2()
var speed = -200

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = speed*transform.x
	
	
	
	
	
func _physics_process(delta):
	position += velocity *delta
	
