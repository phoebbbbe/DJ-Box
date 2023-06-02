//
//  FilterView.swift
//  DJ-Box
//
//  Created by 曹芷瑜 on 2023/5/26.
//

import SwiftUI

struct FilterView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var selectedOccasion: Occasion?
    @State private var selectedMood: Mood?
    @State private var selectedHour = 0
    @State private var selectedMinute = 0
    @State private var selectedSecond = 0

    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 23/255, green: 22/255, blue: 46/255)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button(action: {
                            // action
                        }, label: {
                            Image(systemName: "line.3.horizontal")
                                .font(.system(size: 35))
                                .foregroundColor(.white)
                                .padding()
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
                                .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20.0)
                            Spacer()
                        }
                        HStack {
                            OccasionButtonView(occasion: .wedding, selectedOccasion: $selectedOccasion)
                            OccasionButtonView(occasion: .gathering, selectedOccasion: $selectedOccasion)
                            OccasionButtonView(occasion: .seminar, selectedOccasion: $selectedOccasion)
                            
                            
                        }
                        HStack {
                            OccasionButtonView(occasion: .coffee, selectedOccasion: $selectedOccasion)
                            OccasionButtonView(occasion: .awards, selectedOccasion: $selectedOccasion)
                            OccasionButtonView(occasion: .graduation, selectedOccasion: $selectedOccasion)
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
                                .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20.0)
                            Spacer()
                        }
                        HStack {
                            Picker("時", selection: $selectedHour) {
                                ForEach(0..<24, id: \.self) { hour in
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
                    Text("Selected Time: \(selectedHour)時\(selectedMinute)分\(selectedSecond)秒")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct OccasionButtonView: View {
    let occasion: Occasion
    @Binding var selectedOccasion: Occasion?
    
    var body: some View {
        Button(action: {
            selectedOccasion = occasion
        }) {
            Text(occasion.rawValue)
                .font(.headline)
                .padding(.all, 14)
                .foregroundColor(selectedOccasion == occasion ? .white : .primary)
                .background(selectedOccasion == occasion ? Color.blue : Color.clear)
                .cornerRadius(20)
        }
        .buttonStyle(PlainButtonStyle())
        .background(.white)
        .cornerRadius(20)
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
            Text(mood.rawValue)
                .font(.headline)
                .padding(.all, 14)
                .foregroundColor(selectedMood == mood ? .white : .primary)
                .background(selectedMood == mood ? Color.blue : Color.clear)
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 4)
    }
}

enum Occasion: String, CaseIterable {
    case wedding = "婚禮"
    case awards = "頒獎典禮"
    case graduation = "畢業典禮"
    case gathering = "聚會"
    case coffee = "咖啡廳"
    case seminar = "講座"
    case sports = "運動會"
    case company = "公司活動"
}

enum Mood: String, CaseIterable {
    case energetic = "活力"
    case happy = "開心"
    case calm = "平靜"
    case sad = "悲傷"
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
