//
//  LoadingView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/4.
//

import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var songManager: SongManager
    @State private var animationAmount = 0.0
    @State private var duration = 1.5
    var body: some View {
        ZStack{
            Color(red: 23/255, green: 22/255, blue: 46/255)
                .ignoresSafeArea()
            
            VStack{
                Text("歌單生成中")
                    .bold()
                    .font(.system(size: 33))
                    .foregroundColor(.white)
                    .padding(.bottom,70)
                HStack {
                    ForEach(0..<3) { index in
                        Circle()
                            .fill(self.djboxGradient)
                            .frame (width: 25, height: 25)
                            .scaleEffect (animationAmount)
                            .opacity (Double (3 - index) / 3)
                            .animation(.easeInOut (duration: duration)
                                .repeatForever(autoreverses: true)
                                .delay (0.25 * Double (index)) , value: animationAmount)
                    }
                    .padding(.bottom,60)
                    .onAppear {
                        animationAmount = 1
                    }
                    
                }
                
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .environmentObject(SongManager())
    }
}
