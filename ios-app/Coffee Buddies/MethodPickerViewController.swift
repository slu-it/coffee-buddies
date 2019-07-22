import UIKit

class MethodPickerViewController : NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var dataModel: [Method]
    private var currentSelection: Method
    
    // TODO: refresh mechanism if data model is dynamic
    override init() {
        dataModel = Array(arrayLiteral: RandomMethod())
        for groupCategory in getGroupCategories() {
            dataModel.append(GroupBasedMethod(groupCategory))
        }
        currentSelection = dataModel[0]
    }
    
    func getSelectedMethod() -> Method {
        return currentSelection
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataModel.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataModel[row].getLabel()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentSelection = dataModel[row]
    }
    
}
