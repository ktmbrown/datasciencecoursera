import turtle

xclick = 0
yclick = 0

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
        elif yclick <= 100 and yclick > -100:
            print('Section 4')
        else:
            print('Section 7')
    elif xclick <= 100 and xclick > -100:
        if yclick > 100:
            print('Section 2')
        elif yclick <= 100 and yclick > -100:
            print('Section 5')
        else:
            print('Section 8')
    else:
        if yclick > 100:
            print('Section 3')
        elif yclick <= 100 and yclick > -100:
            print('Section 6')
        else:
            print('Section 9')

getcoordinates()

