import Foundation
import RealmSwift

struct SimpleEvents: Codable,Equatable {
    
    
    var eventTitle: String
    var eventDescription: String
    var memoryTriggersLabel: String
    var startTimeSeg: Int
    var endTimeSeg: Int
    var eventDuration: Double
    
    init(eventTitle: String, eventDescription: String, memoryTriggersLabel: String, startTimeSeg: Int, endTimeSeg: Int, eventDuration: Double) {
        self.eventTitle = eventTitle
        self.eventDescription = eventDescription
        self.memoryTriggersLabel = memoryTriggersLabel
        self.startTimeSeg = startTimeSeg
        self.endTimeSeg = endTimeSeg
        self.eventDuration = eventDuration
    }
    init()
    {
        self.eventTitle = ""
        self.eventDescription = ""
        self.memoryTriggersLabel = ""
        self.startTimeSeg = 0
        self.endTimeSeg = 0
        self.eventDuration = 0
    }
    
    
}

func EventsToSimpleEvents(VetorDeEventos: List<Event>) -> [SimpleEvents] {
    var simpleEvent:SimpleEvents = SimpleEvents()
    var VetorSimpleEvents: [SimpleEvents] = []
    
    for eventos in VetorDeEventos{
        simpleEvent.eventTitle = eventos.eventTitle
        simpleEvent.eventDescription = eventos.eventDescription
        simpleEvent.memoryTriggersLabel = eventos.memoryTriggersLabel
        simpleEvent.eventDuration = eventos.eventDuration
        
        VetorSimpleEvents.append(simpleEvent)
    }
    print(VetorSimpleEvents)
    return VetorSimpleEvents
    
}
func Decode(data: Data) -> [SimplePresentation]{
    let decoder = JSONDecoder()
    let sameEmployee = try? decoder.decode([SimplePresentation].self, from: data)
    guard let sameEmployee = sameEmployee else { return [] }
    return sameEmployee
}


