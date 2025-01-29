import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Event.startDate, ascending: true)],
        animation: .default
    ) var events: FetchedResults<Event>
    
    @State private var selectedTab = 0
    @State private var isSheetPresented = false
    @State private var gridUpdateID = UUID()  // Forces grid refresh

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Title and Subtitle
                VStack(alignment: .leading, spacing: 4) {
                    Text("Delhi NCR")
                        .font(.title2)
                        .bold()
                    Text("Welcome to the tribe!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // Tab Picker (Events & Communities)
                VStack(spacing: 0) {
                    HStack {
                        Button(action: { selectedTab = 0 }) {
                            Text("Events")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(selectedTab == 0 ? .blue : .gray)
                                .padding(.bottom, 5)
                        }
                        .frame(maxWidth: .infinity)

                        Button(action: { selectedTab = 1 }) {
                            Text("Communities")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(selectedTab == 1 ? .blue : .gray)
                                .padding(.bottom, 5)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    // Blue Underline Indicator
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 2, height: 2)
                        .foregroundColor(.blue)
                        .offset(x: selectedTab == 0 ? -UIScreen.main.bounds.width / 4 : UIScreen.main.bounds.width / 4)
                        .animation(.easeInOut(duration: 0.3), value: selectedTab)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal)
                
                // Event Cards Grid
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(events, id: \.objectID) { event in
                            EventCard(event: event)
                        }
                    }
                    .id(gridUpdateID)  // 🔹 Forces refresh when events change
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Top Right Plus Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isSheetPresented = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $isSheetPresented, onDismiss: {
                gridUpdateID = UUID()  // 🔹 Update ID when modal is dismissed
            }) {
                CreateEventView()
                    .environment(\.managedObjectContext, context)
            }
        }
    }
}

// MARK: - Event Card
struct EventCard: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            // Event Image
            if let mediaPath = event.mediaPath, let image = UIImage(contentsOfFile: mediaPath) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
                    .clipped()
            } else {
                Color.gray
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(12)
            }
            
            // Club Name with Badge
            HStack {
                Text("🏃‍♂️ By \(event.club ?? "Unknown Club")")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.top, 5)
            
            // Event Title
            Text(event.eventName ?? "Unnamed Event")
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(1)
            
            // Event Time
            HStack {
                Image(systemName: "clock")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Tomorrow, 7:00 AM")  // Placeholder for now
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // Event Location
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(event.location ?? "Unknown Location")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

// Preview
#Preview{
    HomeView()
}
