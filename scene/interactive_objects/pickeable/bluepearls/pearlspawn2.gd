extends StaticBody2D



var espada = preload("res://scene/interactive_objects/pickeable/bluepearls/bluepearl2.tscn")

onready var detector = $Detector

 


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("objects_not_pickeable")


func _physics_process(delta):
	pass
	
	
	
func use():
	for body in detector.get_overlapping_bodies():
		if body.is_in_group("players"):
			add_child(espada.instance())
	

			
		
