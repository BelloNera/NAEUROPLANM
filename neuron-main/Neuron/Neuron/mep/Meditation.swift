import SwiftUI

struct MeditationView: View {
    @State private var timeRemaining = 60
    @State private var isTimerRunning = false

    let timer = Timer.publish(every: 1, on:.main, in:.common).autoconnect()

    var body: some View {
        ZStack {
            Image("Med.jpg")
               .resizable()
               .scaledToFill()
               .opacity(0.6) // Adjust opacity as needed
               .clipped()
               .offset( x: UIScreen.main.bounds.height / 5, y: 0)
               

            VStack {
                Text("Meditation Timer")
                   .font(.largeTitle)
                   .fontWeight(.bold)
                   .padding()
                   .foregroundColor(.purple)
                   .opacity(0.8)
                Text("\(timeRemaining) seconds")
                   .font(.title)
                   .padding()
                   .opacity(0.8)

                Text("Breathe in and out")
                   .font(.title2)
                   .padding()
                   .opacity(0.8)

                HStack {
                    Button(action: {
                        self.startTimer()
                    }) {
                        Text("Start")
                           .padding()
                           .foregroundColor(.white)
                           .background(Color.purple)
                           .cornerRadius(10)
                    }

                    Button(action: {
                        self.stopTimer()
                    }) {
                        Text("Stop")
                           .padding()
                           .foregroundColor(.white)
                           .background(Color.purple)
                           .cornerRadius(10)
                    }
                }/////
               .padding()
               .opacity(0.8)
            }
           .onReceive(timer) { _ in
                if self.isTimerRunning {
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else {
                        self.stopTimer()
                    }
                }
            }
            .background(Color(.white)
            .opacity(0.6))
            .cornerRadius(15)
        }
    }

    func startTimer() {
        self.isTimerRunning = true
    }

    func stopTimer() {
        self.isTimerRunning = false
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
