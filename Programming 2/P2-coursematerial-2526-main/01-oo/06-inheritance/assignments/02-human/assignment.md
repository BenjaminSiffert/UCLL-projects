## ASSIGNMENT
In Age of Dragons, all the archers in the game are humans, though not all humans are necessarily archers. The thing all humans have in common is that they need a name, so the `Human` class has taken care of the naming logic.

Now we need to write an `Archer` class. Archers are humans, and therefore need a name, but we don't want to re-write all that code! Let's just inherit the `Human` class!

Complete the `Archer` class. It should inherit from its parent. In its constructor it should call its parent's constructor, then also set its unique `__num_arrows` property.
