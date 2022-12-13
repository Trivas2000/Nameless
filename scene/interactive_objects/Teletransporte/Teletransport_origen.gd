extends Area2D
# posicion es

# Called when the node enters the scene tree for the first time.
func _ready():
	print(global_position)
	
	
func _physics_process(delta):
	pass
	
func use(player): 
	player.global_position=Vector2(46,91)

