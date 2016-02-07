# Synchronized-Traffic-System
Introduction:
Simulate traffic by moving cars based on the distance between them and the traffic light, and the distance between it and the next car. The cars will move as a function v velocity of distance over time. Separately, the traffic lights were simulated using setlights function. The cars will stop at a red light and move at a green light. We varied the permutation of red and green lights in three ways, varying the setlights function: synchronized, wave, and random. 
Synchronized Traffic System:
All the lights will turn red for tred seconds and then return to green for tgreen seconds. This will result in cars ‘gathering’ or ‘grouping’ at the end of the block as the first car at the block waits for the light to turn green.

Wave Green Lighting System:
Initially half the lights will start green and the other half red in the order of 3R, 3G, 3R, 1G. There is a wave of three red lights and three green lights moving in 1 unit to the left for each change in light, until they reach the end (when the pattern of the three red lights followed by 3 green lights disappears, until the pattern repeats again on the last block). If a block has the sequence of 3R and 3G “pass through” as they “move” in a sequence to the left, its traffic light then returns to original setup for which the first light returns to red light.

