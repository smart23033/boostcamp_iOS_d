# Swift 예제코드 바로잡기 3장
---

> 54 페이지

### 수정 전

```swift
override func viewDidLoad() {
	// ...
	firstView.backgroundColor = UIColor.blueColor()
	// ...
	secondView.backgroundColor = UIColor.greenColor()
	// ...
}
```

### 수정 후
```swift
	// ...
	secondView.backgroundColor = UIColor.blue
	// ...
	secondView.backgroundColor = UIColor.green
	// ...
}
```

### 근거

* Swift 3 부터 Color function이 property로 변경되었음.
