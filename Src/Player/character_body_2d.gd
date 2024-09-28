extends CharacterBody2D


const SPEED = 50.0


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#velocity is the vector used in move_and_slide() function
	velocity = direction * SPEED 
	player_animations()
	
	move_and_slide()
	
func player_animations():
	#on left
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("move")
	
	#on right
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("move")
		
	if !Input.is_anything_pressed():
		$AnimatedSprite2D.play("idle")
		
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("forward")
		
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite2D.play("backwards")
		
		
