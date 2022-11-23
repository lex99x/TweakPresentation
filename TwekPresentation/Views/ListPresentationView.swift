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
            VStack{
                if NaoTemApresentacao  {
                    VStack {
                        Text("Não há nada para ensaiar agora.\n\nToque no ícone “+” para criar uma nova apresentação.")
                            .foregroundColor(.gray)
                            .navigationBarTitle("Presentations", displayMode: .inline)
                            .toolbar {
                                Button(action: {
                                    showingSheet.toggle()
                                }, label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color(.RoxoWatch))
                                })
                            }
                            .multilineTextAlignment(.center)
                            .padding(.top, 95)
                            .sheet(isPresented: $showingSheet, onDismiss:{
                                    NaoTemApresentacao = false
                            }, content: {
                                CreatePresentationModal()
                            })
                                                    Spacer()
                    }
                                    }
                else{
                    
                    List(ListaDeApresentacoes){ apresentacao in
                        NavigationLink(destination: ListEventsView(presentation: apresentacao), label: {
                            ListCardView(apresentacao: apresentacao)
                                .listRowBackground(Color(.CorFundoCard))
                        })
                          
                    }
                    .scrollContentBackground(.hidden)
                    .refreshable {
                        ListaDeApresentacoes = Array(Presentation.readAll())
                        counter.increment()
                        
                    }
                    .padding(.top,2)
                    .navigationBarTitle("Presentations", displayMode: .inline)
                    .toolbar {
                        Button(action: {
                            showingSheet.toggle()
                            counter.increment()
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundColor(Color(.RoxoWatch))
                        })
                    }
//                    .multilineTextAlignment(.center)
//                    .padding(.top, 95)
                    .sheet(isPresented: $showingSheet, content: {
                        CreatePresentationModal()
                    })
                }
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



//
////                        print(Encode(payload: PresentationToSimplePresentation(apresentacoes: ListaDeApresentacoes)))
//                        var listaDescondada = Decode(data: listaEncodada)
//                        print(listaDescondada)
