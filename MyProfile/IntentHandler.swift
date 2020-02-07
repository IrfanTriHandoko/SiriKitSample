//
//  IntentHandler.swift
//  MyProfile
//
//  Created by IRFAN TRIHANDOKO on 05/02/20.
//  Copyright © 2020 IRFAN TRIHANDOKO. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        guard intent is MyProfileIntent else {
            fatalError("Unhandled Intent error : \(intent)")
        }
        return MyProfileIntentHandler()
    }
}

