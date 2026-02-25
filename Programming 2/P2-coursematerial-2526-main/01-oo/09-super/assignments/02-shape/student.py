from abc import ABC, abstractmethod
from math import pi


class Shape(ABC):
    @property
    @abstractmethod
    def area(self):
        return self.get_width() * self.get_length()
    @property
    @abstractmethod
    def perimeter(self):
        return 2*(self.get_length() + self.get_width())
class Rectangle(Shape):
    def __init__(self, length, width):
        self._length = length
        self._width = width
        
    def get_length(self):
        return (self._length)
    def get_width(self):
        return self._width
    @property
    def area(self):
        return super().area
    @property
    def perimeter(self):
        return super().perimeter
    

class  Square(Rectangle):
    def __init__(self, side):
        self._side =  side
        self._length = side
        self._width = side

    
    def get_side(self):
        return self._side
    def area(self):
        return super().area
    def perimeter(self):
        return super().perimeter
class Ellipse(Shape):
    def __init__(self,  minor_radius, major_radius):
        self._minor_radius = minor_radius
        self._major_radius = major_radius
    def get_minor_radius(self):
        return self._minor_radius
    def get_major_radius(self):
        return self._major_radius
    def area(self):
        return(pi*(self.get_minor_radius() * self.get_major_radius()))
    def perimeter():
        raise ValueError("NotImplementedError")
class Circle(Ellipse):
    def __init__(self, radius):
        self._radius = radius
        self._major_radius = radius
        self._minor_radius = radius
        
    def get_radius(self):
            return self._radius
    def area(self):
        return (pi * (self.get_radius()*self.get_radius()))
    def perimeter(self):
        return (2 * pi * self.get_radius())
            
        
