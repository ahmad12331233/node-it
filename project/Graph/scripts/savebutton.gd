extends Button

func  _pressed():
	$"../../../../..".Fsave()
	Events.updateFileManagers.emit()
