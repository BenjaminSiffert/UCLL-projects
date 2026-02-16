class Queue():
    def __init__(self):
        self.__items = []
    
    def add(self, item):
        self.__items.append(item)
    def is_empty(self):
        if len(self.__items) == 0:
            return (False)
        else:
            return (True)            
    def next(self):
        self.__items.pop(-1)
        new_list = self.get__items()
        print(new_list[-1] + " Is next!")
        return new_list[-1]
    def get__items(self):
        return self.__items
    def set__items(self, items):
        self.__items = items
        
queue = Queue()
print(queue.is_empty())
queue.add("jip")
queue.add("janneke")
queue.is_empty()


