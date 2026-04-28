//
//  Service.swift
//  apihp
//
//  Created by Turma01-17 on 28/04/26.
//

import Foundation
import Combine

struct Service{
    func fetchHapo(url: URL) -> AnyPublisher<[Hapo], Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Hapo].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
