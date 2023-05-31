//
//  ThemeView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct ThemeView: View {
    let buttons = ["#Jazz", "#Kpop", "#陳綺貞", "#五月天", "#Indie", "#Country", "#R&B", "#Coldplay"]
    var body: some View {
        ZStack {
            Color(red: 23/255, green: 22/255, blue: 46/255)
               .ignoresSafeArea()
            
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(buttons, id: \.self) { buttonTitle in
                                VStack(spacing:5){
                                    
                                }
                                Button(action: {
                                    // 按鈕被點擊的處理
                                }) {
                                    Text(buttonTitle)
                                        .fontWeight(.medium)
                                        .font(.title3)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 100, height: 32)
                                        .lineSpacing(22)
                                        .padding(16)
                                        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.66, green: 0.96, blue: 0.71), Color(red: 0.80, green: 0.97, blue: 0.52), Color(red: 0.84, green: 0.98, blue: 0.47), Color(red: 0.66, green: 0.96, blue: 0.71)]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(40)
                                        .foregroundColor(Color(red: 23/255, green: 22/255, blue: 46/255))
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 24)
                    }
                }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
