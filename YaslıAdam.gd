extends KinematicBody2D

var player = null

signal dialog(dialog_box)

func _on_Area2D_body_entered(body: Node) -> void:
	if body != self:
		player = body

func _on_Area2D_body_exited(body: Node) -> void:
	player = null




func _on_Dialogbox_script_changed() -> void:
	pass # Replace with function body.
