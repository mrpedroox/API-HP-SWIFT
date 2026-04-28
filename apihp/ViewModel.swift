//
//  ViewModel.swift
//  apihp
//
//  Created by Turma01-17 on 28/04/26.
//

import Foundation
import Combine

class ViewModel: ObservableObject{
    @Published var personagens : [Hapo] = []
    
    private let service = Service()
    private var cancellables = Set<AnyCancellable>()
    
    func fetch(){
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor") else {
            return
        }
        service.fetchHapo(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) {personagens in
                self.personagens = personagens
            }
            .store(in: &cancellables)
    }
}
