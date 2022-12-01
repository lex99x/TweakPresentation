import Foundation
import SwiftUI
import RealmSwift

class Event: Object, Identifiable {
    
    @Persisted var eventTitle: String
    @Persisted var eventDescription: String
    var memoryTriggersLabel: String
    var memoryTriggersImage: Image
    var memoryTriggersColor: Color
    @Persisted var startTimeSeg: Int
    @Persisted var endTimeSeg: Int
    @Persisted var eventDuration: Double
    
    init(eventTitle: String, eventDescription: String, memoryTriggersLabel: String, memoryTriggersImage: Image, memoryTriggersColor: Color, eventDuration: Double) {
        self.eventTitle = eventTitle
        self.eventDescription = eventDescription
        self.memoryTriggersLabel = memoryTriggersLabel
        self.memoryTriggersImage = memoryTriggersImage
        self.memoryTriggersColor = memoryTriggersColor
        self.eventDuration = eventDuration
    }
    
    override init() {
        self.eventTitle = ""
        self.eventDescription = ""
        self.memoryTriggersLabel = ""
        self.memoryTriggersImage = Image(systemName: "globe")
        self.memoryTriggersColor = Color.blue
        self.startTimeSeg = 0
        self.endTimeSeg = 0
        self.eventDuration = 0
    }
    
    func calcDuration() {
        eventDuration = Double(startTimeSeg)
    }
    
    func save(presentation: Presentation) {
        
        let realm = try! Realm()

        try! realm.write {
            presentation.events.append(self)
        }
        
    }
    
    static func updateEvents(presentation:Presentation){
        let realm = try! Realm()
           try! realm.write {
               presentation.events.removeAll()
           }
    }
   
    
    static func readAll() -> Results<Event> {
        
        let realm = try! Realm()
        
        return realm.objects(Event.self)
        
    }
    
    func log() {
        print(eventTitle)
        print(eventDescription)
        print(startTimeSeg)
        print(endTimeSeg)
        print(eventDuration)
    }
    
}
