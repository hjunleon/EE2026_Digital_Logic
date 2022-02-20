import imageio

def converttoHex(n):
    h1 = n % 16    
    h2 = n // 16 % 16

    return h2,h1

def convertoBin(n):

    res = []
    res1 = ''

    for i in range(4):
        b = str (n % 2)
        n = n // 2
        res.append(n)
        res1 = b + res1
    return(res1)

def create5bit(t):

    b2 = convertoBin(t[0])
    b1 = convertoBin(t[1])

    temp = b2+b1
    res = temp[0:5]
    return res 

def create6bit(t):

    b2 = convertoBin(t[0])
    b1 = convertoBin(t[1])

    temp = b2+b1
    res = temp[0:6]
    return res 


# a = 255
# print( create5bit(converttoHex(a)) )
# print( create6bit(converttoHex(a)) )

# print(converttoHex(8))
# print(convertoBin(1))
# print(create5bit((15,15)))


def image_text(filename):
    pic = imageio.imread(filename)
    h = len(pic)
    w = len(pic[0])
    pix = 0

    res=[]
    res.append('always@(a)begin')
    res.append('case(a)')
    

    for i in range(h):
        for j in range(w):
            R = create5bit(converttoHex(pic[i][j][0]))
            G = create6bit(converttoHex(pic[i][j][1]))
            B = create5bit(converttoHex(pic[i][j][2]))
            res.append(str(pix)+ " : spo = 16'b"+ R + G + B +';')
            pix += 1
    

    res.append('endcase')
    res.append('end')

    out= open(fileName + '.txt','w') # the output file name
    for line in res:
        # write line to output file
        out.write(line)
        out.write("\n")

fileName = "tryingSmall.png"
image_text(fileName) # change the input image file here



