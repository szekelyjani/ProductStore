//
//  AccountView.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 02..
//

import SwiftUI

struct AccountView: View {
    @StateObject private var accountStore = AccountStore()
    @FocusState private var focusedTextField: FormTextField?

    enum FormTextField {
        case firstName, lastName, email
    }

    var body: some View {
        NavigationView {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $accountStore.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)

                    TextField("Last Name", text: $accountStore.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)

                    TextField("Email", text: $accountStore.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.done)
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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusedTextField = nil
                    }
                }
            }
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
