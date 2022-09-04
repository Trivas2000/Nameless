extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speedx =10
export (int) var accelerationX =10

var SPEED=100
var accelerationY=0

onready var sprite= $Pivot

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var movementp1:Vector2 = Input.get_vector("Izquierda","Derecha","Arriba","Abajo")
	move_and_slide(movementp1*SPEED)

