extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed",self,"on_button_pressed")
	pass # Replace with function body.

func on_button_pressed():
	Globals.camera.pop_camera_stack()
