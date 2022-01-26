extends Area2D


export (String) var level_id : String = "0"

func _ready():
	connect("input_event",self,"on_input_event")


func on_input_event(viewport : Node, event : InputEvent, shapeIdx : int):
	if(event is InputEventMouseButton):
		if(event.button_index == BUTTON_LEFT and event.pressed):
			node_selected()

func node_selected():
	Globals.request_change_level(level_id)
