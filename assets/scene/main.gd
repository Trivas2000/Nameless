extends Node2D



onready var camera1 = $Viewports/ViewportContainer1/Viewport1/Camera2D
onready var camera2 = $Viewports/ViewportContainer2/Viewport2/Camera2D
onready var map1 = $Viewports/ViewportContainer1/Viewport1/map1



func _ready():
	camera1.target = map1.get_node("TileMap3/player")
	camera2.target = map1.get_node("TileMap3/player2")
