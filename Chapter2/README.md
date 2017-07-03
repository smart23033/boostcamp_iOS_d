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
