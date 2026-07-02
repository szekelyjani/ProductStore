//
//  AccountView.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 02..
//

import SwiftUI

struct AccountView: View {
    @StateObject private var accountStore = AccountStore()

    var body: some View {
        NavigationView {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $accountStore.user.firstName)
                    TextField("Last Name", text: $accountStore.user.lastName)
                    TextField("Email", text: $accountStore.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    DatePicker("Birthday",
                               selection: $accountStore.user.dateOfBirth,
                               displayedComponents: .date)
                    Button {
                        accountStore.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }

                Section("Request") {
                    Toggle("Premium Packaging", isOn: $accountStore.user.premiumPackaging)
                    Toggle("Same Day Delivery", isOn: $accountStore.user.fastDelivery)
                }
            }
            .navigationTitle("👨‍💼 Account")
            .onAppear {
                accountStore.retrieveUser()
            }
            .alert(isPresented: $accountStore.showAlert) {
                Alert(
                    title: Text(accountStore.errorTitle),
                    message: Text(accountStore.errorMessage)
                )
            }
        }
    }
}

#Preview {
    AccountView()
}
