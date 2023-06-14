//
//  FilterView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//  Modify by 林寧 on 2023/6/12.

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var songManager: SongManager
    
    @State private var searchText = ""
    @State private var isSearching = false
    
    @State private var selectedOccasion: Occasion?
    @State private var selectedMood: Mood?
    @State private var selectedDurasion = 0
    @State private var selectedHour = 0
    @State private var selectedMinute = 0
    @State private var selectedSecond = 0
    @State private var selectedReset = 0
    @State private var selectedNext = 0
    
    @State private var showLoadingView = false
    @State private var showMenu: Bool = false
    
    @State var offset: CGFloat = 0
    @State var lastStoredoffset: CGFloat = 0
    
    var body: some View {
        //let sideBarWidth = getRect().width - 90
        
        NavigationView{
            ZStack {
                Color(red: 23/255, green: 22/255, blue: 46/255)
                    .ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        Button(action: {
                            self.showMenu.toggle()
                        }, label: {
                            if showMenu{
                                Image(systemName: "xmark")
                                    .font(.system(size: 35))
                                    .foregroundColor(.white)
                                    .padding()
                            } else{
                                Image(systemName: "line.3.horizontal")
                                    .font(.system(size: 35))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            
                        })
                        
                        VStack {
                            HStack(spacing: 20) {
                                HStack {
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.gray)
                                        TextField("搜尋", text: $searchText)
                                    }
                                }
                                .padding(.all, 10.0)
                                .background(Color.white)
                                .cornerRadius(10)
                            }
                            .padding(/*@START_MENU_TOKEN@*/.trailing, 20.0/*@END_MENU_TOKEN@*/)
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("場合")
                                .bold()
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20.0)
                            Spacer()
                        }
                        HStack {
                            OccasionButtonView(occasion: .wedding, selectedOccasion: $selectedOccasion)
                            OccasionButtonView(occasion: .gathering, selectedOccasion: $selectedOccasion)
                            OccasionButtonView(occasion: .coffee, selectedOccasion: $selectedOccasion)
                            
                            
                        }
                        HStack {
                            OccasionButtonView(occasion: .awards, selectedOccasion: $selectedOccasion)
                            OccasionButtonView(occasion: .graduation, selectedOccasion: $selectedOccasion)
                            OccasionButtonView(occasion: .seminar, selectedOccasion: $selectedOccasion)
                            
                        }
                        HStack{
                            OccasionButtonView(occasion: .sports, selectedOccasion: $selectedOccasion)
                            OccasionButtonView(occasion: .company, selectedOccasion: $selectedOccasion)
                        }
                    }
                    .padding()
                    
                    VStack {
                        HStack {
                            Text("情緒")
                                .bold()
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20.0)
                            Spacer()
                        }
                        HStack {
                            MoodButtonView(mood: .energetic, selectedMood: $selectedMood)
                            MoodButtonView(mood: .happy, selectedMood: $selectedMood)
                            MoodButtonView(mood: .calm, selectedMood: $selectedMood)
                            MoodButtonView(mood: .sad, selectedMood: $selectedMood)
                        }
                    }
                    .padding()
                    VStack {
                        HStack {
                            Text("時長")
                                .bold()
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20.0)
                            Spacer()
                        }
                        HStack {
                            Picker("時", selection: $selectedHour) {
                                ForEach(0..<3, id: \.self) { hour in
                                    Text("\(hour) h")
                                        .foregroundColor(.white)
                                }
                            }
                            .pickerStyle(.wheel)
                            
                            Picker("分", selection: $selectedMinute) {
                                ForEach(0..<60, id: \.self) { minute in
                                    Text("\(minute) m")
                                        .foregroundColor(.white)
                                }
                            }
                            .pickerStyle(.wheel)
                            Picker("秒", selection: $selectedSecond) {
                                ForEach(0..<60, id: \.self) { second in
                                    Text("\(second) s")
                                        .foregroundColor(.white)
                                }
                            }
                            
                            .pickerStyle(.wheel)
                            
                        }
                    }
                    .padding()
                    
//                    Text("Selected Time: \(selectedHour)時\(selectedMinute)分\(selectedSecond)秒")
//                        .font(.headline)
//                        .padding()
//                        .foregroundColor(.white)
                    
                    HStack{
                        Button(action: {
                            selectedOccasion = nil
                            selectedMood = nil
                            selectedHour = 0
                            selectedMinute = 0
                            selectedSecond = 0
                        }, label: {
                            Text("重置")
                                .font(.system(size: 20))
                                .bold()
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding()
                                .padding(.horizontal, 15)
                                .background(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                                .cornerRadius(30)
                                .frame(width: 148, height: 56)
                            
                        })

                        VStack {
                            NavigationLink {
                                LoadingView()
                            } label: {
                                Button(action: {
                                    print("Show Loading View!!")
                                    showLoadingView = true
                                    selectedDurasion = (selectedHour*3600)+(selectedMinute*60)+selectedSecond
                                    
                                    songManager.FilterSongs(
                                        occasion: selectedOccasion ?? Occasion.wedding,
                                        mood: selectedMood ?? Mood.happy,
                                        duration: selectedDurasion)
                                    
                                }, label: {
                                    Text("儲存")
                                        .font(.system(size: 20))
                                        .bold()
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .padding(.horizontal, 15)
                                        .background(self.djboxGradient)
                                        .cornerRadius(30)
                                        .frame(width: 148, height: 56)
                                    
                                })
                        }
                        }
                    }
                }
                GeometryReader{ _ in
                    HStack{
                        SideMenu(showMenu: $showMenu)
                        //.offset(x: showMenu ? 0: UIScreen.main.bounds.width)
                        //.animation(.easeInOut(duration: 0.5), value: showMenu)
                        Spacer()
                        
                    }
                }
            }
            .onChange(of: showMenu) { newValue in
                
            }
            
        }
//        .background(
//            NavigationLink(destination: LoadingView(), isActive: $showLoadingView) {
//                EmptyView()
//            }
//            .hidden()
//        )
        
    }
}

struct OccasionButtonView: View {
    let occasion: Occasion
    @Binding var selectedOccasion: Occasion?
    
    var body: some View {
        Button(action: {
            selectedOccasion = occasion
        }) {
            Text(occasion.text())
            .font(.headline)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .foregroundColor(selectedOccasion == occasion ? .black : .primary)
            .background(selectedOccasion == occasion ? Color.white : Color.clear)
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
        .cornerRadius(50)
        .shadow(radius: 4)
    }
}

struct MoodButtonView: View {
    let mood: Mood
    @Binding var selectedMood: Mood?
    
    var body: some View {
        Button(action: {
            selectedMood = mood
        }) {
            Text(mood.text())
                .font(.headline)
                .padding(.all, 14)
                .foregroundColor(selectedMood == mood ? .black : .primary)
                .background(selectedMood == mood ? Color.white : Color.clear)
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color(red: 1, green: 1, blue: 1, opacity: 0.5))
        .cornerRadius(50)
        .shadow(radius: 4)
    }
}


struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
            .environmentObject(SongManager())
    }
}
