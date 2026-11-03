extends Node

@onready var destination = get_node("Position2D").get_global_position()
@export var interaction_animation : String
var interaction_type = "empty"

func interact():
	print("I AM INTERACTING")
	get_node("Sprite2D").get_node("AnimationPlayer").play("interact")
