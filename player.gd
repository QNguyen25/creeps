extends Area2D

@export var speed = 400
var screen_size
signal hit

func _ready():
	#hide()
	screen_size = get_viewport_rect().size
	
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.set_deferred("disabled", false)
	
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move right"):
		velocity.x += 1
	if Input.is_action_pressed("move left"):
		velocity.x -= 1
	if Input.is_action_pressed("move up"):
		velocity.y -= 1
	if Input.is_action_pressed("move down"):
		velocity.y += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x !=0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
		
	if velocity.y !=0:
		$AnimatedSprite2D.animation = "up"
		#$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_v = velocity.y > 0
		
		
		
func _on_body_entered(body):
	hit.emit()
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	print("I was hit")
