import SwiftUI

struct ContentView: View {
    
    @State var currentDate: Date = .init()
    @State var weekSlider: [[Date.WeekDay]] = []
    @State var currentWeekIndex: Int = 1
    //
    @State var selectedIndex: Int = 1    //
    @Namespace private var animation
    @State private var createWeek: Bool = false
    @State private var createNewTask: Bool = false
    @State private var isLoginViewPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0, content: {
                VStack(alignment: .leading, spacing: 0, content: {
                    HStack {
                        Text("Calendar")
                            .font(.system(size: 36, weight: .semibold))
                        Spacer()
                        NavigationLink {
                            LogIn()
                        } label: {
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .opacity(0.6)
                                .padding(.trailing, 10)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    
                    TabView(selection: $currentWeekIndex){
                        ForEach(weekSlider.indices, id: \.self) { index in
                            let week = weekSlider[index]
                            weekView(week)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: 90)
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    Rectangle().fill(Color.gray.opacity(0.1))
                        .ignoresSafeArea()
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .ignoresSafeArea()
                }
                .onChange(of: currentWeekIndex, initial: false ) { oldValue, newValue in
                    if newValue == 0 || newValue == (weekSlider.count - 1) {
                        createWeek = true
                    }
                }
                
                ScrollView(.vertical) {
                    VStack {
                        TaskView(date: $currentDate)
                    }
                    .hSpacing(.center)
                    .vSpacing(.center)
                }
                .scrollIndicators(.hidden)
                
                Spacer()
            })
            .vSpacing(.top)
            .frame(maxWidth: .infinity)
            .onAppear() {
                if weekSlider.isEmpty {
                    let currentWeek = Date().fetchWeek()
                    if let firstDate = currentWeek.first?.date {
                        weekSlider.append(firstDate.createPreviousWeek())
                    }
                    weekSlider.append(currentWeek)
                    if let lastDate = currentWeek.last?.date {
                        weekSlider.append(lastDate.createNextWeek())
                    }
                }
            }
            .overlay(alignment: .bottom) {
                HStack(spacing: 16) {
                    Spacer()
                    NavigationLink(destination: Mood()) {
                        Image(systemName: "smiley")
                            .font(.headline)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .controlSize(.mini)
                    }
                    NavigationLink(destination: MeditationView()) {
                        Image(systemName: "leaf.arrow.circlepath")
                            .font(.headline)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .controlSize(.mini)
                    }
                    NavigationLink(destination: EducationalView()) {
                        Image(systemName: "book")
                            .font(.headline)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .controlSize(.mini)
                    }
                    Spacer()
                    Button(action: {
                        createNewTask.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .frame(width: 60, height: 50)
                            .padding()
                            .background(Color.black)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    })
                    .fullScreenCover(isPresented: $createNewTask, content: {
                        NewTask()
                    })
                }
                .padding()
                .background(Color.white.opacity(0.8))
            }
        }
    }
    
    @ViewBuilder
    func weekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 0) {
            ForEach(week) { day in
                VStack {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.system(size: 20))
                        .frame(width: 50, height: 55)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .black)
                        .background(content: {
                            if isSameDate(day.date, currentDate) {
                                RoundedRectangle(cornerRadius: 15).fill(.purple).offset(y: 3)
                                    .matchedGeometryEffect(id: "TABINFICATOR", in: animation)
                            }
                            if day.date.isToday {
                                Circle().fill(.white).frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                            }
                        })
                }
                .hSpacing(.center)
                .onTapGesture {
                    withAnimation(.snappy) {
                        currentDate = day.date
                    }
                }
            }
        }
        .background {
            GeometryReader {
                let minX = $0.frame(in: .global).minX
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self, perform: { value in
                        if value.rounded() == 15 && createWeek {
                            paginateWeek()
                            createWeek = false
                        }
                    })
            }
        }
    }
    /*
     func paginateWeek() {
     if weekSlider.indices.contains(currentWeekIndex) {
     if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
     let previousWeek = firstDate.createPreviousWeek()
     weekSlider.insert(previousWeek, at: 0)
     weekSlider.removeLast()
     currentWeekIndex = 1
     }
     }
     if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
     let nextWeek = lastDate.createNextWeek()
     weekSlider.append(nextWeek)
     weekSlider.removeFirst()
     currentWeekIndex = weekSlider.count - 1
     }
     }*/
    ////
    /*  func paginateWeek() {
     if weekSlider.indices.contains(currentWeekIndex) {
     if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
     let previousWeek = firstDate.createPreviousWeek()
     weekSlider.insert(previousWeek, at: 0)
     weekSlider.removeLast()
     currentWeekIndex = 0 // Update to 0 instead of 1
     }
     }
     if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
     let nextWeek = lastDate.createNextWeek()
     weekSlider.append(nextWeek)
     weekSlider.removeFirst() // Remove the first element instead of last
     currentWeekIndex = weekSlider.count - 1
     }*/
    /*func paginateWeek() {
     if weekSlider.indices.contains(currentWeekIndex) {
     if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
     let previousWeek = firstDate.createPreviousWeek()
     weekSlider.insert(previousWeek, at: 0)
     // weekSlider.removeLast()//
     selectedIndex = 0 // Update to 0 instead of 1
     }
     }
     if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
     let nextWeek = lastDate.createNextWeek()
     weekSlider.append(nextWeek)
     /*weekSlider.removeFirst() */// Remove the first element instead of last
     selectedIndex = weekSlider.count - 1
     }*/
    
    func paginateWeek() {
        if weekSlider.indices.contains(currentWeekIndex) {
            if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
                let previousWeek = firstDate.createPreviousWeek()
                weekSlider.insert(previousWeek, at: 0)
                currentWeekIndex = 1  // Update after insertion
                weekSlider.removeLast()
            } else if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
                let nextWeek = lastDate.createNextWeek()
                weekSlider.append(nextWeek)
                currentWeekIndex = weekSlider.count - 2  // Update after insertion
                weekSlider.removeFirst()
            }
        }
    }
    
}


  #Preview {
      ContentView()
  }
