import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Event.startDate, ascending: true)],
        animation: .default
    ) var events: FetchedResults<Event>
    
    @State private var selectedTab = 0
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                VStack {
                    Spacer()
                        .frame(height: 80)
                    
                    // Tabs for Events and Communities
                    Picker("", selection: $selectedTab) {
                        Text("Events").tag(0)
                        Text("Communities").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .padding(.top, 60)
                    
                    // Grid of events - a scroll view with event cards
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            if events.isEmpty {
                                Text("No events available. Add some events to get started!")
                                    .padding()
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                            } else {
                                ForEach(events) { event in
                                    EventCard(event: event)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                }
                
                // Title and subtitle at the top-left corner
                VStack(alignment: .leading, spacing: 4) {
                    Text("Delhi NCR")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Welcome to the tribe!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.top, 60)
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isSheetPresented = true
                    }) {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                    .padding(.trailing, 18)
                    .padding(.top, 11)
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                CreateEventView()
                    .environment(\.managedObjectContext, context)
            }
        }
        .onAppear {
            print("Current events: \(events.count)")
        }
    }
}

struct EventCard: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            if let mediaPath = event.mediaPath, !mediaPath.isEmpty, let image = UIImage(contentsOfFile: mediaPath) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .cornerRadius(12)
                    .clipped()
            }
            
            Text(event.eventName ?? "Unnamed Event")
                .font(.headline)
                .padding(.top, 8)
            
            Text(event.club ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(event.location ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 8)
            
            Text(event.descriptionText ?? "No description available")
                .font(.body)
                .lineLimit(3)
                .padding(.bottom, 8)
            
            HStack {
                Text("Starts: \(event.startDate ?? "")")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("Ends: \(event.endDate ?? "")")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
