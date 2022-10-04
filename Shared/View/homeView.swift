//
//  homeView.swift
//  boombit (iOS)
//
//  Created by David Londoño on 7/09/22.
//

import SwiftUI

struct homeView: View {
    @StateObject var joke: JokeViewModel = JokeViewModel()
    @State var pairModel : [MainResponse] = []
    @State var screenSize = UIScreen.main.bounds
    var body: some View {
        NavigationView {
            ForEach(0..<1) {i in
                HStack {
                    Spacer()
                    AsyncImage(
                        url: URL(string: pairModel.isEmpty ? "" : pairModel[i].image),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: screenSize.width * 0.25, maxHeight: screenSize.width * 0.25)
                        },
                        placeholder: {
                            ProgressView()
                                .frame(width: screenSize.width * 0.25, height: screenSize.width * 0.25)
                        }
                    )
                    Text(pairModel.isEmpty ? ConstantsText.loadText : pairModel[i].text)
                        .font(.headline)
                        .frame(width: screenSize.width * 0.70)
                    Spacer()
                }
            }
        }.navigationTitle(ConstantsText.homeTitle)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                DispatchQueue.global().async {
                    joke.getJoke()
                    while pairModel.isEmpty {
                        pairModel = joke.jokeDetail
                        if !pairModel.isEmpty {
                            break
                        }
                    }
                }
            }
    }
}
