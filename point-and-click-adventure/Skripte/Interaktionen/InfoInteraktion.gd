extends Node

@onready var destination = get_node("Position2D").get_global_position()
@onready var card_position_2d: Node2D = $CardPosition2D
@export var interaction_animation : String
var interaction_type = "info"
@export var text = "lksfdgjoaipdjgioj daosjiogj oaijgioea jaeijgiaejg ioaje giopa jagijr gioae"
@export var RIGHT : bool
var InfoCard

func interact():
	print("I AM INTERACTING")
#	get_node("Sprite2D").get_node("AnimationPlayer").play("interact")
	InfoCard.toggle(true)
