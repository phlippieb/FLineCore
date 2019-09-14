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

struct FirelineState: StateType {}

let firelineReducer: Reducer<FirelineState> = { (action: Action, state: FirelineState?) in
    return state ?? FirelineState()
}
