ProjectsHome=:> (<1 1){UserFolders_j_
load ProjectsHome,'/JPaint/coordinateStack.ijs'

NB. wrapper wrap wrappee
wrap=:([ , ,~)

NB. wrapper amendWrap wrappee
amendWrap =: 4 : 0
  x (0,(_1+#y))} y
)

NB. width newCanvas height
newCanvas=:('-'&amendWrap)@:((2 + ,~) $ ('|'&wrap)@:([ # '.'"1))

NB. canvas drawer character
drawer =: 2 : 0
  n ((<"1)y)} m
)

NB. min range max
range=:((_1: + [) }. >:@:i.@:])

NB. x verticalLine startY;endY
verticalLine =: ([ (,"0)~ ({. range {:)@:])

NB. y horizontalLine startX;endX
horizontalLine =:([ (,"0) ({. range {:)@:])

NB. sideLength square topLeftPosition
square =: 4 : 0
  sideLength=.x
  ('x';'y')=.y
  leftSide=.  x                 verticalLine y,_1+y+sideLength
  rightSide=. (_1+x+sideLength) verticalLine y,_1+y+sideLength
  topSide=.   y                 horizontalLine x,_1+x+sideLength
  bottomSide=.(_1+y+sideLength) horizontalLine x,_1+x+sideLength
  leftSide,rightSide,topSide,bottomSide
)

NB. canvas canvasCharAt position
canvasCharAt=:((<"1)@:] { [)

NB. canvas colourMatchingNeighbours character;position
colourMatchingNeighbours =: 4 : 0
  ('c';'p')=.y
  offsets=.(_1 0 , 0 _1 , 0 1 ,: 1 0)
  offsetPoints=.p(+"1)offsets
  (c=x&canvasCharAt offsetPoints) # offsetPoints
)

NB. canvas fill character;position
fill =: 4 : 0
  ('newc';'p')=.y
  oldc=.x canvasCharAt p
  copyCanvas=.x
  searchStack=.stackNew p
  while. stackNotEmpty searchStack do.
    ('currentPos';'searchStack')=.stackPop searchStack
    copyCanvas=.(copyCanvas drawer newc) currentPos
    neighbours=.copyCanvas colourMatchingNeighbours oldc;currentPos
    searchStack=.searchStack stackAdd neighbours
  end.
  copyCanvas
)


