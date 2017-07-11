# Design patterns in Cocoa touch

## Cocoa Touch란?

Cocoa Touch란...

## Cocoa Touch에서 사용되는 디자인 패턴들

### Facade 패턴
서브 시스템의 인터페이스들의 통일된 인터페이스 묶음을 제공한다.

**Cocoa Touch Example**
`NSImage`라고는 나와있는데 `UIKit`으로 치면 `UIImage`와 상응하긴 함.  비트 맵 기반 (예 : JPEG, PNG 또는 TIFF 형식) 또는 벡터 기반 (EPS 또는 PDF 형식) 일 수 있는 이미지 로드 및 사용을 위한 통합 인터페이스를 제공.

### Mediator 패턴
`Object` 세트가 어떻게 상호작용하는지 캡슐화 하는 오브젝트를 정의한다. `Mediator`는 객체간 명시적으로 참조를 막도록 함으로써 느슨한 결합을 촉진한다. 그리고 객체간 상호작용을 독립적으로 변형할 수 있게 한다. 이로써 객체들은 재사용성이 높아진다.

`Mediator Object`는 시스템 내의 `Object`간에 복잡한 통신 및 컨트롤 로직을 중앙 집중화한다.  `Object`는 상태가 변경되면 `Mediator Object`에 알리고 `Mediator`의 요청에 응답한다. 

**Cocoa Touch Example**
`UIViewController`. `UIKit Framework`에서는 `UIViewController`의 하위 클래스로 `UINavigationController`와 `UITabBarController`를 제공함으로써 네비게이션바와 툴바 객체를 관리할 수 있도록 한다. `ToolbarController`는 다수의 `NavigationController`를 관리 할 수 ​​있으며, 각 `NavigationController`는 하나 이상의 `ViewController`를 관리 할 수 ​​있으며 각 `ViewController`는 연관된 `View Object`와 함께 관리됩니다.

### Observer 패턴
한 객체가 상태를 변경하면 모든 종속 객체에게 자동으로 통지되고 갱신되도록 객체간의 일. 대 다 의존성을 정의한다. `Observer` 패턴은 주체와 관찰자가 느슨하게 결합 된 `publish - subscribe model`이다.

**Cocoa Touch Example**
* Notifications

* KVO(Key - Value Observing)
