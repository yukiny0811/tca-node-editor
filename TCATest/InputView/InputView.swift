//
//  InputView.swift
//  TCATest
//
//  Created by クワシマ・ユウキ on 2022/09/04.
//

import SwiftUI
import ComposableArchitecture

struct InputView: View, Identifiable {
    let id = UUID()
    static let preferredHeight: CGFloat = 30
    let globalStore: Store<GlobalState, GlobalAction>
    let inputStore: Store<InputState, InputAction> = Store(initialState: InputState(), reducer: Reducer<InputState, InputAction, InputEnvironment> { state, action, env in
        switch action {
        default:
            return .none
        }
    }, environment: InputEnvironment())
    var body: some View {
        WithViewStore(self.globalStore) { globalViewStore in
                WithViewStore(self.inputStore) {inputViewStore in
                    HStack {
                        Circle()
                            .frame(width: 30, height: 30, alignment: .leading)
                        Text("input1")
                    }
                }
            }
    }
}
