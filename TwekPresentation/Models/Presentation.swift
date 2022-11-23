//
//  classPresentation.swift
//  PresentationsApp
//
//  Created by Gabriel Dias Goncalves on 04/11/22.
//

import Foundation
import RealmSwift

class Presentation: Object,Identifiable  {
    @Persisted var title: String
    @Persisted var descript: String
    @Persisted var totalTime: Int
    @Persisted var haptics: Bool
    @Persisted var events: List<Event>
    
    init(title: String, descript: String, totalTime: Int, haptics: Bool, events: List<Event>) {
        self.title = title
        self.descript = descript
        self.totalTime = totalTime
        self.haptics = haptics
        self.events = events
    }
    
    override init() {
        self.title = ""
        self.descript = ""
        self.totalTime = 0
        self.haptics = false
        self.events = List<Event>()
    }
    
   
    func save() {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(self)
        }
        
    }
    
    static func readAll() -> Results<Presentation> {
        
        let realm = try! Realm()
        
        return realm.objects(Presentation.self)
        
    }
    
    func log() {
        print(title)
        print(descript)
        print(totalTime)
        print(haptics)
        print(events)
    }
    
}

func getMockedPresentations() -> [Presentation]{

    var presentations: [Presentation] = []

    presentations = [Presentation(),Presentation()]

    return presentations

}
