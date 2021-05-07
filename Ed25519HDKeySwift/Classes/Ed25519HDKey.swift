//
//  Ed25519HDKey.swift
//  Ed25519HDKeySwift
//
//  Created by Chung Tran on 07/05/2021.
//

import Foundation
import TweetNacl
import CryptoSwift

typealias Hex = String
typealias Path = String

struct Ed25519HDKey {
    static let ed25519Curve = "ed25519 seed"
    static let hardenedOffset = 0x80000000
    
    static func getMasterKeyFromSeed(_ seed: Hex) throws -> Keys {
        let hmacKey = ed25519Curve.bytes
        let hmac = HMAC(key: hmacKey, variant: .sha512)
        let entropy = try hmac.authenticate(Data(hex: seed).bytes)
        let IL = Data(entropy[0..<32])
        let IR = Data(entropy[32...])
        return Keys(key: IL, chainCode: IR)
    }
    
    
}
