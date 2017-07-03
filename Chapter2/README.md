# boostcamp_iOS_d_SwiftNamingCorrection
Swift API Guidelines에 맞도록 교재 코드를 정정해보는 예제입니다.

## 2장
> 32 페이지

### 수정 전
```swift
var str = " Hello, playground"
```

### 수정 후
```swift
var greeting = " Hello, playground"
```

### 근거
* Swift API Design Guidelines
    * Naming
        * Promote Clear Usage

> 42 페이지
### 수정 전
```swift
for (i,string) in countingUp.enumerate(){
//    (0,"one"), (1,"two")
}
```

### 수정 후
```swift
for (i,string) in countingUp.enumerated(){
//    (0,"one"), (1,"two")
}
```

### 근거
* Swift API Design Guidelines
    * Naming
        * Strive for Fluent Usage

> 44 페이지

### 수정 전
```swift
enum PieType {
case Apple
case Cherry
case Pecan
}
```

### 수정 후
```swift
enum PieType {
case apple
case cherry
case pecan
}
```

### 근거
* Enum의 case 명명법 변경
    * UpperCamelCase -> lowerCamelCase
    * The Swift Programming Language(Language Guide)
        * [Enumerations](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html)
            * Enumeration Syntax

### 수정 전
```swift
let name: String
switch favoritePie {
    case .apple:
        name = "Apple"
    case .cherry:
        name = "Cherry"
    case .pecan:
        name = "Pecan"
}
```

### 수정 후
```swift
let name: String
switch favoritePie {
    case .apple:
        name = "Apple"
    case .cherry:
        name = "Cherry"
    case .pecan:
        name = "Pecan"
    default:
        name = "Other"
}
```

### 근거
* [Switch](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID120)
