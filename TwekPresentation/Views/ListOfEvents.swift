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
    @State var eventos = [Event()]
    @State private var showingSheet = false
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        ZStack{
            Color(.DarkFundoIphone).edgesIgnoringSafeArea(.all)
            VStack(alignment:.leading, spacing: 0){
                VStack (alignment: .leading, spacing: 16) {
                    Text(presentation.descript)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                    HStack {
                        Image(systemName: "applewatch.radiowaves.left.and.right")
                            .font(.callout)
                            .foregroundColor(Color(.DarkText1))
                        Text("Haptics " + (presentation.haptics ? "enabled" : "disabled"))
                            .font(.callout)
                            .foregroundColor(Color(.DarkText1))
                    }
                    HStack {
                        Text("\(secondsToMinutesSecondsWithText(presentation.totalTime))")
                            .font(.callout)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 4, height: 4)
                            .foregroundColor(.gray)
                        Text("\(presentation.events.count) events")
                            .font(.callout)
                            .foregroundColor(Color(.DarkText1))
                    }
                    HStack (spacing: 5){
                        Image(systemName: "info.circle")
                        Text("Tap the plus")
                        Image(systemName: "plus")
                        Text("button to add an event.")
                        Spacer()
                    }
                    .font(.subheadline)
                    .foregroundColor(Color(.DarkText2))
                    .padding(.horizontal, 7)
                    .padding(.vertical, 7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                    )
                    
                }
                .padding(.leading,16)
                .padding(.trailing,16)
                
                VStack (spacing: 4){
                    List{
                        ForEach(eventos,id:\.self){ evento in
                            EventCard(event: evento)
                                .padding(.leading,4)
                                .background(Color(.CorFundoCard))
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.Border), lineWidth: 0.5)
                                )
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                            
                        }
                        .onMove(perform: move)
                    }
                    .refreshable(action: {
                        eventos = Array(presentation.events)
                    })
                    
                    .scrollContentBackground(.hidden)
                    .ignoresSafeArea()
                    .listStyle(PlainListStyle())
                    .padding(16)
                }
                
            }
            
            .sheet(isPresented: $showingSheet, content: {
                CreateEventModal(presentation: presentation)
            })
            
            .navigationTitle(Text(presentation.title))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color(.RoxoWatch))
                })
                EditButton()
            }
            .onChange(of: editMode!.wrappedValue, perform: { value in
                if value.isEditing {
                    eventos = Array(presentation.events)
                } else {
                    Presentation.updateEvents(presentation: presentation, newEvents: eventos)
                }
            })
            
        }
        .onAppear(){
            eventos = Array(presentation.events)
        }
        
    }
    
    func move(from source: IndexSet, to destination: Int) {
        eventos.move(fromOffsets: source, toOffset: destination)
    }
    
    
    struct ListOfEventsView_Previews: PreviewProvider {
        static var previews: some View {
            ListOfEventsView(presentation: Presentation())
        }
    }
}
