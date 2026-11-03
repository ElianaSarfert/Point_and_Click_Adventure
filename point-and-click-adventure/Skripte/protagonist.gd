extends AnimatedSprite2D


var destination = Vector2()
var distance = Vector2()
var snapPosition = Vector2()

var is_climbing : bool

var is_going_to_interact : bool
var interactable_object
var interaction_timer = 1
var interaction_animation : String

var path : PackedVector2Array = PackedVector2Array()

var speed = 250.0

var move_distance

enum State {IDLE, MOVE, CLIMB, INTERACT}

var state = State.IDLE

var margin = 1

func _ready() -> void:
	speed = 250.0
	change_state(State.IDLE)
	is_climbing = false
	destination = position


func _physics_process(delta: float) -> void:
	move_distance = speed * delta
	match state:
		State.IDLE:
			pass
		State.MOVE:
			move_along_path(move_distance)
		State.CLIMB:
			climb_along_path(move_distance)
		State.INTERACT:
			interact(delta)
	pass

func move_along_path(distance):
	if path.is_empty():
		change_state(State.IDLE)
		return
	while move_distance > 0.0 and not path.is_empty():
		var starting_point = global_position
		var next_point = path[0]

		# Sprite entsprechend der Laufrichtung spiegeln
		if starting_point.x < next_point.x:
			flip_h = false
		elif starting_point.x > next_point.x:
			flip_h = true

		var distance_to_next = starting_point.distance_to(next_point)

		if distance_to_next <= 0.001:
			path.remove_at(0)
			continue

		if move_distance < distance_to_next:
			global_position = starting_point.lerp(
				next_point,
				move_distance / distance_to_next
			)
			move_distance = 0.0
		else:
			global_position = next_point
			move_distance -= distance_to_next
			path.remove_at(0)

		if path.is_empty():
			change_state(State.IDLE)
		
		
		if(path.size() == 0):
			if(is_going_to_interact):
				change_state(State.INTERACT)
			else:
				change_state(State.IDLE)

func climb_along_path(distance):
	move_along_path(distance)

func interact(delta):
	interaction_timer -= delta
	if(interaction_timer <= 0):
		interaction_timer = 0.0
		change_state(State.IDLE)
		interaction_timer = 1

func set_path(new_path: PackedVector2Array) -> void:
	path = new_path.duplicate()

	if path.is_empty():
		change_state(State.IDLE)
	elif is_climbing:
		change_state(State.CLIMB)
	else:
		change_state(State.MOVE)

	
func change_state(newState):
	state = newState
	match state:
		State.IDLE:
			if(is_climbing):
				self.play("climb_idle")
			else:
				self.play("idle")
		State.MOVE: 
			self.play("move")
		State.CLIMB:
			play("climb")
		State.INTERACT:
			interaction_timer = 1.0
			interactable_object.interact()
			self.play(interaction_animation)
			print("interact yay")
