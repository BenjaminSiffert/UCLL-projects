# INHERITANCE HIERARCHY
There is no limit to how deeply we can nest an inheritance tree. For example, a `Cat` can inherit from an `Animal` that inherits from `LivingThing`. That said, we should always be careful that each time we inherit from a base class the child is a strict subset of the parent. You should never think to yourself "my child's class needs a couple of the parent's methods, but not these other ones" and still decide to inherit from that parent.

