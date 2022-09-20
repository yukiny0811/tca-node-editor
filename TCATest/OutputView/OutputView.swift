//
//  OutputView.swift
//  TCATest
//
//  Created by クワシマ・ユウキ on 2022/09/04.
//

import SwiftUI
import ComposableArchitecture

fileprivate enum NodeSizeConfig {
    static let min = CGSize(width: 200, height: 30)
    static let max = CGSize(width: 200, height: 50)
}

struct OutputView: View, Identifiable {
    static let preferredHeight: CGFloat = 30
    let id = UUID()
    let globalStore: Store<GlobalState, GlobalAction>
    let outputStore: Store<OutputState, OutputAction> = Store(initialState: OutputState(), reducer: Reducer<OutputState, OutputAction, OutputEnvironment> { state, action, env in
        switch action {
        default:
            return .none
        }
    }, environment: OutputEnvironment())
    var body: some View {
        WithViewStore(self.globalStore) { globalViewStore in
                WithViewStore(self.outputStore) {outputViewStore in
                    HStack {
                        Spacer()
                        Text("output1")
                            .frame(alignment: .trailing)
                        Circle()
                            .frame(width: 20, height: 20, alignment: .trailing)
                    }
                    .frame(minWidth: NodeSizeConfig.min.width, maxWidth: NodeSizeConfig.max.width, minHeight: NodeSizeConfig.min.height)
                    .background(Color.yellow)
                    .fixedSize()
                }
            }
    }
}
