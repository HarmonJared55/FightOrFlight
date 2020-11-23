extends Area2D


var posistion = Vector2()
var velocity = Vector2()
var rotation_speed = 5

export var speed = 10  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotation += deg2rad(rotation_speed)
	if Input.is_action_pressed("ui_left"):
		rotation -= deg2rad(rotation_speed)
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2(0,-speed).rotated(rotation)
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2()
	position += velocity * delta
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
