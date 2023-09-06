import random
import json
import matplotlib.pyplot as plt

radius = 2
rangeX = (0, 50)
rangeY = (0, 50)
qty = 200  # or however many points you want

# Generate a set of all points within 200 of the origin, to be used as offsets later
# There's probably a more efficient way to do this.
deltas = set()
for x in range(-radius, radius+1):
    for y in range(-radius, radius+1):
        if x*x + y*y <= radius*radius:
            deltas.add((x,y))

i = 0
safe = {}
poison = {}

while i<qty:
    x = random.randrange(*rangeX)
    y = random.randrange(*rangeY)
    print("X: " + str(x) + " Y: " + str(y))
    if ((x * x + y * y) + y + x < 750):
        plt.plot(x,y,".", color='green')
        poison.update({x:y})
    else:
        plt.plot(x,y,".", color='red')
        safe.update({x:y})
    i += 1

plt.show()

json_object = json.dumps(safe, indent=4)
with open("safe.json", "w") as outfile:
    outfile.write(json_object)

json_object = json.dumps(poison, indent=4)
with open("poison.json", "w") as outfile:
    outfile.write(json_object)
