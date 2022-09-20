//
//  NodeView.swift
//  TCATest
//
//  Created by クワシマ・ユウキ on 2022/09/04.
//

import SwiftUI
import ComposableArchitecture

fileprivate enum NodeSizeConfig {
    static let min = CGSize(width: 200, height: 30)
    static let max = CGSize(width: 200, height: CGFloat.infinity)
}

struct NodeView: View, Identifiable {
    let id = UUID()
    let globalStore: Store<GlobalState, GlobalAction>
    let nodeStore: Store<NodeState, NodeAction> = Store(initialState: NodeState(), reducer: Reducer<NodeState, NodeAction, NodeEnvironment> { state, action, env in
        switch action {
        case .test:
            return Effect(
        default:
            return .none
        }
    }, environment: NodeEnvironment())
    let inputViews: [InputView]
    let outputViews: [OutputView]
    @State private var position: CGPoint = CGPoint(x: 200, y: 200)
    var processView: some View {
        Text("this is WIP")
    }
    var body: some View {
        WithViewStore(self.globalStore) { globalViewStore in
                WithViewStore(self.nodeStore) {nodeViewStore in
                    VStack {
                        HStack {
                            Rectangle()
                                .fill(Color.orange)
                                .frame(width: 30, height: 30, alignment: .leading)
                                .gesture(DragGesture().onChanged(){ value in
                                    self.position += value.translation.toCGPoint()
                                })
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        ForEach(inputViews) { v in
                            v
                        }
                        processView
                        ForEach(outputViews) { v in
                            v
                        }
                    }
                    .frame(minWidth: NodeSizeConfig.min.width, maxWidth: NodeSizeConfig.max.width, minHeight: NodeSizeConfig.min.height)
                    .border(Color.gray, width: 2)
                    .scaledToFit()
                    .position(position)
                }
            }
    }
}
