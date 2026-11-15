
extends Control

@onready var rich_text_label: RichTextLabel = $VBoxContainer/RichTextLabel
@onready var sprite_2d: Sprite2D = $Sprite2D

# NEU: Referenz auf den AnimationPlayer
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer


# NEU: Referenz auf den Container
@onready var info_box_container: VBoxContainer = $VBoxContainer


signal close_dialog

# NEU: Tween-Referenz
var text_tween: Tween

# NEU: Verhindert, dass alte Timer eine neu geöffnete Box schließen
var display_id: int = 0


func _ready() -> void:
	clear()
	#info_box_container.modulate = Color(1, 1, 1, 0)


func toggle(show_box: bool) -> void:
	print("box interacted")

	if show_box:
		# NEU: Laufende Texteinblendung abbrechen
		if text_tween:
			text_tween.kill()

		# NEU: Vorherige Timer ungültig machen
		display_id += 1

		rich_text_label.visible = false
		visible = true

		# GEÄNDERT: Direkte AnimationPlayer-Referenz
		animation_player.play("fade_in")
	else:
		# NEU: Vorherige Timer ungültig machen
		display_id += 1

		clear()


func clear() -> void:
	# NEU: Laufenden Tween beenden
	if text_tween:
		text_tween.kill()

	visible = false

	# GEÄNDERT: text statt bbcode_text
	rich_text_label.text = ""
	rich_text_label.visible = false

	# NEU: Texteinblendung zurücksetzen
	rich_text_label.visible_ratio = 0.0


# GEÄNDERT: Godot-4-Signatur des AnimationPlayer-Signals
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("Animation beendet: ", anim_name)
	if anim_name == "fade_in":
		print("InfoBox Alpha: ", modulate.a)
		print("VBoxContainer Alpha: ", info_box_container.modulate.a)
		print("Text Alpha: ", rich_text_label.modulate.a)
		# GEÄNDERT: visible_ratio statt percent_visible
		rich_text_label.visible_ratio = 0.0
		rich_text_label.visible = true

		# GEÄNDERT: SceneTreeTween statt Tween-Node
		text_tween = create_tween()

		text_tween.tween_property(
			rich_text_label,
			"visible_ratio",
			1.0,
			0.7
		).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

		# NEU: Aktuellen Anzeigevorgang speichern
		var current_display_id = display_id

		# GEÄNDERT: await statt yield
		await get_tree().create_timer(5.0).timeout

		# NEU: Nur schließen, wenn es noch dieselbe Anzeige ist
		if current_display_id != display_id:
			return

		animation_player.play("fade_out")

	elif anim_name == "fade_out":
		visible = false

		# NEU: Signal beim Schließen auslösen
		close_dialog.emit()


func set_info_text(new_text: String) -> void:
	rich_text_label.bbcode_enabled = true
	rich_text_label.text = new_text
