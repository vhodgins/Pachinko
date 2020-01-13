extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var flag = false
var yspeed = 0
var vspeed = 0
var rspeed = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	translation.y = rand_range(-18, -2)
	translation.z = rand_range(-1.9,1.9)
	rotation.x = rand_range(-1,1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	 
	translation.y += yspeed
	translation.z += vspeed
	rotation.x += rspeed
	rspeed = rspeed*.95
	vspeed = vspeed*.95
	yspeed = yspeed*.95
	var dist = get_node("../../Ball").translation.y
	if (translation.y -dist) > 6 :
		translation.y = rand_range(dist-3.5, dist-20)
		translation.z = rand_range(-1.9,1.9)
		rotation.x = rand_range(-1,1)
		
		


	

func _on_enemy_body_entered(body):
	pass# Replace with function body.
