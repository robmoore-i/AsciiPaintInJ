# Ascii Paint in J

## Summary

All the things you can ask this program to do, in one line:

```
((((10 newCanvas 10) drawer 'o' 6 square 2 4) drawer 'x' 5 verticalLine 2 7) drawer 's' 7 horizontalLine 1 9) fill '#';5 3
```

- Make a blank canvas

- Lines

- Squares

- 4-connected boundary fill

#### Example of using a conjunction closure to exploit the constraint of infix positional arguments

Rather than implement 'draw' as a verb directly, using 3 parameters, a canvas,
a colour and a point, I've got a conjunction called 'drawer' which takes a
canvas and a colour as parameters to become an instance of a monadic function
taking a set of points to draw on the internally held canvas with the
internally held colour. It's basically just a closure, but I want it
specifically for the way it helps to deal with the constraint of infix
positional arguments, and perhaps even makes it an enabling constraint for
composing a program from components of smaller parts.

## Coding problem that this is based on

This program is loosely based on this problem from an interview section used by
an unnamed scientific publisher which used to employ one of my sources close to
the prime minister.

#### Preamble

Below is a coding problem that we would like you to solve. Please read through
the description carefully and implement a solution for it. You're free to write
your solution in any programming language. We don't want you to over-engineer
the solution but be prepared to extend the functionality in the next step of
the interview process. Finally, we ask you to submit a solution that you'd be
happy to go live with and works "out of the box".

#### Problem Description

You are given the task of writing a simple console version of a drawing program.
At this time, the functionality of the program is quite limited, but this might
change in the future. In a nutshell, the program should work as follows:

1. create a new canvas
2. start drawing on the canvas by issuing various commands
3. quit

At the moment, the program should support the following commands:

 Command         | Description                                         
-----------------|-----------------------------------------------------
 `C w h`	     | Should create a new canvas of width w and height h.                  
 `L x1 y1 x2 y2` | Should create a new line from (x1,y1) to (x2,y2). Currently only horizontal or vertical lines are supported. Horizontal and vertical lines will be drawn using the 'x' character.
 `R x1 y1 x2 y2` | Should create a new rectangle, whose upper left corner is (x1,y1) and lower right corner is (x2,y2). Horizontal and vertical lines will be drawn using the 'x' character.             
 `B x y c`	     | Should fill the entire area connected to (x,y) with "colour" c. The behaviour of this is the same as that of the "bucket fill" tool in paint programs.                                           
 `Q`             | Should quit the program.                                          

#### Sample I/O

Below is a sample run of the program. User input is prefixed with `enter command:`.

    enter command: C 20 4
    ----------------------
    |                    |
    |                    |
    |                    |
    |                    |
    ----------------------
    
    enter command: L 1 2 6 2
    ----------------------
    |                    |
    |xxxxxx              |
    |                    |
    |                    |
    ----------------------
    
    enter command: L 6 3 6 4
    ----------------------
    |                    |
    |xxxxxx              |
    |     x              |
    |     x              |
    ----------------------
    
    enter command: R 16 1 20 3
    ----------------------
    |               xxxxx|
    |xxxxxx         x   x|
    |     x         xxxxx|
    |     x              |
    ----------------------
    
    enter command: B 10 3 o
    ----------------------
    |oooooooooooooooxxxxx|
    |xxxxxxooooooooox   x|
    |     xoooooooooxxxxx|
    |     xoooooooooooooo|
    ----------------------
    
    enter command: Q
