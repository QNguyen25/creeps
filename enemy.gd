extends RigidBody2D

@export var enemy_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	var enemy_types : Array = $AnimatedSprite2D.sprite_frames.get_animation_name()
	$AnimatedSprite2D.play(enemy_types[randi() % enemy_types.size()])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 
	
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
