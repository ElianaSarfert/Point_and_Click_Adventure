
extends TextureRect

@onready var scroll_container: ScrollContainer = $ScrollContainer

const slot = preload("res://Skripte/UI/slot.gd")
var temp_item_texture = null
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

func _process(delta: float) -> void:
	if place_item:
		timer -= delta
		if timer <= 0:
			place_item = false
			timer = 0.1

func slot_gui_input(event: InputEvent, slot: Slot):
	if place_item:
		next_slot = slot
		if next_slot.item.get_texture() == null:
			current_slot.pickFromSlot()
			next_slot.putIntoSlot(temp_item_texture, false)
			temp_item_texture = null
			place_item = false
			active_slot = next_slot
			activateSlots(active_slot)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
			temp_item_texture = slot.item.get_texture()
			current_slot = slot
			movable_item.visible = true
			movable_item.get_node("Item").set_texture(temp_item_texture)
			var item_size = movable_item.get_node("Item").size
			movable_item.global_position = get_viewport().get_mouse_position() - item_size / 1
			current_slot.pickFromSlot()
		if event.button_index == MOUSE_BUTTON_LEFT && !event.pressed:
			movable_item.visible = false
			if temp_item_texture != null:
				current_slot.putIntoSlot(temp_item_texture, true)
				place_item = true
				active_slot = current_slot
				activateSlots(active_slot)

func _input(event):
	if movable_item.visible:
		var item_size = movable_item.get_node("Item").size
		movable_item.global_position = get_viewport().get_mouse_position() - item_size / 1

func activateSlots(slot):
	for h_slot in scroll_container.get_node("HBoxContainer").get_children():
		if h_slot == slot:
			h_slot.toggleActivation(true)
		else:
			h_slot.toggleActivation(false)

func _on_left_arrow_button_pressed() -> void:
	scroll_container.scroll_horizontal -= scroll_amount


func _on_right_arrow_button_pressed() -> void:
	scroll_container.scroll_horizontal += scroll_amount


func _on_back_pack_button_pressed() -> void:
	self.visible = !self.visible
