class Line:

    def __init__(self,coor1,coor2):
        self.coor1=coor1
        self.coor2=coor2

    def distance(self):
        x1,x2=self.coor1
        y1,y2=self.coor2
        return ((x2**2-x1**2)+(y2**2-y1**2))**0.5
    def slope(self):
        x1,x2=self.coor1
        y1,y2=self.coor2
        return (y2-y1)/(x2-x1)

coordinate1 = (3,2)
coordinate2 = (8,10)

li = Line(coordinate1,coordinate2)


class Cylinder:

    pi=3.14
    def __init__(self,height=1,radius=1):
        self.height=height
        self.radius=radius

    def volume(self):
        return (self.pi*self.radius**2*self.height)
