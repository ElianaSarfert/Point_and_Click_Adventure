extends Node

@onready var destination = get_node("Position2D").get_global_position()
@export var player_interaction_animation : String
var interaction_type = "interact"
@export var RIGHT : bool


func interact():
	print("i am interacting pickup")
	get_node("Sprite2D").get_node("AnimationPlayer").play("interact")
