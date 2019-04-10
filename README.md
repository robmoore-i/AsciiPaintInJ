# Ascii Paint in J

All the things it does in one line

```
((((10 newCanvas 10) drawer 'o' 6 square 2 4) drawer 'x' 5 verticalLine 2 7) drawer 's' 7 horizontalLine 1 9) fill '#';5 3
```

- Make a blank canvas

- Lines

- Squares

- 4-connected boundary fill

#### Example of using a conjunction closure to make the infix positional argument constraint an enabling one

Rather than implement 'draw' as a verb directly, using 3 parameters,
a canvas, a colour and a point, I've got a conjunction called 'drawer'
which takes a canvas and a colour as parameters to become an instance of
a monadic function taking a set of points to draw on the internally held
canvas with the internally held colour. It's basically just a closure,
but I want it specifically for the way it helps to deal with the infix
positional arguments constraint, and perhaps even makes it an enabling
constraint for composing a program from components of smaller parts.
