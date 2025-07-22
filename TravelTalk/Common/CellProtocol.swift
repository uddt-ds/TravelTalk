//
//  CellProtocol.swift
//  TravelTalk
//
//  Created by Lee on 7/23/25.
//

import Foundation

protocol CellProtocol {
    associatedtype CellData
    func configureCell(data: CellData)
}
