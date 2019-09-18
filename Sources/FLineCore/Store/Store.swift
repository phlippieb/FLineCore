//
//  Store.swift
//  FLineCore
//
//  Created by Phlippie Bosman on 2019/09/14.
//

import ReSwift

final class StoreFactory {
    func createStore() -> Store<FirelineState> {
        return Store(
            reducer: firelineReducer,
            state: FirelineState())
    }
}

let firelineReducer: Reducer<FirelineState> = { (action: Action, state: FirelineState?) in
    var state = state ?? FirelineState()
    
    switch action {
    case let gameMenuAction as GameMenuAction:
        switch gameMenuAction {
        case .quit:
            state.didQuit = true
        }

    default:
        break
    }

    return state
}

struct FirelineState: StateType {
    init() {
        self.mainScene = .mainMenu
    }
    
    let mainScene: MainSceneType
    var didQuit = false
}

enum MainSceneType {
    case mainMenu
    
}

enum GameMenuAction: Action {
    case quit
}

