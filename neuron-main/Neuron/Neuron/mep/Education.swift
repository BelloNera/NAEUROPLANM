
import SwiftUI

struct EducationalView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Understanding Time Management Through Neuroscience")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                    .padding(.bottom, 8)
                Group {
                    Text("Welcome to our Time Management App! To help you make the most of your time, it’s essential to understand how your brain works. Neuroscience, the study of the nervous system, provides valuable insights into how we can manage our time more effectively. Let’s explore some key concepts:")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionHeader("The Prefrontal Cortex: Your Planning Hub")
                    
                    Text("The prefrontal cortex, located at the front of your brain, is responsible for executive functions like planning, decision-making, and self-control. When you set goals and organize tasks, you are engaging this part of your brain.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionTip("Break down large tasks into smaller, manageable steps to reduce the cognitive load on your prefrontal cortex. This makes it easier to plan and execute your tasks.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionHeader("The Role of Dopamine: Motivation and Reward")
                    
                    Text("Dopamine is a neurotransmitter that plays a crucial role in motivation and the reward system. Completing tasks releases dopamine, which makes you feel good and motivates you to keep going.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionTip("Use a reward system to motivate yourself. After completing a task, reward yourself with something you enjoy, like a short break, a snack, or a fun activity.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionHeader("Neuroplasticity: Building Better Habits")
                    
                    Text("Neuroplasticity refers to the brain’s ability to reorganize itself by forming new neural connections. This is crucial for habit formation. By consistently practicing good time management habits, you can rewire your brain to make these behaviors automatic.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionTip("Start with small, consistent changes in your routine. Over time, these small changes will become ingrained habits.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionHeader("Managing Stress: The Amygdala and Cortisol")
                    
                    Text("The amygdala is involved in processing emotions, including stress. When you’re stressed, your body releases cortisol, which can impair cognitive functions like memory and concentration.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionTip("Incorporate stress-reducing activities into your daily routine, such as deep breathing, meditation, or exercise. These activities can help reduce cortisol levels and improve your focus.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionHeader("The Power of Sleep: Memory and Learning")
                    
                    Text("Sleep is vital for brain function, particularly for memory consolidation and learning. During sleep, your brain processes and stores information from the day.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionTip("Prioritize getting enough sleep each night. Aim for 7-9 hours to ensure your brain is well-rested and ready to tackle the day’s tasks.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionHeader("The Importance of Breaks: The Default Mode Network")
                    
                    Text("The Default Mode Network (DMN) is a network of brain regions that becomes active when you’re not focused on the outside world. Taking breaks allows your DMN to process information and come up with creative solutions to problems.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionTip("Take regular breaks during your work sessions. Use techniques like the Pomodoro Technique, which involves working for 25 minutes and then taking a 5-minute break.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionHeader("Mindfulness and Focus: Enhancing Attention")
                    
                    Text("Mindfulness practices can enhance your ability to focus by training your brain to stay present. This reduces distractions and improves your efficiency.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    sectionTip("Practice mindfulness meditation for a few minutes each day. This can help you stay focused and improve your attention span.")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                    
                    Text("By leveraging these neuroscience principles, you can enhance your time management skills and boost your productivity. Remember, effective time management is not just about organizing your tasks, but also about understanding how your brain works and using that knowledge to your advantage. Happy managing!")
                        .fixedSize(horizontal: false, vertical: true)
                        .layoutPriority(1)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Educational View")
    }
    
    @ViewBuilder
    func sectionHeader(_ text: String) -> some View {
        Text(text)
            .font(.headline)
            .padding(.top, 8)
            .foregroundColor(.purple)
    }
    
    @ViewBuilder
    func sectionTip(_ text: String) -> some View {
        Text("Tip: \(text)")
            .italic()
            .padding(.bottom, 8)
            .foregroundColor(.purple.opacity(0.7))
    }
}



#Preview {
    EducationalView()
}
