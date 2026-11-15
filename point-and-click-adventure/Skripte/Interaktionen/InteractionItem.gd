extends Node

@onready var destination = get_node("Position2D").get_global_position()
@export var player_interaction_animation : String
@onready var info_box_position : Node2D = $BoxPosition2D
var interaction_type = "item"
@export var interaction_entry : String
@export var correct_item : String
@export var RIGHT : bool
var inventory
var interaction_box_message

func interact():
	var active_slot = inventory.get_node("InventoryContainer").active_slot
	var texture_name = ""
	
	if active_slot == null:
		print("Kein Inventar-Slot ausgewählt!")
		return
	else: 
		if active_slot.item.texture == null:
			print("Der ausgewählte Slot ist leer!")
			return
		var texture: Texture2D = active_slot.item.texture
		texture_name = texture.resource_path.get_file()
		for n in 4:
			texture_name = texture_name.erase(texture_name.length() - 1,1)
	
	print(texture_name)
	
	var interaction_message = ""
	
	if texture_name == correct_item:
		get_node("Sprite2D").get_node("AnimationPlayer").play("right_animation")
		inventory.get_node("InventoryContainer").remove_item()
	else:
		get_node("Sprite2D").get_node("AnimationPlayer").play("wrong_animation")
	
	if texture_name in ItemInteractionDescription.ItemInteractiionMessages[interaction_entry]:
		interaction_message = ItemInteractionDescription.ItemInteractiionMessages[interaction_entry][texture_name]
	else :
		interaction_message = ItemInteractionDescription.ItemInteractiionMessages[interaction_entry]["default"]
	
	interaction_box_message.set_info_text("[center]" + interaction_message + "[/center]")

	# UNVERÄNDERT, falls deine Funktion toggle() heißt
	interaction_box_message.toggle(true)
