//
//  MyProfileIntentHandler.swift
//  Person
//
//  Created by IRFAN TRIHANDOKO on 04/02/20.
//  Copyright © 2020 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import Intents

class MyProfileIntentHandler : NSObject, MyProfileIntentHandling {
    
    func resolveName(for intent: MyProfileIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        guard let name = intent.name else {
            completion(INStringResolutionResult.needsValue())
            return
        }
        completion(INStringResolutionResult.success(with: name))
    }
    
    func resolveAddress(for intent: MyProfileIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        guard let address = intent.address else {
            completion(INStringResolutionResult.needsValue())
            return
        }
        completion(INStringResolutionResult.success(with: address))
    }
    
    func resolveMotto(for intent: MyProfileIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        guard let motto = intent.motto else {
            completion(INStringResolutionResult.needsValue())
            return
        }
        completion(INStringResolutionResult.success(with: motto))
    }
    
    func handle(intent: MyProfileIntent, completion: @escaping (MyProfileIntentResponse) -> Void) {
        
        let profileData = "\(intent.name ?? "")\n\(intent.address ?? "")\n\(intent.motto ?? "")"
        let shared = UserDefaults(suiteName: "group.id.gits.sirikit")
        shared?.set(profileData, forKey: "PERSON_INFO")
        
        let response = MyProfileIntentResponse.success(result: "successfully")
        completion(response)
    }
    
}
