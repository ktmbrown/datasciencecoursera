#Tic Tac Toe game in python
from tik import *
import turtle

board = [' ' for x in range(10)]
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
        elif yclick <= 100 and yclick > -100:
            print('Section 4')
            printX(-300,-100)
        else:
            print('Section 7')
            printX(-300,-300)
    elif xclick <= 100 and xclick > -100:
        if yclick > 100:
            print('Section 2')
            printX(-100,100)
        elif yclick <= 100 and yclick > -100:
            print('Section 5')
            printO(-100,-100)
        else:
            print('Section 8')
            printX(-100,-300)
    else:
        if yclick > 100:
            print('Section 3')
            printX(100,100)
        elif yclick <= 100 and yclick > -100:
            print('Section 6')
            printX(100,-100)
        else:
            print('Section 9')
            printO(100,-300)

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

def insertLetter(letter, pos):
    board[pos] = letter

def spaceIsFree(pos):
    return board[pos] == ' '
    
def isWinner(bo, le):
    return (bo[7] == le and bo[8] == le and bo[9] == le) or (bo[4] == le and bo[5] == le and bo[6] == le) or(bo[1] == le and bo[2] == le and bo[3] == le) or(bo[1] == le and bo[4] == le and bo[7] == le) or(bo[2] == le and bo[5] == le and bo[8] == le) or(bo[3] == le and bo[6] == le and bo[9] == le) or(bo[1] == le and bo[5] == le and bo[9] == le) or(bo[3] == le and bo[5] == le and bo[7] == le)

def playerMove():
    getcoordinates()
##    run = True
##    while run:
##        move = input('Please select a position to place an \'X\' (1-9): ')
##        try:
##            move = int(move)
##            if move > 0 and move < 10:
##                if spaceIsFree(move):
##                    run = False
##                    insertLetter('X', move)
##                else:
##                    print('Sorry, this space is occupied!')
##            else:
##                print('Please type a number within the range!')
##        except:
##            print('Please type a number!')
            

def compMove():
    possibleMoves = [x for x, letter in enumerate(board) if letter == ' ' and x != 0]
    move = 0

    for let in ['O', 'X']:
        for i in possibleMoves:
            boardCopy = board[:]
            boardCopy[i] = let
            if isWinner(boardCopy, let):
                move = i
                return move

    cornersOpen = []
    for i in possibleMoves:
        if i in [1,3,7,9]:
            cornersOpen.append(i)
            
    if len(cornersOpen) > 0:
        move = selectRandom(cornersOpen)
        return move

    if 5 in possibleMoves:
        move = 5
        return move

    edgesOpen = []
    for i in possibleMoves:
        if i in [2,4,6,8]:
            edgesOpen.append(i)
            
    if len(edgesOpen) > 0:
        move = selectRandom(edgesOpen)
        
    return move

def selectRandom(li):
    import random
    ln = len(li)
    r = random.randrange(0,ln)
    return li[r]
    

def isBoardFull(board):
    if board.count(' ') > 1:
        return False
    else:
        return True



def main():
    print('Welcome to Tic Tac Toe!')
    turtle.setup(600,600)
    wn = turtle.Screen()
    wn.bgcolor("lightblue")
    drawBoard()

    xclick = 0
    yclick = 0

    while not(isBoardFull(board)):
        if not(isWinner(board, 'O')):
            playerMove()
        else:
            print('Sorry, O\'s won this time!')
            break

        if not(isWinner(board, 'X')):
            move = compMove()
            if move == 0:
                print('Tie Game!')
            else:
                insertLetter('O', move)
                print('Computer placed an \'O\' in position', move , ':')
                printBoard(board)
        else:
            print('X\'s won this time! Good Job!')
            break

    if isBoardFull(board):
        print('Tie Game!')

main()
