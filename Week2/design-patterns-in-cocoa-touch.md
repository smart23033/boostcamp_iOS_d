# Design patterns in Cocoa touch

## Cocoa Touch란?

Cocoa Touch란...

## Cocoa Touch에서 사용되는 디자인 패턴들

* ### Facade 패턴

  서브 시스템의 인터페이스들의 통일된 인터페이스 묶음을 제공한다.

  #### Cocoa Touch Example

  `NSImage`라고는 나와있는데 `UIKit`으로 치면 `UIImage`와 상응하긴 함.  비트 맵 기반 (예 : JPEG, PNG 또는 TIFF 형식) 또는 벡터 기반 (EPS 또는 PDF 형식) 일 수 있는 이미지 로드 및 사용을 위한 통합 인터페이스를 제공.

  ​

* ### Mediator 패턴

  `Object` 세트가 어떻게 상호작용하는지 캡슐화 하는 오브젝트를 정의한다. `Mediator`는 객체간 명시적으로 참조를 막도록 함으로써 느슨한 결합을 촉진한다. 그리고 객체간 상호작용을 독립적으로 변형할 수 있게 한다. 이로써 객체들은 재사용성이 높아진다.

  `Mediator Object`는 시스템 내의 `Object`간에 복잡한 통신 및 컨트롤 로직을 중앙 집중화한다.  `Object`는 상태가 변경되면 `Mediator Object`에 알리고 `Mediator`의 요청에 응답한다. 

  #### Cocoa Touch Example

  `UIKit Framework`에서는 `UIViewController`의 하위 클래스로 `UINavigationController`와 `UITabBarController`를 제공함으로써 네비게이션바와 툴바 객체를 관리할 수 있도록 한다. `ToolbarController`는 다수의 `NavigationController`를 관리 할 수 있으며, 각 `NavigationController`는 하나 이상의 `ViewController`를 관리 할 수 있으며 각각은 연관된 `View` 객체와 함께 관리됩니다.

  ​

* ### Observer 패턴

  한 객체가 상태를 변경하면 모든 종속 객체에게 자동으로 통지되고 갱신되도록 객체간의 일. 대 다 의존성을 정의한다. `Observer` 패턴은 주체와 관찰자가 느슨하게 결합 된 `publish - subscribe model`이다.

  #### Cocoa Touch Example

  ##### Notifications

  프로그램의 객체는 자신이나 다른 객체를 전역으로 식별되는 하나 이상의 `Notifiaction`의 `Observer` 목록에 추가한다. 다른 객체에 알리고 싶은 객체는 `Notification` 객체를 생성하여 `Notification Center`에 게시하고, `Notification Center`가 특정 `Observer`에게 전송한다. 

  사용자 인터페이스 요소가 프로그램의 다른 위치에있는 특정 이벤트를 기반으로 정보를 표시하는 방법을 변경하는 `Notification`을 브로드캐스팅 할 수 있다. 또는 문서 창을 닫을 때 문서 객체가 상태를 저장하는지 확인하는 방법으로 `Notification`을 사용할 수 있다. 알림의 일반적인 목적은 다른 객체에 프로그램 이벤트를 알리고 적절하게 응답 할 수 있게하는 것이다.

  그러나 알림을 수신하는 객체는 이벤트가 발생한 후에만 ​​반응 할 수 있다. 이것은 `delegation`과 큰 차이점이다. `delegate`은 `delegating object`가 제안한 작업을 거부하거나 수정할 기회를 얻는데 반해, `observing obejct`는 임박한 조작에 직접적으로 영향을 미치지 않습니다.

  ##### KVO(Key - Value Observing)

  객체가 다른 객체의 특정 Property에 대한 변경 사항을 통지 할 수있게하는 메커니즘이다. 이것은 Foundation Framework에 `NSKeyValueObserving` 프로토콜을 기반으로합니다. `MVC` 패턴과 관련하여 `KVO`는 `View` 객체가 `Controller` 레이어를 통해 `Model` 객체의 변경사항을 관찰할 수 있도록 하기 때문에 특히 중요합니다.

  `KVO`는 `Notificatoin` 매커니즘과 비슷하긴 하지만 같지는 않다. `KVO`는 `Notification`과 달리 중앙에서 관장하는 객체가 존재하지 않는다. 대신 변경 사항에 대한 알림이 관찰 대상에 직접 전송된다. `KVO`는 특정 객체의 Property와 직접 연결된다. 반면 `Notification` 메커니즘은 프로그램 이벤트와 더 광범위하게 관련되어있다.

  ​

