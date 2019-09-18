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
    return state ?? FirelineState()
}

struct FirelineState: StateType {
    init() {
        self.mainScene = .gameMenu
    }
    
    let mainScene: MainSceneType
}

enum MainSceneType {
    case gameMenu
    
}

enum GameMenuAction {
    case play
    case practice
    case quit
}
