//
//  MylistView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/17.
//

import SwiftUI

struct MylistView: View {
    @EnvironmentObject var songManager: SongManager
    @EnvironmentObject var songListManager: SongListManager
    
    let circleItems: [CircleItem] = [
        .item_one,
        .item_two,
        .item_three,
        .item_four,
        .item_five,
        .item_six
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 23/255, green: 22/255, blue: 46/255)
                    .ignoresSafeArea()
                VStack {
                    Text("收藏歌單")
                        .bold()
                        .font(.system(size: 33))
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .padding(.bottom, 50)
                    ScrollView(.vertical) {
                        LazyVStack(spacing:20){
                            ForEach(1...8, id: \.self) { index in
                                NavigationLink(destination: ListView()) {
                                    HStack {
                                        if let circleItem = circleItems[(index - 1) % circleItems.count] {
                                            ZStack {
                                                Image(circleItem.rawValue)
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                    .padding(.all, 5)
                                                    .background(Color.white)
                                                    .clipShape(Circle())
                                            }
                                        }
                                        Text("我的歌單\(index)")
                                            .font(.system(size: 23))
                                            .foregroundColor(.white)
                                    }
                                }
                                Divider()
                            }
                        }
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal)
                }
            }
        }
    }
}


struct MylistView_Previews: PreviewProvider {
    static var previews: some View {
        MylistView()
    }
}
