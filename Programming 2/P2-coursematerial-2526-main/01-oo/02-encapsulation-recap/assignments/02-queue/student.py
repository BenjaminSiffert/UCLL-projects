class Queue():
    def __init__(self):
        self.items = []
    
    def add(self, item):
        self.items.append(item)


queue = Queue()

queue.add('Alice')
print(queue)