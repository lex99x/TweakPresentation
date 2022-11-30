//
//
//  ListEventsView.swift
//  PresentationsApp
//
//  Created by Alex A. Rocha on 16/11/22.
//

import SwiftUI

struct ListOfEventsView: View {
    
    var presentation: Presentation
    
    @State private var showingSheet = false
    var body: some View {
        ZStack{
            Color(.DarkFundoIphone).edgesIgnoringSafeArea(.all)
            VStack (alignment: .leading,spacing: 16) {
                Text(presentation.descript)
                    .font(.system(size: 17))
                    .multilineTextAlignment(.leading)
                HStack {
                    Image(systemName: "applewatch.radiowaves.left.and.right")
                    Text("Haptics on Apple Watch " + (presentation.haptics ? "enabled" : "disabled"))
                        .font(.system(size: 15))
                    
                }
                HStack {
                    Text("\(secondsToMinutesSecondsWithText(presentation.totalTime))")
                        .font(.system(size: 15))
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 4, height: 4)
                        .foregroundColor(.gray)
                    Text("\(presentation.events.count) events")
                        .font(.system(size: 15))
                }
                HStack (spacing: 5){
                    Image(systemName: "info.circle")
                    Text("Tap in the timeline to add an event.")
                        .font(.system(size: 17))
                }
                .foregroundColor(.gray)
                .padding(.horizontal, 7)
                .padding(.vertical, 7)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
                List(Array(presentation.events)) { event in
                    
                   
                   EventCard(event: event)
                 
                        .listRowBackground(Color(.CorFundoCard))
                        .listRowSeparator(.hidden)
                }
                .scrollContentBackground(.hidden)
                
            }
            .sheet(isPresented: $showingSheet, content: {
                CreateEventModal(presentation: presentation)
            })
            
            .padding(.leading,16)
            .padding(.top,15)
            .navigationTitle(Text(presentation.title))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color(.RoxoWatch))
                })
            }
            
        }
    }
    
 
    
    struct ListOfEventsView_Previews: PreviewProvider {
        static var previews: some View {
            ListOfEventsView(presentation: Presentation())
        }
    }
}
