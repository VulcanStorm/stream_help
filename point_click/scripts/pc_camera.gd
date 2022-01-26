extends Camera2D

var node_stack : Array = []
var position_stack : Array = []
var zoom_stack : Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# add the starting location to the stack
	push_camera_stack(position,zoom,self)
	
	Globals.camera = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target_position = position_stack.back()
	var target_zoom = zoom_stack.back()
	
	position = position.linear_interpolate(target_position,delta*10)
	zoom = zoom.linear_interpolate(target_zoom,delta*10)


func push_camera_stack(p : Vector2, z : Vector2, n : Node2D):
	# check if this node is already on the top
	var top_item = node_stack.back()
	# don't do anything if it is
	if(top_item == n):
		return
	
	position_stack.push_back(p)
	zoom_stack.push_back(z)
	node_stack.push_back(n)


func pop_camera_stack():
	if(position_stack.size() > 1):
		var p_end = position_stack.size()-1
		position_stack.remove(p_end)
	
	if(zoom_stack.size() > 1):
		var z_end = zoom_stack.size() - 1
		zoom_stack.remove(z_end)
	
	if(node_stack.size() > 1):
		var n_end = node_stack.size() - 1
		node_stack.remove(n_end)


func clear_all_stacks():
	var needClear : bool = true
	while(needClear == true):
		# clear once
		pop_camera_stack()
		# check if we need to clear again!
		needClear = false
		if(position_stack.size() > 1):
			needClear = true
		if(zoom_stack.size() > 1):
			needClear = true
		if(node_stack.size() > 1):
			needClear = true