* ### Composite Pattern

  Composite 패턴은 관련 오브젝트들을 하나의 트리 구조로 구성하여 부분-전체 계층을 표현하는 패턴으로, 이 패턴은 클라이언트가 단일 객체와 복합 객체를 모두 동일한 방법으로 다루도록 한다.

  #### Cocoa Touch Example

  Composite 패턴은 Cocoa touch에서 View Hierarchy를 구성하는데 사용되고 있다. 먼저 아래 그림을 보자.

  ![composite](./Resources/view-hierarchy.png)

  Window 위의 `View`들은 내부적으로 또 다른 View hierarchy로 구조화된다. hierarchy의 루트는 Window와 Content view가 있다. Content View에 추가된 View들은 Content View들의 subview가 되고, 새로 추가된 view들의 Superview가 된다. Content view를 제외하고 View에는 하나의 superview와 여러 개의 subview가 존재한다. 위의 그림은 이러한 내용을 보여주고 있다.

  view hierarchy는 드로잉과 이벤트 핸들링을 처리하는 구조적인 아키텍쳐이다. view에는 그래픽 작업이 수행되는데 영향을 주는 `Frame`과 view의 `Bounds`라는 두 개의 bounding rectangle이 있다. Frame은 외부 경계인데, 뷰를 super view 좌표 시스템에서 view를 찾아 크기를 정의하고, 뷰의 가장자리를 그리는 클립을 만든다. Bounds는 해당 View가 그려지는 표면의 내부 좌표 시스템을 정의한다. 

  Window가 디스플레이를 위한 준비를 위해 windowing system을 요청받을 때, 수퍼 뷰는 서브 뷰 이전에 렌더링을 요청받게 된다. 일부 메시지를 view로 보내면 (예를 들어 view에서 view를 다시 그리도록 요청하는 메시지) 메시지는 subview로 전파된다. 따라서 뷰 계층 구조의 한 부분을 통합 뷰로 처리할 수 있다.

  view hierarchy는 또한 이벤트 및 액션 메시지를 처리하기 위해 responder chain에서 사용된다.

  그래서 프로그래머는 프로그래밍 또는 인터페이스 빌더를 이용해 view hierarchy에 언제든 view를 추가할 수 있다.

  ​

* ### Iterator Pattern

  Iterator Pattern은 collection같은 aggregate object의 elements들에 순차적으로 접근하는 방법을 제공한다. Iterator Pattern은 iterator object에 collection으로부터 collection의 element들에 접근하는 책임을 전달한다. Iterator는 collection eletment로의 접근에 대한 인터페이스를 정의하고 현재 element의 내용을 가진다. iterator마다 traversal 정책은 다를 수 있다.

  #### Cocoa Touch Example

  Foundation 프레임워크의 Enumerator class가 Iterator pattern으로 구현되었다. Enumerator class의 concrete subclass는 enumerator object를 리턴하는데, 이는 array, set, dictionary와 같은 다양한 collection 타입의 순차적인 traversal을 가능하게 한다.

  ​

* ### Decorator Pattern

  Decorator Pattern은 오브젝트에 추가적인 책임을 동적으로 할당한다. 다시 말해, decorator는 유연하게 subclassing(기능 확장)을 위한 대안을 제공한다. subclassing을 함으로서, Decorator pattern의 어댑터는 현재 존재하는 코드의 수정 없이 새로운 기능을 추가할 수 있게 한다. Decorator들은 객체를 감싸 객체의 행동을 확장한다. 또한 Decorator는 래핑 된 객체와 동일한 인터페이스를 구현하고 래핑 된 객체에 작업을 위임하기 전이나 후에 고유한 행동을 추가한다. Decorator Pattern은 OCP(Open Close Principle)를 표현한다.

  #### Cocoa Touch Example

  Cocoa touch의 NSAttributedString, CollectionView, TableView, UIDatePicker등에서 사용되었다. 

  ​

