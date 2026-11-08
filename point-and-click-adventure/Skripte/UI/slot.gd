class_name Slot extends Panel

@onready var item: TextureRect = $Item

var default_slot_texture = preload("res://Assets/Dummy/Inventar/Inventory_Slot.png")
var active_slot_texture = preload("res://Assets/Dummy/Inventar/Inventory_Slot_Active.png")

var default_style: StyleBoxTexture = null
var active_style: StyleBoxTexture = null


func _ready() -> void:
	default_style = StyleBoxTexture.new()
	active_style = StyleBoxTexture.new()
	default_style.texture = default_slot_texture
	active_style.texture  = active_slot_texture

func pickFromSlot():
	item.set_texture(null)

func putIntoSlot(new_texture, wait : bool):
	item.set_texture(new_texture)
	if wait:
		item.visible = false
		await(get_tree().create_timer(0.05))
		item.visible = true


func toggleActivation(activate: bool):
	if activate:
		add_theme_stylebox_override("panel", active_style)
	else:
		add_theme_stylebox_override("panel", default_style)
