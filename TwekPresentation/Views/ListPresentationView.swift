//
//  ListPresentationView.swift
//  PresentationsApp
//
//  Created by Gabriel Dias Goncalves on 15/11/22.
//

import SwiftUI

struct ListPresentationView: View {
    @StateObject var counter = Counter()
    @State var showingSheet = false
    @State var ListaDeApresentacoes = Array(Presentation.readAll())
    @State var semApresentacoes:Bool = true
    @State var NaoTemApresentacao:Bool = true
    var body: some View {
        NavigationView {
            VStack (spacing:0) {
                HStack {
                    Image(systemName: "arrow.down")
                        .font(.subheadline)
                        .foregroundColor(Color(.DarkText2))
                    Text("Arraste pra baixo pra atualizar")
                        .font(.subheadline)
                        .foregroundColor(Color(.DarkText2))
                        .multilineTextAlignment(.center)
                }
                .padding(0)
                .background(.opacity(0))
                
                List(ListaDeApresentacoes) { apresentacao in
                    ZStack {
                        NavigationLink(destination: ListOfEventsView(presentation: apresentacao), label: { })
                            .buttonStyle(PlainButtonStyle())
                            .opacity(0)

                        ListCardView(apresentacao: apresentacao)
                            .background(Color(.CorFundoCard))
                            .cornerRadius(12)
                    }
                    .padding(0)
                    .background(Color(.DarkFundoIphone))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                    .listRowBackground(Color(.DarkFundoIphone))
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .padding(16)
                .scrollContentBackground(.hidden)
                .refreshable {
                    ListaDeApresentacoes = Array(Presentation.readAll())
                    counter.increment()
                }
                .ignoresSafeArea()
                .navigationTitle("Presentations")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button(action: {
                        showingSheet.toggle()
                        counter.increment()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color(.RoxoWatch))
                    })
                }
                .sheet(isPresented: $showingSheet, content: {
                    CreatePresentationModal()
                })

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.DarkFundoIphone))
        }
    }
}

struct ListPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        ListPresentationView()
    }
}


