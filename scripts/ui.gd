extends Control

@onready var center_container: CenterContainer = $CenterContainer
@onready var username: LineEdit = $CenterContainer/VBoxContainer/Username


func _on_server_pressed() -> void:
	Network.start_server()

func _on_client_pressed() -> void:
	Network.start_client(username.text)

func _on_sanity_check_pressed() -> void:
	_sanity_check.rpc("Hello there!")

@rpc("any_peer", "call_remote")
func _sanity_check(message: String):
	print("Message [%s] received on peer [%s], from peer [%s]." % 
		[message, 
		get_tree().get_multiplayer().get_unique_id(), 
		get_tree().get_multiplayer().get_remote_sender_id()])

func _ready() -> void:
	var viewport_size = get_viewport_rect().size
	center_container.size = viewport_size
