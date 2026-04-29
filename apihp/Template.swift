//
//  Template.swift
//  apihp
//
//  Created by Turma01-17 on 28/04/26.
//

import SwiftUI

struct Template: View {
    var personagem: Hapo
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "https://wallpapers.com/images/hd/harry-potter-gryffindor-wallpaper-sf79op3es7lwzz70.jpg")){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .ignoresSafeArea()
            .opacity(0.6)
            .blur(radius: 3)
            
            VStack(spacing:30){
                AsyncImage(url: URL(string: personagem.image!)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 250)
                .clipShape(Circle())
                
                Text("House: \(personagem.house!)\nName: \(personagem.name!)\nBirth: \(personagem.dateOfBirth!)\nEyes: \(personagem.eyeColour!)")
                    .font(.title)
                    .padding(30)
                    .background(.red)
                    .cornerRadius(20)
            }
        }
    }
}

#Preview {
    Template(personagem: Hapo(
            id: "1",
            name: "Harry Potter",
            alternate_names: [],
            species: "Human",
            gender: "Male",
            house: "Gryffindor",
            dateOfBirth: "31-07-1980",
            yearOfBirth: 1980,
            wizard: true,
            ancestry: "half-blood",
            eyeColour: "green",
            hairColour: "black",
            wand: Wand(wood: "holly", core: "phoenix feather", length: 11.0),
            patronus: "stag",
            hogwartsStudent: true,
            hogwartsStaff: false,
            actor: "Daniel Radcliffe",
            alternate_actors: [],
            alive: true,
            image: "https://ik.imagekit.io/hpapi/harry.jpg"
        ))
}
