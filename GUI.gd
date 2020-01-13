extends NinePatchRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	region_rect.position.x = get_viewport().size.x * 240/1080
	region_rect.position.y = get_viewport().size.y * 400/1920
	region_rect.size.x = get_viewport().size.x 
	region_rect.size.y = get_viewport().size.y 
	
	 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
