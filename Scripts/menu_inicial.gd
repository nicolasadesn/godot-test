extends Control

@onready var startGame = $MarginContainer/HBoxContainer/VBoxContainer/StartGame as Button
@onready var exitGame = $MarginContainer/HBoxContainer/VBoxContainer/ExitGame as Button
var startLevel = preload("res://Scenes/level_1.tscn") as PackedScene


func _ready():
	startGame.button_down.connect(on_start_pressed)
	exitGame.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(startLevel)
	
func on_exit_pressed() -> void:
	get_tree().quit()

