//
//  EditorView.swift
//  TCATest
//
//  Created by クワシマ・ユウキ on 2022/09/04.
//

import SwiftUI
import ComposableArchitecture

struct EditorView: View {
    let globalStore: Store<GlobalState, GlobalAction>
    let editorStore: Store<EditorState, EditorAction>
    
    init(globalStore: Store<GlobalState, GlobalAction>) {
        self.globalStore = globalStore
        self.editorStore = Store(initialState: EditorState(), reducer: Reducer<EditorState, EditorAction, EditorEnvironment> { state, action, env in
            switch action {
            case .addNode:
                let input = InputView(globalStore: globalStore)
                let output = OutputView(globalStore: globalStore)
                let node = NodeView(globalStore: globalStore, inputViews: [input], outputViews: [output])
                state.nodeViews.append(node)
                return .none
            default:
                return .none
            }
        }, environment: EditorEnvironment())
    }
    var body: some View {
        WithViewStore(self.globalStore) { globalViewStore in
//            WithViewStore(self.editorStore) { editorViewStore in
//                Text("test")
//                Button("add") {
//                    editorViewStore.send(.addNode)
//                }
//            }
            WithViewStore(self.editorStore, content: {
                
            })
        }
    }
}
