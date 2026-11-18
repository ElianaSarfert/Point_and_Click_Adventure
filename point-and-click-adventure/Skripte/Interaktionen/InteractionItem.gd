extends Node

@onready var destination = get_node("Position2D").get_global_position()
@export var player_interaction_animation : String
@onready var info_box_position : Node2D = $BoxPosition2D
var interaction_type = "item"
@export var interaction_entry : String
@export var correct_item : StringName
@export var RIGHT : bool
var inventory
var interaction_box_message

func interact():
	var active_slot = inventory.get_node("InventoryContainer").active_slot
	var interaction_item_id = ""
	
	if active_slot == null:
		print("Kein Inventar-Slot ausgewählt!")
		return
	else: 
		if Globals.inventory_content.get(active_slot.get_index()) == null:
			print("Der ausgewählte Slot ist leer!")
			return
		interaction_item_id = Globals.inventory_content.get(active_slot.get_index()).item_id
	
	print(interaction_item_id)
	
	var interaction_message = ""
	
	print(correct_item)
	
	if interaction_item_id == correct_item:
		get_node("Sprite2D").get_node("AnimationPlayer").play("right_animation")
		inventory.get_node("InventoryContainer").remove_item()
	else:
		get_node("Sprite2D").get_node("AnimationPlayer").play("wrong_animation")
	
	if interaction_item_id in ItemInteractionDescription.ItemInteractiionMessages[interaction_entry]:
		interaction_message = ItemInteractionDescription.ItemInteractiionMessages[interaction_entry][interaction_item_id]
	else :
		interaction_message = ItemInteractionDescription.ItemInteractiionMessages[interaction_entry]["default"]
	
	interaction_box_message.set_info_text("[center]" + interaction_message + "[/center]")

	# UNVERÄNDERT, falls deine Funktion toggle() heißt
	interaction_box_message.toggle(true)
