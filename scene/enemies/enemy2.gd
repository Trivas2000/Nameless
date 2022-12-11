extends KinematicBody2D


var direction = Vector2.RIGHT
var velocity = Vector2.ZERO
var value = 2.5
onready var pivot= $Enemy2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = direction *2
	var collision := move_and_collide(velocity)
	if collision != null:
		direction *= -1
		value *=-1
		pivot.set_scale(Vector2(value,2.5))
		
	
	

