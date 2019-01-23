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
