extends Node

const SERVER_PORT: int = 42069


func start_server() -> void:
	var peer: ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	peer.create_server(SERVER_PORT)
	get_tree().get_multiplayer().multiplayer_peer = peer
	print("Server created!")


func start_client(host_ip: String = "localhost", host_port: int = SERVER_PORT) -> void:
	_setup_client_connection_signals()
	var peer: ENetMultiplayerPeer = ENetMultiplayerPeer.new()
	peer.create_client(host_ip, host_port)
	get_tree().get_multiplayer().multiplayer_peer = peer
	print("Client peer created!")

func _setup_client_connection_signals() -> void:
	if !get_tree().get_multiplayer().server_disconnected.is_connected(_server_disconnected):
		get_tree().get_multiplayer().server_disconnected.connect(_server_disconnected)

func _server_disconnected() -> void:
	print("Server disconnected")
	get_tree().get_multiplayer().multiplayer_peer = null
