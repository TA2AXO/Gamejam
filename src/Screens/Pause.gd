extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var pause_title: Label = get_node("PauseOverlay/Label")

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")

func _on_PlayerData_player_died() -> void:
	self.paused = true
	pause_title.text = "Öldün"
	
	

func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
