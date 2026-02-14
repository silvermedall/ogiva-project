extends Node

const IP_ADDRESS: String = "localhost"
const PORT: int = 42069
var peer: ENetMultiplayerPeer


func start_server() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	print(peer)


func start_client(username: String) -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer
	var a = ServerStorage.rpc_id(1, "register_username", peer.get_unique_id(), username)
	print(multiplayer.get_peers())
