extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text ="0"
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("../Ball").translation.y < 0:
		self.text = str((abs(round(get_node("../Ball").translation.y))+(round(get_node("../Ball").score*10)/10))*10)
