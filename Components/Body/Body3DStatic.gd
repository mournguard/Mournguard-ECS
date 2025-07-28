@tool
class_name Body3DStatic extends Body

func get_collision_object() -> CollisionObject3D: return %StaticBody3D

func _get_configuration_warnings() -> PackedStringArray: return super()

func _get_configuration_requirements() -> Array[Variant]: return []
