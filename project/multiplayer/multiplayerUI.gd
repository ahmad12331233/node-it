extends Node


func host():
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(6059)
	print(error)
	owner.multiplayer.multiplayer_peer = peer
	var string = ""
	for a in IP.get_local_addresses():
		string += "/" + a
	OS.alert(string)
	

func join():
	var peer = ENetMultiplayerPeer.new()
	
	var error = peer.create_client($TextEdit.text,6059)
	OS.alert(String.num( error ))
	owner.multiplayer.multiplayer_peer = peer

@rpc("any_peer","call_local")
func kill():
	get_tree().quit()
	pass


func _on_button_pressed():
	Events.text_popup("hahahahha")
	#kill.rpc()
