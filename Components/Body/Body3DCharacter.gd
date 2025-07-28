@tool
class_name Body3DCharacter extends Body

func get_collision_object() -> CollisionObject3D: return %CharacterBody3D

func get_navigation_agent() -> NavigationAgent3D: return %NavigationAgent3D

func _get_configuration_warnings() -> PackedStringArray: return super()

func _get_configuration_requirements() -> Array[Variant]: return []
