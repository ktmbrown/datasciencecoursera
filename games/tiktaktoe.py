import turtle
from tik import *

turtle.setup(600,600)
wn = turtle.Screen()
wn.bgcolor("lightblue")
drawBoard()

xclick = 0
yclick = 0
board = ['empty',1,2,3,4,5,6,7,8,9]

def getcoordinates():
    turtle.onscreenclick(modifyglobalvariables) # Here's the change!

def modifyglobalvariables(rawx,rawy):
    global xclick
    global yclick
    xclick = int(rawx//1)
    yclick = int(rawy//1)
    if xclick < -100:
        if yclick > 100:
            print('Section 1')
            printO(-300,100)
            board[1] = 'O'
        elif yclick <= 100 and yclick > -100:
            print('Section 4')
            board[4] = 'X'
        else:
            print('Section 7')
            printX(-300,-300)
            board[7] = 'X'
    elif xclick <= 100 and xclick > -100:
        if yclick > 100:
            print('Section 2')
            printX(-100,100)
            board[2] = 'X'
        elif yclick <= 100 and yclick > -100:
            print('Section 5')
            printO(-100,-100)
            board[5] = 'O'
        else:
            print('Section 8')
            printX(-100,-300)
            board[8] = 'X'
    else:
        if yclick > 100:
            print('Section 3')
            printX(100,100)
            board[3] = 'X'
        elif yclick <= 100 and yclick > -100:
            print('Section 6')
            printX(100,-100)
            board[6] = 'X'
        else:
            print('Section 9')
            printO(100,-300)
            board[9] = 'O'

def printX(x,y) :
    turtle.pensize(5)
    turtle.penup()
    turtle.goto(x+20,y+20)
    turtle.pendown()
    turtle.goto(x+180, y+180)
    turtle.penup()
    turtle.goto(x+20,y+180)
    turtle.pendown()
    turtle.goto(x+180,y+20)
    turtle.penup()
    turtle.goto(-320,320)
    turtle.done()

def printO(x,y) :
    turtle.pensize(5)
    turtle.penup()
    turtle.goto(x,y)
    turtle.goto(x+100,y+20)
    turtle.pendown()
    turtle.circle(80)
    turtle.penup()
    turtle.goto(-320,320)
    turtle.done()


getcoordinates()
