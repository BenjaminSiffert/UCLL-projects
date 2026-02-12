class Money:
    def __init__(self, amount, currency):
        self.amount = amount
        self.currency = currency
        
    def __add__(self, other):
        if isinstance(other, Money):
            if(other.currency == self.currency):
                result = self.amount + other.amount
                return Money(result,self.currency)
            else:
                raise RuntimeError("Currency types do not match")
            
        else:
            raise RuntimeError("object types do not match")
    def __sub__(self, other):
        if isinstance(other, Money):
            if(other.currency == self.currency):
                result = self.amount - other.amount
                return Money(result, self.currency)
            else:
                raise RuntimeError("Currency types do not match")
            
        else:
            raise RuntimeError("object types do not match")
    def __mul__(self, factor):
        if isinstance(factor, int) or isinstance(factor, float):
            result = self.amount * factor
            return Money(result, self.currency)
        else:
            raise RuntimeError("object types do not match")

