extends CharacterBody2D


var destination = Vector2()
var distance = Vector2()

@export var speed = 250

func _ready() -> void:
	destination = position


func _physics_process(delta: float) -> void:
	if(position != destination):
		distance = Vector2(destination - position)
		velocity.x = distance.normalized().x * speed
		velocity.y = distance.normalized().y * 0
		move_and_slide()
		
		if(destination.x > position.x):
			get_node("Player_Sprite").set.flip_h(false)
	pass



func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("leftMouseClick"):
		destination = get_global_mouse_position()
	
