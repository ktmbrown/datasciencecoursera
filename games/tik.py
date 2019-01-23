import turtle

def drawBoard():

    drawVLine((-100,310),(-100,-310))
    drawVLine((100,310),(100,-310))
    drawHLine((-310,100),(310,100))
    drawHLine((-310,-100),(310,-100))

def drawVLine(start,stop):
    
    start_x, start_y = start
    stop_x, stop_y = stop
    line = turtle.Turtle()
    line.ht()
    line.pensize(3)
    line.penup()
    line.goto(start_x, start_y)
    line.pendown()
    line.right(90)
    line.goto(stop_x, stop_y)
    line.left(90)
    line.st()

def drawHLine(start,stop):
    start_x, start_y = start
    stop_x, stop_y = stop
    line = turtle.Turtle()
    line.ht()
    line.pensize(3)
    line.penup()
    line.goto(start_x, start_y)
    line.pendown()
    line.goto(stop_x, stop_y)
    line.st()

