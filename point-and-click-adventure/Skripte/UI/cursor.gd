extends Node2D



@onready var cursor_default = preload("uid://bochetw428xb3")
@onready var cursor_info = preload("uid://27puqy36o2eu")
@onready var cursor_use = preload("uid://cbfm072nnxqon")
@onready var cursor_pick_hover = preload("uid://75udng8gpmyt")
@onready var cursor_pick_click = preload("uid://crlqpen1hvvyk")

@onready var cursor_sprite: Sprite2D = $Sprite2D


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _process(_delta):
	self.position = self.get_global_mouse_position()


func handle_mouse_interaction_hover(interaction_type):
	match interaction_type:
		"info":
			cursor_sprite.texture = cursor_info
			$AnimationPlayer.play("info_hover")
		"pickUp":
			cursor_sprite.texture = cursor_pick_hover
			$AnimationPlayer.play("pick_hover")
		"item":
			cursor_sprite.texture = cursor_use
			$AnimationPlayer.play("use_hover")

func handle_mouse_interaction_click(interaction_type):
	$AnimationPlayer.play("RESET")
	match interaction_type:
		"info":
			cursor_sprite.texture = null
		"pickUp":
			cursor_sprite.texture = cursor_pick_click
		"item":
			cursor_sprite.texture = null
			
func handle_mouse_interaction_exit():
	$AnimationPlayer.play("RESET")
	cursor_sprite.texture = cursor_default
