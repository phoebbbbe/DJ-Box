//
//  ListView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/5.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ZStack{
            Color(red: 23/255, green: 22/255, blue: 46/255)
                .ignoresSafeArea()
            VStack{
                Text("專屬您的歌單")
                    .bold()
                    .font(.system(size: 33))
                    .foregroundColor(.white)
                    .padding(.bottom,70)
            }
            
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
