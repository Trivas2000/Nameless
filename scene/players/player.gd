extends KinematicBody2D
export (int) var speedx =10
export (int) var accelerationX =10
export var inputindex = 1
export var texture = 1
var SPEED=200

var canPick = true;
onready var pick_dino =$Pivot/Pick_dino
var picked;

var Black_book =preload("res://scene/interactive_objects/blackBook.tscn")


onready var sprite= $Pivot
onready var sprite_text = $Pivot/Sprite_one


onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
onready var blue_dino = preload("res://texturas/personaje/sheets/DinoSprites - doux.png")
onready var red_dino = preload("res://texturas/personaje/sheets/DinoSprites - mort.png")
onready var yellow_dino = preload("res://texturas/personaje/sheets/DinoSprites - tard.png")
onready var green_dino = preload("res://texturas/personaje/sheets/DinoSprites - vita.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if (inputindex == 1):
		texture = Game.texture_player_one
	
	if (inputindex == 2):
		texture = Game.texture_player_two
	
	anim_tree.active=true
	if  (texture == 1):
		sprite_text.set_texture(blue_dino)

	elif(texture == 2):
		sprite_text.set_texture(red_dino)

	elif(texture == 3):
		sprite_text.set_texture(yellow_dino)

	else:
		sprite_text.set_texture(green_dino)
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var movementp1:Vector2 = Input.get_vector("Izq"+str(inputindex),"Der"+str(inputindex),"Arriba"+str(inputindex),"Abajo"+str(inputindex))
	move_and_slide(movementp1*SPEED)
	if abs(movementp1.x)>0 or abs(movementp1.y)>0:
		playback.travel("run")
	else:
		playback.travel("idle")
	if movementp1.x<0:
		sprite.set_scale(Vector2(-1,1))
		if picked != null:
			picked.global_position =pick_dino.global_position
	if movementp1.x>0:
		sprite.set_scale(Vector2(1,1))
		if picked != null:
			picked.global_position =pick_dino.global_position
		
	if (Input.is_action_just_pressed("ui_pick"+str(inputindex))):	
		_pick_object()			


	
func _pick_object(): 
	if (canPick == false) :
		self.remove_child(picked)
		var black_book = Black_book.instance()
		get_parent().add_child(black_book)
		black_book.global_position =pick_dino.global_position
		canPick=true
	else :
		for body in $Detector.get_overlapping_bodies():
			if body.name=="blackBook" and canPick==true and body.picked == false:
				canPick = false
				body.picked = true
				#forma 2
				body.queue_free()
				picked = Black_book.instance()
				self.add_child(picked)
				picked.picked = true
				picked.global_position =pick_dino.global_position
		

				
