extends Control

@onready var center_container: CenterContainer = $CenterContainer
@onready var username: LineEdit = $CenterContainer/VBoxContainer/Username


func _on_server_pressed() -> void:
	Network.start_server()


func _on_client_pressed() -> void:
	Network.start_client(username.text)


func _ready() -> void:
	var viewport_size = get_viewport_rect().size
	center_container.size = viewport_size