* ### Chain of Responsibility

  Chain of Responsibility Pattern은 두 개 이상의 개체에 요청을 처리할 수 있도록 하여 요청을 보내는 sender로부터 요청을 받는 receiver와의 결합을 없앤다. 이 패턴은 receiving 객체를 연결하여 체인을 만든다. 그리고 이 체인을 통해서 요청을 받을 객체에 메시지를 전달할 수 있다. 체인의 각 오브젝트들은 request를 받아 처리하거나 chain의 다음 오브젝트로 request를 전달한다.

  #### Cocoa Touch Example

  UIKit에서는 responder chain을 이와 같은 방법으로 구현하고 있다. (AppKit(OS X)에서의 구현과는 다소 차이가 있다고 한다.) 유저에 의해 Event가 발생하면, UI Application Object는 다음 responder인 UIWindwow에게 전달하고, 같은 방식으로 반복하여 **first responder object**를 찾는다. 만약 first responder object가 해당 이벤트를 처리하지 못하면, 다시 Responder Chain을 타고 UIApplication Object로 event를 전달하여 여기서 이벤트를 drop한다.

  ​

* ### Abstract Factory Pattern

  세부 클래스를 지정하지 않고 관련 객체 또는 종속 객체의 패밀리를 생성할 수 있는 인터페이스를 제공하는 디자인 패턴

  **클래스 클러스터 (Class Cluster)** 라고도 부르며 객체를 생성하는 시점에 사용하는 특정한 클래스가 내부의 여러 하위 클래스를 추상화하여 생성하는 데이터에 따라 적합한 내부 클래스로 객체 인스턴스를 생성해준다.

  또한 추상 팩토리 클래스 패턴은 확장에 매우 용의한 패턴으로 쉽게 다른 서브 클래스들을 확장할 수 있다.

  #### Cocoa Touch Example

  Foundation 프레임워크의 상당수 클래스는 클래스 클러스터로 구현되어 있다.

  대표적인 예로 NSNumber 클래스가 있는데 여러 타입을 하나의 클래스로 추상화해서 다룰 수 있도록 구현되어 있다.

  ![NSNumber](./Resources/ClassCluster_NSNumber.png)

  ​

* ###  Singleton Pattern

  해당 클래스에게 전역에서 접근할 수 있는 단 하나의 인스턴스를 생성하는 디자인 패턴

  전역에서 접근이 가능하므로 다른 객체들이 서로 공유해서 사용할 수 있다.

  #### Cocoa Touch Example

  Cocoa touch 프레임워크에서는 '공유 인스턴스(shared instance)'라는 용어를 사용한다. 대표적인 예시로 UIApplication와 NSFileManager Class 가 있다.

  * **UIApplictaion Class**

    모든 iOS앱에서 UIApplication Class는 UIApplication 싱글턴 객체를 생성한다.

     (이렇게 생성된 객체는 앱의 이벤트 전달과 액션 처리를 위한 무한 루프를 가지고 있다.)

  ​

* ###  Adapter Pattern

  인터페이스 호환성의 문제로 같이 쓸 수 없는 클래스들을 연결해서 쓸 수 있게 해주는 디자인 패턴

  한 클래스의 인터페이스를 클라이언트에서 사용하고자 하는 다른 인터페이스로 변환해준다.

  #### Cocoa Touch Example

  Cocoa Touch 프레임워크에서는 Protocol을 이용하여 Adapter패턴을 구현한다.

  간단한 예로 NSCoding이라는 프로토콜이 있는데 NSCoding 프로토콜은  NSKeyedArchiver를 이용하여 클래스를 저장하고자 할 때 저장하려는 클래스가 NSCoding 프로토콜에 따라 구현 되어야 한다. 이 프로토콜을 구현한 클래스는 NSKeyedArchiver를 사용할 수 있게 되므로, 여기서 NSCoding 클래스가 Adapter Pattern 이 된다.

  그 외 Protocol 친숙한 예시로는 UITableViewDelegate, UIScrollViewDelegate, 등이 있다.

