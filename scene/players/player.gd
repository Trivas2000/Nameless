extends KinematicBody2D
export (int) var speedx =10
export (int) var accelerationX =10
export var inputindex = 1
export var texture=1
var SPEED=200
var canPick = true;

onready var sprite= $Pivot
onready var sprite_text = $Pivot/Sprite

onready var anim_player= $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
onready var blue_dino = preload("res://texturas/personaje/sheets/DinoSprites - doux.png")
onready var red_dino = preload("res://texturas/personaje/sheets/DinoSprites - mort.png")
onready var yellow_dino = preload("res://texturas/personaje/sheets/DinoSprites - tard.png")
onready var green_dino = preload("res://texturas/personaje/sheets/DinoSprites - vita.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	
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
	if movementp1.x>0:
		sprite.set_scale(Vector2(1,1))
		
