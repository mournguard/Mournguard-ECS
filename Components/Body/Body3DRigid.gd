@tool
class_name Body3DRigid extends Body

func get_collision_object() -> CollisionObject3D: return __(RigidBody3D)

func _get_configuration_warnings() -> PackedStringArray: return super()

func _get_configuration_requirements() -> Array[Variant]: return []
