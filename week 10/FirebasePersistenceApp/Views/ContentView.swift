import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UserViewModel()
    @State private var name = ""
    @State private var age = ""

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.users) { user in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text("Age: \(user.age)")
                                .font(.subheadline)
                        }
                        Spacer()
                        Button(action: {
                            viewModel.deleteUser(id: user.id)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }

                HStack {
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Age", text: $age)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    Button("Add") {
                        if let ageInt = Int(age), !name.isEmpty {
                            viewModel.addUser(name: name, age: ageInt)
                            name = ""
                            age = ""
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .navigationTitle("Users")
        }
    }
}
