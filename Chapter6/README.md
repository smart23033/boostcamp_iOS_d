## 6장

> 114 페이지



#### 수정 전

```swift
let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
segmentedControl.selectedSegmentIndex = 0

segmentedControl.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(segmentedControl)
```

#### 수정 후

```swift
let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(segmentedControl)
```

#### 근거

Swift 3 부터 Color function이 property로 변경 됨.



> 115 페이지

#### 수정 전

```swift
let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)

topConstraint.active = true
leadingConstraint.active = true
trailingConstraint.active = true
```

#### 수정 후

```swift
let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
```

#### 근거

Swift 3 부터 constraint function 이 간략화

Bool 값을 지정하는 속성 active -> isActive 



> 120 페이지

#### 수정 전

- NSLayoutAttribute.Left
- NSLayoutAttribute.Leading
- NSLayoutAttribute.Top
- NSLayoutAttribute.Width

#### 수정 후

- NSLayoutAttribute.left
- NSLayoutAttribute.leading
- NSLayoutAttribute.top
- NSLayoutAttribute.width

Swift 3 부터 NSLayoutAttribute 속성이 소문자로 변경



> 121 페이지

#### 수정 전

- UIControlEvents.TouchDown
- UIControlEvents.TouchUpInside
- UIControlEvents.ValueChanged
- UIControlEvents.EditingChanged

#### 수정 후

- UIControlEvents.touchDown
- UIControlEvents.touchUpInside
- UIControlEvents.valueChanged
- UIControlEvents.editingChanged

Swift 3 부터 UIControlEvents 속성이 소문자로 변경

