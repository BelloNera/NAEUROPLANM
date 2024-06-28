import SwiftUI

struct Mood: View {
    let moods = ["Happy", "Sad", "Angry", "Neutral"]
    let colors: [Color] = [
        Color(UIColor.systemYellow.withAlphaComponent(0.6)), //pastelne boje array
        Color(UIColor.systemBlue.withAlphaComponent(0.6)),
        Color(UIColor.systemRed.withAlphaComponent(0.6)),
        Color(UIColor.systemGray.withAlphaComponent(0.6))
    ]
    @State private var selectedMood: String = ""
    @State private var moodCounts: [String: Int] = ["Happy": 0, "Sad": 0, "Angry": 0, "Neutral": 0]
    @State private var totalClicks = 0
    @State private var moodSequence: [String] = []
    @State private var currentFact: String = ""
    @State private var currentMessage: String = ""
    
    let maxClicks = 10
    
    let moodFacts: [String: [String]] = [
        "Happy": [
            "Happy people are more likely to have stronger immune systems.",
            "Happiness can improve heart health and lower blood pressure.",
            "Engaging in acts of kindness can increase happiness levels.",
            "Regular physical activity can boost happiness.",
            "Happiness can enhance creativity and problem-solving skills."
        ],
        "Sad": [
            "Sadness is a natural response to loss or disappointment.",
            "Experiencing sadness can help people process and cope with difficult events.",
            "Listening to music can help alleviate feelings of sadness.",
            "Crying can be a healthy way to release emotional pain.",
            "Sadness can deepen empathy and compassion for others."
        ],
        "Angry": [
            "Anger is a natural emotion that signals when something is wrong.",
            "Expressing anger healthily can prevent it from building up and causing harm.",
            "Deep breathing and mindfulness can help manage anger.",
            "Physical exercise can reduce feelings of anger and frustration.",
            "Understanding the root cause of anger can lead to personal growth."
        ],
        "Neutral": [
            "A neutral mood can help in making unbiased decisions.",
            "Being emotionally neutral can sometimes be a sign of mental clarity.",
            "Neutrality can help in resolving conflicts by seeing both sides.",
            "Practicing mindfulness can maintain a balanced, neutral state of mind.",
            "Neutrality can be a baseline for emotional stability."
        ]
    ]

    let moodMessages: [String: [String]] = [
        "Happy": [
            "Keep spreading joy wherever you go!",
            "Remember to cherish and savor these happy moments.",
            "Your happiness is contagious; keep shining!",
            "Stay grateful for the little things that bring you joy.",
            "Happiness is not a destination, but a way of life."
        ],
        "Sad": [
            "It's okay to feel sad; give yourself time to heal.",
            "Remember that this too shall pass.",
            "Talk to someone you trust about your feelings.",
            "Engage in activities that you enjoy to lift your spirits.",
            "Take care of yourself; self-compassion is important."
        ],
        "Angry": [
            "Take a deep breath and count to ten before reacting.",
            "Channel your anger into something productive.",
            "Remember, it’s okay to walk away from a situation to cool off.",
            "Express your feelings calmly and assertively.",
            "Use your anger as a motivator for positive change."
        ],
        "Neutral": [
            "Staying neutral can help you see situations more clearly.",
            "Use this balanced time to reflect and recharge.",
            "Sometimes, neutrality can bring the peace you need.",
            "Enjoy the calm and stability of a neutral state.",
            "Being neutral can be a strength in challenging times."
        ]
    ]
/////////////////////////
    var body: some View {
        VStack{
            Spacer()
        VStack {
           
            Text("Mood")
                .font(.title)
                .padding(.top, 30)
                .bold()
            
            VStack(spacing: 16) {
                ForEach(moods.indices, id: \.self) { index in
                    Button(action: {
                        if totalClicks < maxClicks {
                            selectedMood = moods[index]
                            moodCounts[moods[index]]! += 1
                            totalClicks += 1
                            moodSequence.append(moods[index])
                            currentFact = moodFacts[moods[index]]?.randomElement() ?? ""
                            currentMessage = moodMessages[moods[index]]?.randomElement() ?? ""
                        }
                    }) {
                        Text(moods[index])
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(colors[index])
                            .cornerRadius(30)
                            .frame(maxWidth: .infinity)
                    }
                    .disabled(totalClicks >= maxClicks)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            .frame(maxHeight: .infinity)
            
            if !moodSequence.isEmpty {
                ProgressBar(moodSequence: moodSequence, colors: colors)
                    .frame(height: 20)
                    .padding(.horizontal, 20)
            }
            
            if !currentFact.isEmpty && !currentMessage.isEmpty { //pisanje facts and messages in text
                VStack(spacing: 16) {
                    Text("\(currentFact)")
                        .italic()
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        
                    
                    Text(" \(currentMessage)")
                        .italic()
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                       
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
        }
        .padding(.vertical, 20)
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ProgressBar: View {
    let moodSequence: [String]
    let colors: [Color]
    
    var body: some View {
        GeometryReader { geometry in
            let totalWidth = geometry.size.width - 40
            let unitWidth = totalWidth / CGFloat(moodSequence.count)
            
            HStack(spacing: 0) {
                ForEach(moodSequence.indices, id: \.self) { index in
                    Rectangle()
                        .foregroundColor(pastelColor(for: moodSequence[index]))
                        .frame(width: 35, height: 20)
                        .cornerRadius(15)
                }
            }
        }
    }
    ////oynacava boju
    func pastelColor(for mood: String) -> Color {
        switch mood {
        case "Happy":
            return Color(UIColor.systemYellow.withAlphaComponent(0.6))
        case "Sad":
            return Color(UIColor.systemBlue.withAlphaComponent(0.6))
        case "Angry":
            return Color(UIColor.systemRed.withAlphaComponent(0.6))
        case "Neutral":
            return Color(UIColor.systemGray.withAlphaComponent(0.6))
        default:
            return .clear
        }
    }
}
    }

struct Mood_Previews: PreviewProvider {
    static var previews: some View {
        Mood()
    }
}
