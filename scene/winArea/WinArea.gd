extends Area2D 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	for object in self.get_overlapping_areas():
		if object.is_in_group("players") :
			Game.show_winner=true 
