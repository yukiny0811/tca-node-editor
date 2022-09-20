//
//  ContentView.swift
//  TCATest
//
//  Created by クワシマ・ユウキ on 2022/09/03.
//

import SwiftUI
import ComposableArchitecture

//struct CounterState: Equatable {
//    var count = 0
//}
//
//enum CounterAction: Equatable {
//    case decrementButtonTapped
//    case incrementButtonTapped
//}
//
//struct CounterEnvironment {}

struct ContentView: View {
    let globalStore: Store<GlobalState, GlobalAction> = Store(initialState: GlobalState(), reducer: Reducer<GlobalState, GlobalAction, GlobalEnvironment> { state, action, env in
        switch action {
        default:
            return .none
        }
    }, environment: GlobalEnvironment())
    var body: some View {
        WithViewStore(self.globalStore) {globalViewStore in
            EditorView(globalStore: globalStore)
        }
    }
}
