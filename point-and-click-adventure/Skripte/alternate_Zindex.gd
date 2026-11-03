extends Node2D

@export var low_index : int
@export var high_index : int

@export var y_threshhold : float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(get_parent().get_parent().Player.position.y > y_threshhold):
		self.set_z_index(low_index)
	else:
		self.set_z_index(high_index)

pass