* ### Template pattern

  Template Method 패턴은 코코아의 기본 설계이며, 일반적으로 객체 지향 프레임 워크입니다. Cocoa의 패턴은 프로그램의 커스텀 컴포넌트를 스스로 알고리즘에 집어 넣을 수 있지만 프레임 워크 컴포넌트는 필요할 때와 방법을 결정합니다. Cocoa 클래스의 프로그래밍 인터페이스에는 종종 하위 클래스에 의해 재정의 될 메서드가 포함됩니다. 일반 메서드는 사용자 지정 코드에 대한 구조를 제공하여 프로그램 별 동작과 데이터를 프레임 워크 클래스에 의해 실행되고 조정되는 작업에 제공합니다

  ​

  #### Cocoa Touch Example

  뷰 컨트롤러에 템플레이트 메소드 패턴을 사용하는것은 매우 일반적이고 유용합니다. “기본 알고리즘”을 구현하는 기본 클래스 뷰 컨트롤러가 있는 경우 유용하다?

  UIViewController 에서 하위클래스로 viewDidLoad, viewWillAppear 등과 같은 “ 뷰 컨트롤러 알고리즘”의 라이프사이클 메서드를 재정의 할 때 템플릿 메서드 패턴을 엄격하게 준수하지 않습니다. 후크 방법(추상메서드)을 사용하고 구현하지 않기로 결정한 경우에는 아무 것도 깨드릴 수 없습니다.

  모든 UIViewController가 라이프 사이클의 알고리즘을 가지고 있으며 어떤 subsclass도 그 알고리즘의 순서를 깨지 않고 특정 메소드를 오버라이드 할 수 있다는 아이디어를 표현합니다.

* ### Strategy pattern

  전략 패턴은 알고리즘군을 정의하고 각각을 캡슐화하여 교환해서 사용할 수 있도록 만듭니다. 전략 패턴을 활용하면 알고리즘을 사용하는 클라이언트와는 독립적으로 알고리즘을 변경할 수 있습니다.

  #### Cocoa Touch Example

  뷰와 뷰 컨트롤러에서 사용됨.

  컨트롤러 객체는 하나 혹은 그 이상의 뷰에 대한 전략을 구현한다. 뷰는 스스로의 역할을 시각적인 측면을 유지하는 데에만 제한하고, 인터페이스 동작에 대한 처리는 컨트롤러에게 위임한다.

* ### Command Pattern

  객체의 형태로 캡슐화 하여 사용자가 보낸 요청을 나중에 이용할 수 있도록 매서드 이름, 매개변수 등 요청에 필요한 필요한 정보를 저장 또는 로깅,취소할 수 있게 하는 패턴입니다.

  #### Cocoa Touch Example

  Target-Action 패턴을 설명하기에 가장 적당한 것으로 ‘버튼’ 이 있습니다.

  버튼이 눌리면 핸들러로 등록된 어떤 메소드를 실행시켜야 합니다. 이 때 시행이 될 객체와 객체의 메소드를 미리 등록을 시킵니다. (이게 ‘타겟’) 이제 버튼을 누르면 (이게 ‘액션’ 이다.) 타겟으로 등록된 메소드를 실행시킵니다.

  Gof의 커맨드패턴에 적용하면

  실행을 시킬 타겟을 미리 설정해두고 (Command pattern에서는 타겟을 클래스로 만듭니다.) 이것을 나중에 실행을 시킵니다. 해당 구조를 위해서는 다음 두가지가 필요합니다.

  타겟을 설정하는 방법

  타겟으로 설정된 것을 호출하는 방법

  이런 구조를 제공하는 방법 중 하나가  NSInvocation (Objective-C)이다. 많은 인수와 변형이 있는 메시지를 반복하는 데 유용합니다. 각 메시지에 대해 약간 다른 식을 다시 입력하는 대신 NSInvocation 객체를 매번 필요에 따라 수정하여 새 대상에 전달합니다.