extends Node

@onready var destination = get_node("Position2D").get_global_position()
@export var player_interaction_animation : String
var interaction_type = "interact"
@export var RIGHT : bool
@export var new_room : String


func interact():
	
	print("i am interacting pickup")
	#get_node("Sprite2D").get_node("AnimationPlayer").play("interact")
	get_tree().change_scene_to_file("res://Szenen/Räume/" + new_room + ".tscn")
	#get_tree().change_scene_to_file("res://Szenen/Räume/Szene_2.tscn")
