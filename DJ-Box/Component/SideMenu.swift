//
//  SideMenu.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/6/5.
//

import SwiftUI

var secondaryColor: Color =
              Color(.init(
                red: 100 / 255,
                green: 174 / 255,
                blue: 255 / 255,
                alpha: 1))

var thisGradient: LinearGradient {
       // 漸層顏色的程式碼
       return LinearGradient(gradient: Gradient(colors: [
           Color(red: 0.66, green: 0.96, blue: 0.71),
           Color(red: 0.80, green: 0.97, blue: 0.52),
           Color(red: 0.84, green: 0.98, blue: 0.47),
           Color(red: 0.66, green: 0.96, blue: 0.71)
       ]), startPoint: .leading, endPoint: .trailing)
   }

struct MenuItem: Identifiable {
    var id: Int
    var icon: String
    var text: String
}

var userActions: [MenuItem] = [
    MenuItem(id: 4001, icon: "house.fill", text: "主頁"),
    MenuItem(id: 4002, icon: "music.note.list", text: "收藏歌單"),
    MenuItem(id: 4003, icon: "gearshape.fill", text: "設定"),
]

var profileActions: [MenuItem] = [
    MenuItem(id: 4004,
              icon: "wrench.and.screwdriver.fill",
              text: "個人資料編輯"),
    MenuItem(id: 4005,
              icon: "iphone.and.arrow.forward",
              text: "登出"),
]

struct SideMenu: View {
    @Binding var showMenu: Bool
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.7
    var bgColor: Color = Color(.init(
                                  red: 23 / 255,
                                  green: 22 / 255,
                                  blue: 46 / 255,
                                  alpha: 1))

    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.white.opacity(0.6))
            .opacity(showMenu ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: showMenu)
            .onTapGesture {
                showMenu.toggle()
            }

            content
        }
        .edgesIgnoringSafeArea(.all)
    }

    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                bgColor
              //MenuChevron

                VStack(alignment: .leading, spacing: 20) {
                    userProfile
                    Divider()
                    MenuLinks(items: userActions)
                    Divider()
                    MenuLinks(items: profileActions)
                }
                
                .padding(.top, 80)
                .padding(.horizontal, 40)
            }
            .frame(width: sideBarWidth)
            .offset(x: showMenu ? 0 : -sideBarWidth)
            .animation(.default, value: showMenu)

            Spacer()
        }
    }

    
    var userProfile: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(
                  url: URL(
                      string: "https://picsum.photos/100")) { image in
                    image
                        .resizable()
                        .frame(width: 50,
                                height: 50,
                                alignment: .center)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.black, lineWidth: 2)
                        }
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(3 / 2, contentMode: .fill)
                .shadow(radius: 4)
                .padding(.trailing, 18)

                VStack(alignment: .leading, spacing: 6) {
                    Text("User name")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                    Text(verbatim: "test@gmail.com")
                        .foregroundColor(.white)
                        .font(.caption)
                }
            }
            .padding(.bottom, 20)
        }
    }
}
struct MenuLinks: View {
    var items: [MenuItem]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(items) { item in
                menuLink(icon: item.icon, text: item.text)
            }
        }
        .padding(.vertical, 14)
        .padding(.leading, 8)
    }
}

struct menuLink: View {
    var icon: String
    var text: String
    
    @State private var showAlert = false
    @State private var isActive = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding(.trailing, 18)
            
            Button(action: {
                handleMenuItemTap()
            }) {
                Text(text)
                    .foregroundColor(.white)
                    .font(.body)
            }
            .fullScreenCover(isPresented: $isActive) {
                destinationView(for: text)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("登出"),
                message: Text("謝謝使用，您已登出！"),
                dismissButton: .default(Text("確定"))
            )
        }
    }
    
    private func handleMenuItemTap() {
        isActive = true
    }
    
    private func destinationView(for text: String) -> some View {
        switch text {
        case "主頁":
            return AnyView(HomepageView())
        case "收藏歌單":
            return AnyView(HomepageView()) //再改成MylistView
        case "設定":
            return AnyView(HomepageView()) //再改成settingView
        case "個人資料編輯":
            return AnyView(HomepageView()) //再改成settingView
        default:
            return AnyView(EmptyView())
        }
    }
}


    struct SideMenu_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

