//
//  BaseResponseDTO.swift
//  37-COLLABORATION-UNIQLO
//
//  Created by 이나연 on 11/20/25.
//

import Foundation

struct BaseResponseDTO<T: Decodable>: Decodable {
    let code: Int
    let msg: String
    let data: T?
}
