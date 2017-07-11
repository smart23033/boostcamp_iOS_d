# Design patterns in Cocoa touch

## Cocoa Touch란?

Cocoa Touch란...

## Cocoa Touch에서 사용되는 디자인 패턴들

### Facade 패턴
서브 시스템의 인터페이스들의 통일된 인터페이스 묶음을 제공한다.

#### Cocoa Touch Example
`NSImage`라고는 나와있는데 `UIKit`으로 치면 `UIImage`와 상응하긴 함.  비트 맵 기반 (예 : JPEG, PNG 또는 TIFF 형식) 또는 벡터 기반 (EPS 또는 PDF 형식) 일 수 있는 이미지 로드 및 사용을 위한 통합 인터페이스를 제공.

### Mediator 패턴
`Object` 세트가 어떻게 상호작용하는지 캡슐화 하는 오브젝트를 정의한다. `Mediator`는 객체간 명시적으로 참조를 막도록 함으로써 느슨한 결합을 촉진한다. 그리고 객체간 상호작용을 독립적으로 변형할 수 있게 한다. 이로써 객체들은 재사용성이 높아진다.

`Mediator Object`는 시스템 내의 `Object`간에 복잡한 통신 및 컨트롤 로직을 중앙 집중화한다.  `Object`는 상태가 변경되면 `Mediator Object`에 알리고 `Mediator`의 요청에 응답한다. 

#### Cocoa Touch Example
`UIViewController`. `UIKit Framework`에서는 `UIViewController`의 하위 클래스로 `UINavigationController`와 `UITabBarController`를 제공함으로써 네비게이션바와 툴바 객체를 관리할 수 있도록 한다. `ToolbarController`는 다수의 `NavigationController`를 관리 할 수 ​​있으며, 각 `NavigationController`는 하나 이상의 `ViewController`를 관리 할 수 ​​있으며 각 `ViewController`는 연관된 `View Object`와 함께 관리됩니다.

### Observer 패턴
한 객체가 상태를 변경하면 모든 종속 객체에게 자동으로 통지되고 갱신되도록 객체간의 일. 대 다 의존성을 정의한다. `Observer` 패턴은 주체와 관찰자가 느슨하게 결합 된 `publish - subscribe model`이다.

#### Cocoa Touch Example
* Notifications
프로그램의 객체는 자신이나 다른 객체를 전역으로 식별되는 하나 이상의 `Notifiaction`의 `Observer` 목록에 추가한다. 다른 객체에 알리고 싶은 객체는 `Notification` 객체를 생성하여 `Notification Center`에 게시하고, `Notification Center`가 특정 `Observer`에게 전송한다. 

사용자 인터페이스 요소가 프로그램의 다른 위치에있는 특정 이벤트를 기반으로 정보를 표시하는 방법을 변경하는 `Notification`을 브로드캐스팅 할 수 있다. 또는 문서 창을 닫을 때 문서 객체가 상태를 저장하는지 확인하는 방법으로 `Notification`을 사용할 수 있다. 알림의 일반적인 목적은 다른 객체에 프로그램 이벤트를 알리고 적절하게 응답 할 수 있게하는 것이다.

그러나 알림을 수신하는 객체는 이벤트가 발생한 후에만 ​​반응 할 수 있다. 이것은 `delegation`과 큰 차이점이다. `delegate`은 `delegating object`가 제안한 작업을 거부하거나 수정할 기회를 얻는데 반해, `observing obejct`는 임박한 조작에 직접적으로 영향을 미치지 않습니다.

* KVO(Key - Value Observing)
객체가 다른 객체의 특정 Property에 대한 변경 사항을 통지 할 수있게하는 메커니즘이다. 이것은 Foundation Framework에 `NSKeyValueObserving` 프로토콜을 기반으로합니다. `MVC` 패턴과 관련하여 `KVO`는 `View` 객체가 `Controller` 레이어를 통해 `Model` 객체의 변경사항을 관찰할 수 있도록 하기 때문에 특히 중요합니다.

`KVO`는 `Notificatoin` 매커니즘과 비슷하긴 하지만 같지는 않다. `KVO`는 `Notification`과 달리 중앙에서 관장하는 객체가 존재하지 않는다. 대신 변경 사항에 대한 알림이 관찰 대상에 직접 전송된다. `KVO`는 특정 객체의 Property와 직접 연결된다. 반면 `Notification` 메커니즘은 프로그램 이벤트와 더 광범위하게 관련되어있다.
