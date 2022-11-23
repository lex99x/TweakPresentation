import Foundation
import SwiftUI

struct EventCard: View {
    
    var evento: Event
    @State var start = Date()
    
    var body: some View {
       
       
        ZStack{
            Color(. CorFundoCard)
                .cornerRadius(6)
            VStack(spacing:0){
                Color(. CorPadraoCard)
                    .cornerRadius(6)
                    .padding()
                HStack{
                    ProgressView(timerInterval:start...start.addingTimeInterval (evento.eventDuration), countsDown: false){
                        //Titulo do evento
                    } currentValueLabel: {
                        
                        //Range do evento
                    }
                    .tint(Color(.RoxoWatch))
                    .onAppear(){
                        start = Date()
                    }
                }
            }
            HStack{
                Text(evento.memoryTriggersLabel)
                    .scenePadding()
            }
        }
        
        
    }
}


struct EventCardShow: View {
    var apresentacao : Presentation
    var body: some View {
        if apresentacao.events.count == 0{
            
        }
        else{
            TabView  {
                //construir card aq
                ForEach((0...apresentacao.events.count-1), id: \.self) {
                    EventCard(evento:apresentacao.events[$0])
                }
            }
            .tabViewStyle(.carousel)
        }
        
    }
}








