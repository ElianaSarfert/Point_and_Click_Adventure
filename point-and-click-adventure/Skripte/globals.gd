extends Node


var inventory_content: Array[Item]
var inventory_size = 6
var collected_items: Array[StringName] = []


func _ready() -> void:
	Globals.inventory_content.resize(Globals.inventory_size)
