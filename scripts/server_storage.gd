extends Node


var dict_usernames: Dictionary = {}


@rpc ("any_peer", "call_remote")
func register_username(peer_id: int, username: String) -> void:
	dict_usernames[peer_id] = username
	print(dict_usernames)
	print(multiplayer.is_server())
