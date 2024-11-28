@tool
@icon("res://addons/Mournguard-ECS/Component/icon.png")
class_name Component extends Node

var E:Entity:
	get(): return get_parent()

func C(component: Variant): return E.C(component)

func _get_configuration_requirements(): return []

func _get_configuration_warnings():
	if not E or not E is Entity: return ["[Component] nodes are only valid as children of [Entity] nodes."]
	var warnings = []
	var reqs = _get_configuration_requirements()
	for req in reqs:
		var found = false
		for c in E.get_children():
			if is_instance_of(c, req):
				found = true
				break
		if found == false:
			warnings.append("Parent [Entity] missing required ["+str(req)+"] component.")
	return warnings
