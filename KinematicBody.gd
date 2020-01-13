extends KinematicBody
var score = 0
var speed = 200
var velocity = Vector3()
var direction = Vector3()
var b = 0 
var flag = false 
var dead = false
var minimum = 10
var newitem 
var was = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	direction.z = rand_range(-.2,.2)
	translation.z = rand_range(-2,2)
	 # Replace with function body.
#func _input(event):
#   # Mouse in viewport coordinates
#	if event is InputEventMouseButton:
#		if event.position.x > get_viewport().size.x / 2 :
#			direction.z += .1
#		if event.position.x < get_viewport().size.x / 2 :
#			direction.z -= .1
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if translation.y < -5:
		translation.y = 5
	
	
	if dead == true: 
		direction.y*= .9
		direction.z*= .9

	if translation.y < 3 : 
		flag = true
	
	
	if self.is_on_floor():
		pass
	elif not dead: 
		direction.y -= .04 - ((translation.y/4000) if translation.y < 0 else 0 ) 
	
	var collision = move_and_collide(direction * delta)
	if collision and abs(translation.z) < 1.89 :
		if sqrt(pow(direction.y,2)+pow(direction.z,2)) > 1:
			score += sqrt(pow(direction.y,2)+pow(direction.z,2))
		if not was:
			direction.y -= .04 - ((translation.y/4000) if translation.y < 0 else 0 ) 
			direction =.5* direction.bounce(collision.normal)
		if was: 
			direction.y -= (.04 - ((translation.y/4000) if translation.y < 0 else 0 ) )
			direction =.5* direction.bounce(collision.normal)
			
		
	if abs(translation.z) > 1.89:
		direction.z *= -.5
	if Input.is_action_pressed("ui_up"):
			get_tree().reload_current_scene()
#	if not dead:
#		if Input.is_action_pressed("ui_left"):
#			direction.z -= .1
#
#		elif Input.is_action_pressed("ui_right"):
#			direction.z += .1
#
#		elif Input.is_action_pressed("ui_accept"):
#			direction.y = 2
		
#	if Input.is_action_pressed("ui_select"):
#		if get_viewport().get_mouse_position().y > get_viewport().size.y / 5:
#			if get_viewport().get_mouse_position().x < get_viewport().size.x/2:
#				direction.z -= .1
#			else: 
#				direction.z += .1
#		else: 
#			get_tree().reload_current_scene()
		
		
	move_and_slide(direction, Vector3(0,1,0))
		
	if translation.y > 9:
		translation.y = 8
		
		
	if self.is_on_wall():
		was = true
	else:
		was = false
	
	
	







func _on_enemy_body_entered(body):
	if body == self:
		dead = true
		for item in get_node("../EnemyWalls").get_children():
			if abs(item.translation.y - translation.y) < minimum:
				newitem = item
				minimum = abs(item.translation.y - translation.y)
		newitem.yspeed = direction.y / 25
		newitem.vspeed = direction.z / 25
		newitem.rspeed = rand_range(-.1,.1)
#		get_node("../GUI").visible = true
	  # Replace with function body.
