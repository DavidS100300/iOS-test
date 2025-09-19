import Foundation
import FirebaseFirestore

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    private var db = Firestore.firestore()

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        db.collection("users").addSnapshotListener { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.map { doc -> User in
                let data = doc.data()
                let name = data["name"] as? String ?? ""
                let age = data["age"] as? Int ?? 0
                return User(id: doc.documentID, name: name, age: age)
            }
        }
    }

    func addUser(name: String, age: Int) {
        db.collection("users").addDocument(data: [
            "name": name,
            "age": age
        ])
    }

    func updateUser(id: String, newAge: Int) {
        db.collection("users").document(id).updateData([
            "age": newAge
        ])
    }

    func deleteUser(id: String) {
        db.collection("users").document(id).delete()
    }
}
