extends Button


var open_texture = preload("res://Assets/Dummy/Inventar/BackPackOpen.png")
var closed_texture = preload("res://Assets/Dummy/Inventar/BackPackClosed.png")


func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		icon = open_texture
	else:
		icon = closed_texture
