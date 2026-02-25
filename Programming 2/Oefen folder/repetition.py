from abc import ABC, abstractmethod
class Event(ABC):
    def __init__(self, event_name, max_capacity):
            self.name = event_name
            self.max_capacity = max_capacity
            self.__tickets = {}
    @property
    def total_tickets(self):
        return len(self.__tickets)
    def add_ticket(self, ticket):
        if self.total_tickets >= self.max_capacity:
            raise ValueError ("Max capacity reached. reject any newcomers or kill current visitors")
        self.__tickets[ticket.ticket_ID] =  ticket
    def remove_ticket(self, ticket_ID):
        if ticket_ID not in self.__tickets:
            raise ValueError ("No ticket found")
        del self.__tickets[ticket_ID]
    
    @abstractmethod
    def  generate_event_summary(self):
        pass
class Concert(Event):
    def __init__(self, event_name, max_capacity, artists):
        super().__init__(event_name, max_capacity) 
        self.artists = artists
        
    def generate_event_summary(self):
        summary = f"Name: {self.name} \n-Total tickets: {self.total_tickets} \n-Artists:"
        for artist in self.artists:
            summary += f"\n -{artist}"
        return summary
    
class PrivateEvent(Event):
    def __init__(self, event_name, artist):
        super().__init__(event_name, 50)
        self.artist = artist
        
    def generate_event_summary(self):
        summary = f"Name: {self.name} \n-Total tickets: {self.total_tickets} \n-{self.artist}"
        return summary
        
        
class Ticket:
    def __init__(self,ticket_ID, ticket_type,price):
        self.ticket_ID = ticket_ID
        self.ticket_type = ticket_type
        self.price = price
    @property   
    def ticket_ID(self):
        return self.__ticket_ID
    @ticket_ID.setter
    def ticket_ID(self, value):
        if not self.is_valid_ticket(value):
            raise ValueError("ongelding ticket")
        else:
            self.__ticket_ID = value
        

    def is_valid_ticket(self,ticket_ID):
        if len(ticket_ID) != 8:
            return False
        if not ticket_ID[:3].isupper() or not ticket_ID[0: 3].isalpha():
            return False
        if not ticket_ID[3:].isdigit():
            return False
        else:
            return True
    def __str__(self):
        return self.ticket_ID + "\n" +  self.ticket_type + "\n" + str(self.price)
    
ticket1 = Ticket("ABC12345","concert", 12.95)
concert1 =  Concert("Yayfest", 1000, ["je-mama", "ik", "Winnie de pooh"])
Private_event1 =  PrivateEvent("fight club", "Winnie de pooh")
Private_event1.add_ticket(ticket1)

print(concert1.generate_event_summary())
print(Private_event1.generate_event_summary())

    