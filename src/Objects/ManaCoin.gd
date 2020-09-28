extends Area2D

export var manaadd: = 20

func _on_body_entered(body: Node) -> void:
	picked()

func picked() -> void:
	PlayerData.manaadd += manaadd
	queue_free()
