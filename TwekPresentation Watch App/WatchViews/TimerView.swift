import SwiftUI
struct TimerView: View {
    //variaveis
    var timerColor:Color {
        if mainTimer > presentation.totalTime {return Color.red}
        else if mainTimer >= presentation.totalTime - 120 && mainTimer <= presentation.totalTime{return Color.yellow}
        else {return Color.white}
    }
    var presentation : Presentation
    @State var mainTimer : Int = 0
    
    var body: some View {
        HStack{
            //tempos menores que uma hora
            if (presentation.totalTime >= 3600){
                Text("\(secondsToHoursMinutesSeconds(mainTimer) ) / \( secondsToHoursMinutesSeconds(presentation.totalTime)) ")
                    .foregroundColor(timerColor)
            }
            //tempos maiores que uma hora
            else{
                Text("\(secondsToMinutesSeconds(mainTimer) ) / \( secondsToMinutesSeconds(presentation.totalTime)) ")
                    .foregroundColor(timerColor)
            }
                
        }
        .padding()
        .onAppear(){  Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.mainTimer >= 0 {
                self.mainTimer += 1
            }
        }
        }
        
        
    }
        
    
}


struct TimerView_Previews: PreviewProvider {
    static var teste = getMockedPresentations()
    static var previews: some View {
        TimerView(presentation: teste[0])
    }
}
