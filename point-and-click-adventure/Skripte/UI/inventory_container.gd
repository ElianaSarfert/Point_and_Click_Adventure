
extends TextureRect

@onready var scroll_container: ScrollContainer = $ScrollContainer

const slot = preload("res://Skripte/UI/slot.gd")
var temp_item = null
var current_slot = null
var next_slot = null
var active_slot = null
var place_item = false
var timer = 0.1
@onready var movable_item: Node2D = $MovableItem

@export var scroll_amount: int = 200


func _ready() -> void:
	for h_slot in scroll_container.get_node("HBoxContainer").get_children():
		h_slot.gui_input.connect(slot_gui_input.bind(h_slot))
		var slot_id: int = get_slot_id(h_slot)
		
		if slot_id < Globals.inventory_content.size():
			var stored_item: Item = Globals.inventory_content[slot_id]
			
			if stored_item != null:
				h_slot.slot_content.texture = stored_item.item_texture
				h_slot.slot_content.visible = true

func _process(delta: float) -> void:
	if place_item:
		timer -= delta
		if timer <= 0: 
			place_item = false
			timer = 0.1

func slot_gui_input(event: InputEvent, slot: Slot):
	if place_item:
		next_slot = slot
		if Globals.inventory_content.get(get_slot_id(next_slot)) == null:
			current_slot.pickFromSlot()
			next_slot.putIntoSlot(temp_item, false)
			temp_item = null
			place_item = false
			active_slot = next_slot
			activateSlots(active_slot)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			temp_item = Globals.inventory_content.get(get_slot_id(slot))
			if temp_item == null:
				return
			current_slot = slot
			movable_item.visible = true
			movable_item.get_node("Item").set_texture(temp_item.item_texture)
			var item_size = movable_item.get_node("Item").size
			movable_item.global_position = get_viewport().get_mouse_position() - item_size / 1
			current_slot.pickFromSlot()
		if event.button_index == MOUSE_BUTTON_LEFT && !event.pressed:
			movable_item.visible = false
			if temp_item != null:
				current_slot.putIntoSlot(temp_item, true)
				place_item = true
				active_slot = current_slot
				activateSlots(active_slot)

func _input(event):
	if movable_item.visible:
		var item_size = movable_item.get_node("Item").size
		movable_item.global_position = get_viewport().get_mouse_position()

func activateSlots(slot):
	for h_slot in scroll_container.get_node("HBoxContainer").get_children():
		if h_slot == slot:
			h_slot.toggleActivation(true)
		else:
			h_slot.toggleActivation(false)

func add_item(item: Item):
	for h_slot in scroll_container.get_node("HBoxContainer").get_children():
		if Globals.inventory_content.get(get_slot_id(h_slot)) == null:
			h_slot.putIntoSlot(item, true)
			activateSlots(h_slot)
			active_slot = h_slot
			self.visible = true
			return

func remove_item():
	for h_slot in scroll_container.get_node("HBoxContainer").get_children():
		if h_slot == active_slot:
			h_slot.pickFromSlot()
			active_slot = null
			activateSlots(null)

func get_slot_id(slot: Slot):
	return slot.get_index()

func _on_left_arrow_button_pressed() -> void:
	scroll_container.scroll_horizontal -= scroll_amount


func _on_right_arrow_button_pressed() -> void:
	scroll_container.scroll_horizontal += scroll_amount


func _on_back_pack_button_pressed() -> void:
	self.visible = !self.visible
