@tool
class_name TypeAccessor extends Node

func __(property: Variant) -> Node: return NodeTools.get_first_child_of_type(self, property)
