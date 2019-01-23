import random
random.seed()

board = [0,1,2,
         3,4,5,
         6,7,8]

def show():
    print(board[0],'|',board[1],'|',board[2])
    print('---------')
    print(board[3],'|',board[4],'|',board[5])
    print('---------')
    print(board[6],'|',board[7],'|',board[8])

def check():
    for each in board:
        if each != 'x' and each != 'o':
            inPlay = True
            break
        else:
            inPlay = False

def computerTurn():
    compTurn = True
    while compTurn:
        opponent = random.randint(0,8)
        if board[opponent] != 'x' and board[opponent] != 'o':
            board[opponent] = 'o'
            check()
            compTurn = False

def playerTurn():
    userTurn = True
    while userTurn:
        turn = input("Select a spot: ")
        turn = int(turn)
        if board[turn] != 'x' and board[turn] != 'o':
            board[turn] = 'x'
            check()
            userTurn = False
        else:
            print("Spot taken. Try again.")

inPlay = True

while inPlay:
    show()
    playerTurn()
    computerTurn()

print('Game is over. Exiting...')
