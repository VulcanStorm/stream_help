extends Node

# Global variables that can be accessed by everything
var camera = null

# dictionary of levels available
var levels : Dictionary = {}

func _ready():
	levels["0"] = preload("res://levels/MainMenu.tscn")
	levels["1"] = preload("res://levels/Level1.tscn")
	levels["2"] = preload("res://levels/Level2.tscn")

func request_change_level(levelName : String):
	var scene = levels[levelName]
	get_tree().change_scene_to(scene)
