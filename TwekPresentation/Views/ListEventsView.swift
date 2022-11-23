//
//  ListEventsView.swift
//  PresentationsApp
//
//  Created by Alex A. Rocha on 16/11/22.
//

import SwiftUI

struct ListEventsView: View {
    
    var presentation: Presentation
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text(presentation.descript)
                    .padding(.leading, 10)
                HStack {
                    Text("\(secondsToMinutesSecondsWithText(presentation.totalTime)) ")
                    Text("| \(presentation.events.count) events")
                }
                .padding(.top, 16)
                HStack {
                    Image(systemName: "applewatch.radiowaves.left.and.right")
                    Text("Haptics on Apple Watch " + (presentation.haptics ? "enabled" : "disabled"))
                }
                .padding(.top, 16)
                .padding(.bottom, 16)
                HStack {
                    Image(systemName: "info.circle")
                    Text("Tap in the timeline to add an event.")
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
                List(presentation.events) { event in
                    EventCardView(event: event)
                        .listRowBackground(Color(.CorFundoCard))
                        .listRowSeparator(.hidden)
                }
//                Spacer()
            }
            .sheet(isPresented: $showingSheet, content: {
                CreateEventModal(presentation: presentation)
            })
            .foregroundColor(Color(.DarkText1))
            .padding(.top, 7)
//            .padding(.leading, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    
}

struct ListEventsView_Previews: PreviewProvider {
    static var previews: some View {
//        ListEventsView(presentation: .constant(Presentation()))
        ListEventsView(presentation: Presentation())
    }
}
