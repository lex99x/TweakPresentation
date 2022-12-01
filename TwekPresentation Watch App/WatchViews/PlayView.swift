
import SwiftUI

struct PlayView: View {
    
    @State var timeRemaining = 3
    @State var contando = false
    @State var jump = false
    @State var presentation: SimplePresentation
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //    @State var showingSheet = false
    
    var body: some View {
        
        NavigationView {
            ZStack () {
                VStack (alignment: .center, spacing: 4) {
                    Text("\(presentation.title)")
                        .font(.headline)
                        .scenePadding()
                        .padding(.top,8)
                        .foregroundColor(Color(.DarkText1))
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(Color(.RoxoWatch))
                            .frame(width: 88, height: 88)
                            .onTapGesture(perform: {
                                contando = true
                            })
                        
                        Image(systemName: "play.fill")
                            .font(.title)
                            .foregroundColor(Color(.DarkText1))
                            .padding(.leading,2)
                            .onTapGesture(perform: {
                                contando = true
                            })
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 8) {
                        Text("\(presentation.events.count) eventos")
                            .font(.footnote)
                            .foregroundColor(Color(.DarkText1))
                            .padding(.top,4)
                            .padding(.leading,8)
                            .padding(.bottom,4)
                            .padding(.trailing,8)
                            .background(Color(.CorPadraoCard))
                            .clipShape(Capsule())
                        
                        if (presentation.totalTime >= 3600){
                            Text("\(secondsToHoursMinutesSeconds(presentation.totalTime))")
                                .font(.footnote)
                                .foregroundColor(Color(.DarkText1))
                                .padding(.top,4)
                                .padding(.leading,8)
                                .padding(.bottom,4)
                                .padding(.trailing,8)
                                .background(Color(.CorPadraoCard))
                                .clipShape(Capsule())
                        }
                        else{
                            Text("\(secondsToMinutesSeconds(presentation.totalTime))")
                                .font(.footnote)
                                .foregroundColor(Color(.DarkText1))
                                .padding(.top,4)
                                .padding(.leading,8)
                                .padding(.bottom,4)
                                .padding(.trailing,8)
                                .background(Color(.CorPadraoCard))
                                .clipShape(Capsule())
                        }
                    }
                }
                
                if contando == true{
                    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    
                    ZStack {
                        Color.black
                        Circle()
                            .fill(Color(.CorPadraoCard))
                            .frame(width: 88, height: 88, alignment: .center)
                        Text("\(timeRemaining)")
                            .foregroundColor(Color(.DarkText1))
                            .bold()
                            .font(.largeTitle)
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
        
        //        .navigationBarBackButtonHidden()
        //        .toolbar {
        //            ToolbarItem(placement: .cancellationAction) {
        //
        //                if jump {
        //
        //                    Button(action: {
        //                        showingSheet.toggle()
        //                    }, label: {
        //                        HStack {
        //                            Image(systemName: "chevron.backward.circle.fill")
        //                                .foregroundColor(Color(.RoxoWatch))
        //                        }
        //                    })
        //
        //                }
        //           }
        //        }
        //        .sheet(isPresented: $showingSheet) {
        //            QuitView(presentation: presentation)
        //        }
    }
    
}

//struct playView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayView(presentation: SimplePresentation())
//    }
//}
