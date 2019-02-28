# DTWSpells-MaxFunck
This is my spell project

## How to use this


Copy+Paste "Reiceive_Acc_26.hex" on the microbit which will be connected to the Macbook. 
Copy+Paste "writeXYZ.hex" on the microbit which will be attached to the wand.
Start the OSC transmition with "wand_to_osc.py"

Open wekinator, listen on local host port 8999 for 3 input signals. There is 1 output, which will be used through DTW with 4 cases. 

Start training spell 1 and spell 2 (Oculus Reparo and Alohomora). Any spell that can be differentiated is working. 
In addition, train the 4th case as a reference state - just have the wand laied down or not moving.



## Background Info

Goal: My goal is to be able to cast two spells using my magic wand (Spätzler) and two Microbits. As a reaction to the correctly casted spell, I want to see the relevant Harry Potter Scene from the Movie

Approach: The first Microbit records the acceleration in x, y and z axis on the tip of the Spätzler. Via radio, this information gets send to the other microbit who is connected to the computer. Wekinator uses this raw data to execute a DTW. The DTW is trained through 3 training spells (Alohomora, Occullus Reparus and no spell). It was quite hard to create reproducible spells. I have also tried to add a third real spell, which turned out to be really hard to differentiate.

Ideas for Improvement: Add more spells, add voice recognition, add a LED to the front of the wand for life feedback. Add a training modus with the spells appearing on the screen



Youtube: https://www.youtube.com/watch?v=3KRg3gRXqaE&feature=youtu.be

 
