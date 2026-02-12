class CircularBuffer:
    def __init__(self, max_size):
        self.max_size = max_size
        self.list = []
        
    def __add__(self, item):
        if isinstance(item, str):
            if (len(self.list) == self.max_size):
                result =  self.list.pop(0)
                return result
                
        