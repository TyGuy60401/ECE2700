import random

my_str = """
1111    0110    1       10110
1111    0100    1       10100
0100    1100    1       10001
0011    0110    1       01010
1100    0001    1       01110
0110    0001    1       01000
0000    1101    0       01101
1000    1000    1       10001
0100    0011    0       00111
1100    0100    1       10001"""

lines = my_str.split('\n')
for line in lines:
    vals = line.split('\t')
    print(f"{int(vals[0])}")

for i in range(10):
    x = random.randint(0,15)
    y = random.randint(0,15)
    cin = random.randint(0,1)
    print(f"{x:04b}\t{y:04b}\t{cin:b}\t{x+y+cin:05b}")