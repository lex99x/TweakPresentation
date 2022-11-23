
import SwiftUI

struct PlayView: View {

    @State var timeRemaining = 3
    @State var contando = false
    @State var jump = false
    @State var presentation = getMockedPresentations()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                  
                    Text("\(presentation[0].title)")
                        .font(.system(size:17))
                        .offset(y:5)
                        .padding()
                    ZStack{
                        Circle()
                            .fill(Color(.RoxoWatch))
                            .frame(width: 116, height: 116, alignment: .center)
                            .onTapGesture(perform: {
                                contando = true
                            })
                        
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 34, height: 34)
                            .onTapGesture(perform: {
                                contando = true
                            })
                    }
                    HStack(spacing:8){
                        Text("\(presentation[0].events.count) eventos")
                            .frame(width: 80)
                            .background(Color(.CorFundoCard))
                            .cornerRadius(8)
                            .font(.system(size:14))
                        if (presentation[0].totalTime >= 3600){
                            Text("\(secondsToHoursMinutesSeconds(presentation[0].totalTime))")
                                .frame(width: 80)
                                .background(Color(.CorFundoCard))
                                .cornerRadius(8)
                                .font(.system(size:14))
                        }
                        else{
                            Text("\(secondsToMinutesSeconds(presentation[0].totalTime))")
                                .frame(width: 80)
                                .background(Color(.CorFundoCard))
                                .cornerRadius(8)
                                .font(.system(size:14))
                        }
                    }
                    .offset(y:20)
                    .padding(.bottom,20)
                    
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
                    NavigationLink(destination: ManualPresentationView(), isActive: $jump) {
                        EmptyView()
                    }
                    
                }
          
            }
        }
    }
}
struct playView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
