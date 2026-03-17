# Source - https://stackoverflow.com/a/57409500
# Posted by Maeaex1
# Retrieved 2026-03-04, License - CC BY-SA 4.0

import time
start_time = time.time()

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
    def get_items(self):
        return self.__items
    def set__items(self, items):
        self.__items = items
        
queue = Queue()
queue.add("jip")
queue.add("janneke")
print(queue.get_items())
print("Process finished --- %s seconds ---" % (time.time() - start_time))


