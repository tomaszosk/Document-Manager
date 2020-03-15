//
//  AddDocTableViewController.swift
//  Document Manager
//
//  Created by Tomasz Oskroba on 3/5/20.
//  Copyright © 2020 Tomasz Oskroba. All rights reserved.
//

import UIKit
//import Charts

protocol AddDoc {
    func addDoc(document: DocumentStruct)
}

class AddDocTableViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var newDocument: DocumentStruct = DocumentStruct(name: "", type: "", dateAdded: "", image: UIImage(named: "blankphoto")!, category: .all)
    let docTypesArray: [String] = ["Wszystkie", "Faktura", "Paragon", "Protokół instalacyjny", "Protokół seriwsowy", "Raport końcowy z dnia", "Sprawozdanie"]
    var selectedType = ""
    var rowOfSelectedType = 0
    private var datePicker: UIDatePicker?
    private let documentDescription = ""
    
    var delegate: AddDoc?
    
    @IBOutlet weak var documentNameTextField: UITextField!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var typePickerView: UIPickerView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var scanImageView: UIImageView!
    @IBOutlet weak var importLabel: UIButton!
    
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true) {
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            scanImageView.image = image
        } else {
          return
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createTypePicker()
        createToolbar()
        createDatePicker()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddDocTableViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)

    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func createTypePicker() {
        
        let typePicker = UIPickerView()
        typePicker.delegate = self
        
        typeTextField.inputView = typePicker
        typePicker.backgroundColor = .systemFill
    }
    
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddDocTableViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        typeTextField.inputAccessoryView = toolBar
        dateTextField.inputAccessoryView = toolBar
        
        toolBar.barTintColor = .systemFill
        toolBar.tintColor = .black
    }
    
    func createDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(AddDocTableViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        dateTextField.inputView = datePicker
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        dateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func emailShareTapped(_ sender: Any) {
        
        if (documentNameTextField.text != "") && (typeTextField.text != "Wybierz typ dokumentu") && (dateTextField.text != "Wybierz datę") {
            let stringToShare = documentSharing(documentName: documentNameTextField.text!, documentType: typeTextField.text!, dateCreated: dateTextField.text!)
            let activityController = UIActivityViewController(activityItems: [stringToShare], applicationActivities: nil)
            
            activityController.completionWithItemsHandler = { (nil, completed, _, error) in
                if completed {
                    print("Completed")
                } else {
                    print("The user canceled sharing")
                }
            }
            present(activityController, animated: true)
        } else {
            presentDMLAlertOnMainThread(title: "Puste pola!", message: "Nie można udostępnić. Jedno z pól do uzupełnienia jest puste", buttonTitle: "Ok")
        }
    }
    
    @IBAction func takePictureTapped(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerController.SourceType.camera
            image.allowsEditing = false
            self.present(image, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation
     
     @IBAction func AddDocument(_ sender: UIBarButtonItem) {
        if (documentNameTextField.text != "") && (typeTextField.text != "Wybierz typ dokumentu") && (dateTextField.text != "Wybierz datę") {
            newDocument = DocumentStruct(name: documentNameTextField.text!, type: typeTextField.text!, dateAdded: dateTextField.text!, image: scanImageView.image!, category: .all)
            setTheType(row: rowOfSelectedType)
            delegate?.addDoc(document: newDocument)
            navigationController?.popViewController(animated: true)
        } else {
            presentDMLAlertOnMainThread(title: "Puste pola!", message: "Nie można dodać dokumentu. Jedno z pól do uzupełnienia jest puste", buttonTitle: "Ok")
        }
     }
    
    // MARK: Helper Methods
    
    func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            view.endEditing(true)
        }
        sender.cancelsTouchesInView = false
    }
    
    func documentSharing(documentName: String, documentType: String, dateCreated: String) -> String {
        let shareText = "Dokument o nazwie: \(documentName) i rodzaju: \(documentType) został utworzony w aplikacji dnia: \(dateCreated)"
        
        return shareText
    }
    
    func setTheType(row: Int) {
        switch row {
            case 0: newDocument.category = .all
            case 1: newDocument.category = .facture
            case 2: newDocument.category = .reciept
            case 3: newDocument.category = .summary
//            case 4: newDocument.category = .service
            case 5: newDocument.category = .report
//            case 6: newDocument.category = .dailyreport
            default: return
        }
    }
}




extension UIViewController {
    func presentDMLAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertViewController = DMAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
}

extension AddDocTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return docTypesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return docTypesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rowOfSelectedType = row
        selectedType = docTypesArray[row]
        typeTextField.text = selectedType
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .black
        label.textAlignment = .center
        
        label.text = docTypesArray[row]
        
        return label
    }
}
