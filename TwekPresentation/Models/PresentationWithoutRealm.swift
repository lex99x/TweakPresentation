import Foundation
import RealmSwift

struct SimplePresentation: Codable,Equatable,Identifiable {
  

   
    let id = UUID()
    var title: String
    var descript: String
    var totalTime: Int
    var haptics: Bool
    var events: [SimpleEvents]
    
    init(title: String, descript: String, totalTime: Int, haptics: Bool, events: [SimpleEvents]) {
       
        self.title = title
        self.descript = descript
        self.totalTime = totalTime
        self.haptics = haptics
        self.events = events
    }
    init(){
        self.title = ""
        self.descript = ""
        self.totalTime = 5
        self.haptics = false
        self.events = []
    }
    
}

func PresentationToSimplePresentation(apresentacoes: [Presentation]) -> [SimplePresentation] {
    var apresentacaoMaisSimples : SimplePresentation = SimplePresentation()
    var vetorSimplePresentation : [SimplePresentation] = []
    
    for apresentacao in apresentacoes {
        apresentacaoMaisSimples.title = apresentacao.title
        apresentacaoMaisSimples.descript = apresentacao.descript
        apresentacaoMaisSimples.totalTime = apresentacao.totalTime
        apresentacaoMaisSimples.haptics = apresentacao.haptics
        apresentacaoMaisSimples.events = EventsToSimpleEvents(VetorDeEventos: apresentacao.events)
        
        vetorSimplePresentation.append(apresentacaoMaisSimples)
    }
   
    return vetorSimplePresentation
}

func Encode<T: Encodable>(payload: T) -> Data {
    
    let encoder = JSONEncoder()
    let jsonData = try! JSONEncoder().encode(payload)
    return jsonData
}

