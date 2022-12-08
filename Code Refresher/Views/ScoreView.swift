//
//  ScoreView.swift
//  Code Refresher
//
//  Created by Geordie Jones on 12/6/22.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var viewModel: GameViewModel
 
    var body: some View {

        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Final Score:")
                    .font(.title)
                Text(viewModel.score)
                    .bold()
                    .font(.largeTitle)
                Spacer()
                Text("\(viewModel.correct) ✅")
                Text("\(viewModel.incorrect) ❌")
                Spacer()
                NavigationLink(destination: WelcomeView()) {
                    BottomTextView(str: "Re-take Quiz")
                }
            }
            .foregroundColor(.white)
            .navigationBarHidden(true)
        }
        .font(.system(size: 30))
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
