import SwiftUI
import CoreData

struct CreateEventView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.dismiss) var dismiss
    @State private var selectedImage: UIImage?
    @State private var isPickerPresented: Bool = false
    
    @State private var eventTitle: String = ""
    @State private var club: String = "Indiranagar Run Club"
    @State private var selectedDateStart: Date = Date()
    @State private var selectedDateEnd: Date = Date()
    @State private var location: String = ""
    @State private var description: String = ""
    
    @State private var showAlert: Bool = false
    @State private var fieldErrors: [Field: Bool] = [
        .eventTitle: false,
        .location: false,
        .description: false
    ]
    
    enum Field {
        case eventTitle
        case location
        case description
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Image Placeholder and Picker
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemGray6))
                            .frame(height: 200)
                        
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(12)
                        } else {
                            VStack {
                                Image(systemName: "photo.on.rectangle.angled")
                                    .font(.system(size: 64))
                                    .foregroundColor(.gray)
                                Button(action: {
                                    isPickerPresented = true // Show the image picker
                                }) {
                                    Text("Add Photo")
                                        .font(.body)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        TextField("Event Title *", text: $eventTitle)
                            .padding()
                            .background(fieldErrors[.eventTitle]! ? Color.red.opacity(0.3) : Color(.systemGray6))
                            .cornerRadius(8)
                        
                        TextField("Enter Event Location *", text: $location)
                            .padding()
                            .background(fieldErrors[.location]! ? Color.red.opacity(0.3) : Color(.systemGray6))
                            .cornerRadius(8)
                        
                        // Start Date Picker
                        VStack(alignment: .leading) {
                            Text("Start Date *")
                                .font(.headline)
                            DatePicker(
                                "Select Start Date",
                                selection: $selectedDateStart,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .labelsHidden() // Hides the label to keep the layout clean
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        }
                        
                        // End Date Picker
                        VStack(alignment: .leading) {
                            Text("End Date *")
                                .font(.headline)
                            DatePicker(
                                "Select End Date",
                                selection: $selectedDateEnd,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .labelsHidden()
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        }
                        
                        Text("Add Description *")
                            .font(.headline)
                        
                        TextEditor(text: $description)
                            .frame(height: 120)
                            .padding()
                            .background(fieldErrors[.description]! ? Color.red.opacity(0.3) : Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if validateFields() {
                            createEvent()
                            dismiss()
                        } else {
                            fieldErrors[.eventTitle] = eventTitle.isEmpty
                            fieldErrors[.location] = location.isEmpty
                            fieldErrors[.description] = description.isEmpty
                            showAlert = true
                        }
                    }) {
                        Text("Create Event")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Error"),
                            message: Text("Please fill all required fields."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Create New Event")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .sheet(isPresented: $isPickerPresented) {
                MediaPicker(selectedImage: $selectedImage)
            }
        }
    }
    
    private func validateFields() -> Bool {
        return !eventTitle.isEmpty && !location.isEmpty && !description.isEmpty
    }
    
    private func createEvent() {
        let mediaPath = saveImageToDocumentsDirectory(image: selectedImage)
        let event = Event(context: context)
        event.location = location
        event.eventName = eventTitle
        event.startDate = formattedDate(selectedDateStart)
        event.endDate = formattedDate(selectedDateEnd)
        event.mediaPath = mediaPath
        event.descriptionText = description
        
        do {
            try context.save()
            print("Event saved successfully!")
        } catch {
            print("Failed to save event: \(error.localizedDescription)")
        }
    }
    
    private func saveImageToDocumentsDirectory(image: UIImage?) -> String? {
        guard let image = image else { return nil }
        
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            let fileManager = FileManager.default
            let directoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = directoryURL.appendingPathComponent("\(UUID().uuidString).jpg")
            
            do {
                try imageData.write(to: fileURL)
                return fileURL.path
            } catch {
                print("Error saving image: \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
