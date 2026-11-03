extends Node2D

@onready var nav2D : NavigationRegion2D = $NavigationRegion2D
@onready var line2D : Line2D = $Line2D
@onready var Player : AnimatedSprite2D = $Player
@onready var interaction_objects: Area2D = $InteractionObjects
@onready var card_info: Control = $UI/CardInfo


var navigation_map
enum{IDLE, MOVE, CLIMB, INTERACT}

func _input(event: InputEvent) -> void:
	if Player.state == Player.State.INTERACT:
		return
	if !Input.is_action_just_pressed("leftMouseClick"):
		return
	navigation_map = nav2D.get_navigation_map()
	
	Player.is_going_to_interact = false
	
	var new_path: PackedVector2Array = NavigationServer2D.map_get_path(
		navigation_map,
		Player.global_position,
		get_global_mouse_position(),
		true
		)
	line2D.clear_points()
	for point in new_path:
		line2D.add_point(line2D.to_local(point))
	
	if(!Player.is_climbing):
		Player.change_state(MOVE)
	else:
		Player.change_state(CLIMB)
	
	Player.set_path(new_path)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() != "PlayerBody":
		return
	Player.is_climbing = true
	if not Player.path.is_empty():
		Player.change_state(Player.State.CLIMB)



func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.get_name() != "PlayerBody":
		return
	Player.is_climbing = false
	if not Player.path.is_empty():
		Player.change_state(Player.State.MOVE)
	else: Player.change_state(Player.State.IDLE)


func _on_interaction_objects_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if !Input.is_action_just_pressed("leftMouseClick"):
		return
	if Player.state == Player.State.INTERACT:
		return
	Player.is_going_to_interact = true
	Player.interactable_object = interaction_objects.get_child(shape_idx)
	Player.interaction_animation = interaction_objects.get_child(shape_idx).interaction_animation
	
	var interaction_type = interaction_objects.get_child(shape_idx).interaction_type
	
	match interaction_type:
		"info": 
			interaction_objects.get_child(shape_idx).InfoCard = card_info
			card_info.set_info_text(
				interaction_objects.get_child(shape_idx).text
			)
			card_info.global_position = interaction_objects.get_child(shape_idx).card_position_2d.get_global_transform_with_canvas().origin
		
	
	
	var new_path: PackedVector2Array = NavigationServer2D.map_get_path(
		navigation_map,
		Player.global_position,
		interaction_objects.get_child(shape_idx).destination,
		true
		)
	Player.set_path(new_path)
