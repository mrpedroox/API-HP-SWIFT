//
//  ContentView.swift
//  apihp
//
//  Created by Turma01-17 on 28/04/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.red)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading){
                    AsyncImage(url: URL(string: "https://wallpapers.com/images/hd/harry-potter-gryffindor-wallpaper-sf79op3es7lwzz70.jpg")){ image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 430, height: 270)
                    .ignoresSafeArea()
                    
                    
                    
                    ScrollView{
                        ForEach(viewModel.personagens){personagem in
                            HStack(spacing: 15){
                                NavigationLink(destination: Template(personagem: personagem)){
                                    AsyncImage(url: URL(string: personagem.image ?? "")){image in
                                        image.resizable()
                                            .scaledToFill()
                                    }placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .clipShape(Circle())
                                    
                                    Text(personagem.name!)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                            .padding(.horizontal, 40)
                        }
                    }
                }
            }
        }
        .onAppear(){
            viewModel.fetch()
        }
    }
}
#Preview {
    ContentView()
}
