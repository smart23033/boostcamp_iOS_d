# MVC, MVVM, MVP 디자인 패턴과 디자인 패턴의 필요성

## 개요

`MVC`, `MVP`, `MVVM` 패턴은 Application의 행동을 세 가지의 역할로 나누어 레이어를 부여한 디자인 패턴이다. 각 패턴들은 이름에서도 알 수 있듯이 MV(…)로 시작되며, 여기서 `M`, `V`, `C / P / VM`는 각각 `Model(M)`, `View(V)`, `Controller(C) / Presenter(P) / ViewModel(VM)`을 뜻한다. 각각은 다음과 같은 역할을 수행한다.

* `Model` : Data 접근을 위한 Layer 혹은 데이터 자체를 책임지는 영역
* `View` : 레이어에 표현되는 것을 책임지는 영역. 말 그대로 View와 관련된 영역.
* `Controller` / `Presenter` / `ViewModel` : View를 업데이트하는 책임과 Model을 변경하는 책임을 가지며 경우에 따라 Activity의 역할을 수행하기도 한다. 

## MVC

### 전통적인 MVC

사실 MVC 패턴 조사 과정에서 애플에서 설명하는 MVC가 전통적인 MVC와는 차이가 있다는 사실을 깨달았다. 그래서 둘의 차이를 알아보는 것이 먼저라고 생각되어 전통적인 MVC에 대해서 조사하였다. 아래 그림은, 전통적인 MVC를 설명하는 그림이다.

![traditional-mvc](./Resources/Traditional_MVC.png)

전통적인 MVC에서는 User가 View를 통해 유저 액션을 Controller에게 전달하고, CController는 Model에게 업데이트 요청을 보낸다. Model의 변경이 완료되면, Model은 View에게 변경 사항을 알리고 View는 이 내용을 바탕으로 Update된다.

### Apple's MVC


![apple-mvc](./Resources/Apple_MVC.png)

## MVP

![traditional-mvp](./Resources/MVP.png)

## MVVM

![mvvm](./Resources/MVVM.png)

## 디자인 패턴의 필요성
만약 앱을 개발할 때 디자인 패턴이란걸 준수하지 않은 채 되는대로 개발을 한다면 이 앱에서 기능이 추가되거나 수정이 필요할 때, 즉 유지 보수가 필요한 경우 어떤 문제가 발생할까?

코드에 일관성이 없고, 가독성이 떨어지기 때문에 유지 보수 자체가 매우 힘든 작업이 될 수 있다.

이러한 상황에 있어서 효율적인 개발을 위해 여러가지 디자인 패턴이라는게 존재한다.

**디자인 패턴을 이용해 앱을 설계할 경우 다음과 같은 장점이 있다.**

* 문제에 대해 효율적으로 해결이 가능하다. (디버깅이 용이하다)
* 패턴에 따라 책임 분리를 통해 코드의 재사용이 용이하다.
* 개발한 코드에 대해 테스트가 가능하다.
* 유지 보수가 용이한 코드를 짤 수 있다.
* 정형화된 패턴의 명칭을 통해 다른 개발자와 의사소통이 쉬워질 수 있다.

특정 디자인 패턴을 준수한다면 그 패턴에 따라 코드가 설계되어 있기 때문에 코드의 재사용성, 쉬운 유지보수 등 앱의 구조와 코드에 대한 질을 향상시킬 수 있다.

#### 출처

[Apple Developer MVC 문서](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html)
