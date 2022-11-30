
import SwiftUI

struct PlayView: View {

    @State var timeRemaining = 3
    @State var contando = false
    @State var jump = false
    @State var presentation: SimplePresentation
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var showingSheet = false
   
    var body: some View {
        
        NavigationView {
            ScrollView {
                ZStack {
                    VStack {
                        Text("\(presentation.title)")
                            .font(.title3)
                            .offset(y: 5)
                            .padding()
                        ZStack {
                            Circle()
                                .fill(Color(.RoxoWatch))
                                .frame(width: 105, height: 105)
                                .onTapGesture(perform: {
                                    contando = true
                                })
                            
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .onTapGesture(perform: {
                                    contando = true
                                })
                        }
                        HStack(spacing: 8) {
                            Text("\(presentation.events.count) eventos")
                                .frame(width: 80)
                                .background(Color(.CorFundoCard))
                                .cornerRadius(8)
                                .font(.system(size:14))
                            if (presentation.totalTime >= 3600){
                                Text("\(secondsToHoursMinutesSeconds(presentation.totalTime))")
                                    .frame(width: 80)
                                    .background(Color(.CorFundoCard))
                                    .cornerRadius(8)
                                    .font(.system(size:14))
                            }
                            else{
                                Text("\(secondsToMinutesSeconds(presentation.totalTime))")
                                    .frame(width: 80)
                                    .background(Color(.CorFundoCard))
                                    .cornerRadius(8)
                                    .font(.system(size:14))
                            }
                        }
                        .offset(y:20)
//                        .padding(.bottom,20)
                    }
                    
                    if contando == true{
                        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        
                        ZStack{
                            Color.black
                            Circle()
                                .fill(Color(.CorPadraoCard))
                                .frame(width: 116, height: 116, alignment: .center)
                            Text("\(timeRemaining)")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size:32))
                                .onReceive(timer) { _ in
                                    if timeRemaining > 0 {
                                        timeRemaining -= 1
                                    } else {
                                        jump = true
                                        contando = false
                                        timeRemaining = 3
                                        timer.upstream.connect().cancel()
                                    }
                                }
                        }
                        
                    }
                    if jump == true {
                        NavigationLink(destination: ManualPresentationView(presentation: presentation), isActive: $jump) {
                            EmptyView()
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {

                if jump {

                    Button(action: {
                        showingSheet.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.backward.circle.fill")
                                .foregroundColor(Color(.RoxoWatch))
                        }
                    })

                }
           }
        }
        .sheet(isPresented: $showingSheet) {
            QuitView(presentation: presentation)
        }
    }
    
}

//struct playView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayView(presentation: SimplePresentation())
//    }
//}
