
extends MarginContainer

onready var character_texture_player_one: TextureRect = get_node("TextureRect/player_one")
onready var character_texture_player_two: TextureRect = get_node("TextureRect/player_two")





func _physics_process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		change_scene()
	
	if (Input.is_action_just_pressed("Izq2")):
		_on_left_player_one_pressed()
		
	if (Input.is_action_just_pressed("Der2")):
		_on_right_player_one_pressed()
	
	if (Input.is_action_just_pressed("Izq1")):
		_on_left_player_two_pressed()
		
	if (Input.is_action_just_pressed("Der1")):
		_on_right_player_two_pressed()
	
		
		
func  change_scene():
	get_tree(). change_scene("res://scene/main.tscn")



func _on_left_player_one_pressed():
	if Game.texture_player_one<2:
		Game.texture_player_one=4
		character_texture_player_one.texture = load("res://scene/characterSelector/dino_" + str(Game.texture_player_one) +".tres")
	else:
		Game.texture_player_one -= 1
		character_texture_player_one.texture = load("res://scene/characterSelector/dino_" + str(Game.texture_player_one) +".tres")



func _on_right_player_one_pressed():
	if Game.texture_player_one>3:
		Game.texture_player_one=1
		character_texture_player_one.texture = load("res://scene/characterSelector/dino_" + str(Game.texture_player_one) +".tres")
	else:
	   Game.texture_player_one += 1
	   character_texture_player_one.texture = load("res://scene/characterSelector/dino_" + str(Game.texture_player_one) +".tres")


func _on_left_player_two_pressed():
	if Game.texture_player_two<2:
		Game.texture_player_two=4
		character_texture_player_two.texture = load("res://scene/characterSelector/dino_" + str(Game.texture_player_two) +".tres")
	else:
		Game.texture_player_two -= 1
		character_texture_player_two.texture = load("res://scene/characterSelector/dino_" + str(Game.texture_player_two) +".tres")
		


func _on_right_player_two_pressed():
	if Game.texture_player_two>3:
		Game.texture_player_two=1
		character_texture_player_two.texture = load("res://scene/characterSelector/dino_" + str(Game.texture_player_two) +".tres")
	else:
		Game.texture_player_two += 1
		character_texture_player_two.texture = load("res://scene/characterSelector/dino_" + str(Game.texture_player_two) +".tres")
	



