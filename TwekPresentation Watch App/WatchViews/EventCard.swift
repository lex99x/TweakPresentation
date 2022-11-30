import Foundation
import SwiftUI

struct EventCard: View {
    
    @State var evento: SimpleEvents
    @State var start = Date()
    
    @State var isHapticsPresentation: Bool
    
    @State var progress = 0.0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color(.CorFundoCard)
                .cornerRadius(6)
            VStack(spacing: 0) {
                Color(.CorPadraoCard)
                    .cornerRadius(6)
                    .padding()
                HStack {
                    ProgressView(value: progress, total: evento.eventDuration)
                        .tint(Color(.RoxoWatch))
                        .onReceive(timer) { _ in
                            if progress < evento.eventDuration {
                                progress += 0.1
                            } else if progress >= evento.eventDuration {
                                timer.upstream.connect().cancel()
                                if isHapticsPresentation {
                                    WKInterfaceDevice.current().play(.stop)
                                }
                            }
                        }
                }
                HStack {
                    Text(evento.eventDescription)
                        .scenePadding()
                }
            }
        }
        .onAppear(perform: {
            print(evento)
            timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        })
        .onDisappear(perform: {
            timer.upstream.connect().cancel()
            progress = 0.0
        })
        
    }
}

struct EventCardShow: View {
    var apresentacao : SimplePresentation
    var body: some View {
        if apresentacao.events.count == 0 {
            
        } else {
            TabView {
                ForEach((0...apresentacao.events.count - 1), id: \.self) {
                    EventCard(evento: apresentacao.events[$0], isHapticsPresentation: apresentacao.haptics)
                }
            }
            .tabViewStyle(.carousel)
        }
    }
}
