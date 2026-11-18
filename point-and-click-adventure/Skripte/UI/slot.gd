class_name Slot extends Panel

@onready var slot_content: TextureRect = $Item

var default_slot_texture = preload("res://Assets/Dummy/Inventar/Inventory_Slot.png")
var active_slot_texture = preload("res://Assets/Dummy/Inventar/Inventory_Slot_Active.png")

var default_style: StyleBoxTexture = null
var active_style: StyleBoxTexture = null

func _ready() -> void:
	default_style = StyleBoxTexture.new()
	active_style = StyleBoxTexture.new()
	default_style.texture = default_slot_texture
	active_style.texture  = active_slot_texture
	slot_content.visible = true

func pickFromSlot():
	Globals.inventory_content.set(self.get_index(), null)
	slot_content.set_texture(null)

func putIntoSlot(item : Item, wait : bool):
	slot_content.set_texture(item.item_texture)
	Globals.inventory_content.set(self.get_index(), item)
	if wait:
		slot_content.visible = false
		await(get_tree().create_timer(0.05))
		slot_content.visible = true


func toggleActivation(activate: bool):
	if activate:
		add_theme_stylebox_override("panel", active_style)
	else:
		add_theme_stylebox_override("panel", default_style)
