extends Area2D

export (Vector2) var zoom : Vector2 = Vector2.ONE

func _ready():
	connect("input_event",self,"on_input_event")


func on_input_event(viewport : Node, event : InputEvent, shapeIdx : int):
	if(event is InputEventMouseButton):
		if(event.button_index == BUTTON_LEFT and event.pressed):
			node_selected()


func node_selected():
	Globals.camera.push_camera_stack(position,zoom,self)
