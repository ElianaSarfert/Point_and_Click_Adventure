extends Node 
@onready var text: RichTextLabel = $RichTextLabel
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var text_tween: Tween

func _ready():
	clear()

func set_info_text(new_text: String) -> void:
	text.bbcode_enabled = true
	text.text = new_text

func toggle(show):
	print("card interacted")
	if(show):
		text.visible = false
		self.visible = true
		animated_sprite_2d.play("flip")
		animated_sprite_2d.set_frame_and_progress(0,0)
	else:
		self.visible = false

func clear():
	if text_tween and text_tween.is_running():
		text_tween.kill()
	
	self.visible = false
	text.clear()
	text.visible = false

func _on_animated_sprite_2d_animation_finished() -> void:
	text.visible = true
	text.visible_ratio = 0
	
	text_tween = create_tween()
	
	text_tween.tween_property(
		text,
		"visible_ratio",
		1.0,
		1.0
	).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
