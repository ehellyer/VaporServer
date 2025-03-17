//
//  ByteBufferView+Extension.swift
//  vapor-server
//
//  Created by Ed Hellyer on 12/29/24.
//

import NIOCore

extension ByteBufferView {
    var stringRepresentation: String {
        String(decoding: self, as: UTF8.self)
    }
}
