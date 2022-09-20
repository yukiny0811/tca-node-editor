//
//  TCATestApp.swift
//  TCATest
//
//  Created by クワシマ・ユウキ on 2022/09/03.
//

import SwiftUI
import ComposableArchitecture

enum WindowSize {
    static let min = CGSize(width: 500, height: 600)
    static let max = CGSize(width: CGFloat.infinity, height: CGFloat.infinity)
}

@main
struct TCATestApp: App {
//    let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> {state, action, env in
//        switch action {
//        case .decrementButtonTapped:
//            state.count -= 1
//            return .none
//        case .incrementButtonTapped:
//            state.count += 1
//            return .none
//        }
//    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: WindowSize.min.width, minHeight: WindowSize.min.height)
                .frame(maxWidth: WindowSize.max.width, maxHeight: WindowSize.max.height)
        }
    }
}
