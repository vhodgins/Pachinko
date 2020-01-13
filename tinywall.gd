extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	translation.y = rand_range(-20, -2)
	translation.z = rand_range(-1.9,1.9)
	if translation.z > 1.8:
		rotation.x = rand_range(-1,-.1)
	elif translation.z < 1.8:
		rotation.x = rand_range(.1,1)
	else: 
		rotation.x = rand_range(-1,1)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dist = get_node("../../Ball").translation.y
	if (translation.y -dist) > 6 :
		translation.y = rand_range(dist-3.5, dist-22)
		translation.z = rand_range(-1.9,1.9)
		if translation.z > 1.8:
			rotation.x = rand_range(-1,-.1)
		elif translation.z < 1.8:
			rotation.x = rand_range(.1,1)
		else: 
			rotation.x = rand_range(-1,1)

#func _on_Area_body_entered(body):
#	for wall in get_node("../").get_children():
#		wall.translation.y = rand_range(-10, 10)
#		wall.translation.z = rand_range(-1.57,1.57)
#		wall.rotation.x = rand_range(0,75) # Replace with function body.
