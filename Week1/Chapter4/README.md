## 4장

> 82, 83 페이지

### 수정 전

```swift
@IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
    if let text = textField.text where !text.isEmpty {
      celsiusLabel.text = text
    } else {
      celsiusLabel.text = "???"
    }
}
```

### 수정 후

```swift
@IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    if let text = textField.text, !text.isEmpty {
      celsiusLabel.text = text
    } else {
      celsiusLabel.text = "???"
    }
}
```

### 근거

*  [Swift 4 Language Guide](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html)
  * Optional Binding
    * Swift 3 이 후, if let문에서 `where` 대신 `,`을 사용하도록 변경 됨
* [Start Developing iOS Apps (Swift)](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html)
  * Connect the UI to Code
    * iOS 10에서는 Action 함수의 sender는 함수를 호출할 때 사용하는 파라미터  `_` 사용해 생략


> 87 페이지

### 수정 전

```swift
@IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
    if let text = textField.text, value = Double(text) {
      fahrenheitValue = value
    } else {
      fahrenheitValue = nil
    }
}
```

### 수정 후

```swift
@IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
    if let text = textField.text, let value = Double(text) {
      fahrenheitValue = value
    } else {
      fahrenheitValue = nil
    }
}
```

### 근거

* [Swift 4 Language Guide](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html)
  * Optional Binding
    * Swift 3 이 후, if let문에서 var와 let의 생략이 불가능




> 88 페이지

### 수정 전

```swift
let numberFormatter: NSNumberFormatter = {
    let nf = NSNumberFormatter()
    nf.numberStyle = .DecimalStyle
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
}()
```

### 수정 후

```swift
let numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.minimumFractionDigits = 0
    numberFormatter.maximumFractionDigits = 1
    return numberFormatter
}()
```

### 근거

* Swift API Design Guidelines
  * Naming
    * Promote Clear Usage
* Foundation의 NSNumber Formatter의 Swift 클래스 이름 변경
  * NSNumberFormatter -> [NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
* Enum의 case명명법 변경
  * UpperCamelCase -> lowerCamelCase
  * The Swift Programming Language(Language Guide)
    * [Enumerations](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html)
      * Enumeration Syntax



> 90, 91 페이지

### 수정 전

```swift
func textField(textField: UITextField, shouldChangeCharactersIn shouldChangeCharactersInRange: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        if  existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
```

### 수정 후

```swift
func textField(_ textField: UITextField, shouldChangeCharactersIn shouldChangeCharactersInRange: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if  existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
```

### 근거

- [Start Developing iOS Apps (Swift)](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html)
  - Connect the UI to Code
    - iOS 10에서는 Action 함수의 sender는 함수를 호출할 때 사용하는 파라미터  `_` 사용해 생략
- Foundation의 String의 rangeOfString 메서드명 및 인터페이스 변경
  - .rangeOfString(`String`) -> .range(of: `String`)

