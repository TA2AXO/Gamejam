extends Control


func _on_YaslAdam_dialog(dialog_box : int) -> void:
	pass # Replace with function body.

var dialog = [
	'UZUN ZAMANDIR KENDİNDE DEĞİLDİN BÜYÜCÜ',
	'HAHAHHAHAHAAHAH',
	'HAH DOĞRUYA ZİHNİNİ PARÇALARA BÖLEN VE GÜÇLERİNİ ELİNDEN ALAN BÜYÜCÜNÜN YARATIKLARINDAN BİRİ BURADA,O YÜZDEN UYANMIŞ OLMALISIN',
	'BU KADAR UZUN ZAMANDIR BİRİKTİRDİĞİN GÜÇ BU ZİNDANDAN ÇIKMAK İÇİNDİ DEĞİL Mİ?',
	'HAHAHHAAHAHHAHAHA',
	'HAYDİ GİT NE BEKLİYORSUN ZİNDANIN SONUNDA Kİ O İĞRENÇ DOKUNAÇLI YARATIĞI ÖLDÜR VE BURADAN KAÇ!'
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()

func _process(delta):
	$nextindicator.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
