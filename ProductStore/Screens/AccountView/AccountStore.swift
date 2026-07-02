//
//  AccountStore.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 02..
//

import Combine
import SwiftUI

final class AccountStore: ObservableObject {
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    @Published var showAlert: Bool = false

    func saveChanges() {
        guard isValidForm else {
            showAlert = true
            return
        }

        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            errorTitle = "Profile Saved"
            errorMessage = "Your profile information was successfully saved."
        } catch {
            errorTitle = "Profile Error"
            errorMessage = "There was an error saving or retrieving your profile."
        }
        showAlert = true
    }

    func retrieveUser() {
        guard let userData else { return }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            errorTitle = "Profile Error"
            errorMessage = "There was an error saving or retrieving your profile."
            showAlert = true
        }
    }

    var isValidForm: Bool {
        guard !user.firstName.isEmpty,
              !user.lastName.isEmpty,
              !user.email.isEmpty else {
            errorTitle = "Invalid Form"
            errorMessage = "Please ensure all fields in the form filled out."
            return false
        }
        guard user.email.isValidEmail else {
            errorTitle = "Invalid Email"
            errorMessage = "Please ensure your Email is correct."
            return false
        }
        return true
    }


}
