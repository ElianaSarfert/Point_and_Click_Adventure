extends Node

@onready var destination = get_node("Position2D").get_global_position()
@export var player_interaction_animation : String
var interaction_type = "pickUp"
@onready var texture = get_node("Sprite2D").get_texture()
@export var item: Item
@export var RIGHT : bool
var inventory
@export var pickup_id: StringName

func _ready() -> void:
	if pickup_id in Globals.collected_items:
		queue_free()


func interact():
	print("i am interacting pickup")
	inventory.get_node("InventoryContainer").add_item(item)
	inventory.get_node("BackPackButton").button_pressed = true
	if pickup_id not in Globals.collected_items:
		Globals.collected_items.append(pickup_id)

	queue_free()
