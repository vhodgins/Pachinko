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
var direct = 0
var was = false
var pause = -1
var old = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	translation.z = 0
	direction.z = 0
	print(get_viewport().size.x)
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
	if collision and not was:
		if sqrt(pow(direction.y,2)+pow(direction.z,2)) > 1:
			score += sqrt(pow(direction.y,2)+pow(direction.z,2))
		
			direction.y -= .04 - ((translation.y/4000) if translation.y < 0 else 0 ) 
#		if abs(translation.z) < 1.80:
		direction =.5* direction.bounce(collision.normal)
#		else:
#			direction.z = -.5*direction.z
	if collision and was:
		direction.z = -.5*direction.z
	
	if Input.is_action_pressed("ui_up"):
			get_tree().reload_current_scene()
	if not dead:
		if Input.is_action_pressed("ui_left"):
			direction.z -= .1
			
		elif Input.is_action_pressed("ui_right"):
			direction.z += .1
		
		elif Input.is_action_pressed("ui_accept"):
			direction.y = 2
		
	if Input.is_action_pressed("ui_select"):
		if get_viewport().get_mouse_position().y > get_viewport().size.y / 5:
			if get_viewport().get_mouse_position().x < 1078/2:
				direction.z -= .1
				print(round(get_viewport().get_mouse_position().x))
			else: 
				direction.z += .1
				print(round(get_viewport().get_mouse_position().x))
#		else: 
#			get_tree().reload_current_scene()
		
#		direction.z += direct
		
		
		
		
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


#func _on_Left_pressed():
#	direct = -.1 # Replace with function body.
#
#
#func _on_Right_pressed():
#	direct = .1 # Replace with function body.
#
#
#func _on_Left_released():
#	direct = 0 # Replace with function body.
#
#
#func _on_Right_released():
#	direct = 0 # Replace with function body.



		 # Replace with function body.


func _on_TouchScreenButton_pressed():
	get_tree().reload_current_scene() # Replace with function body.


func _on_TouchScreenButton2_released():
	pause *= -1
	if pause ==1 : 
		old = direction
		direction = Vector3(0,0,0)
	if pause == -1:
		direction = old
		old = Vector3(0,0,0)
		
