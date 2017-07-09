# MVC, MVVM, MVP 디자인 패턴과 디자인 패턴의 필요성

## 개요

`MVC`, `MVP`, `MVVM` 패턴은 Application의 행동을 세 가지의 역할로 나누어 레이어를 부여한 디자인 패턴이다. 각 패턴들은 이름에서도 알 수 있듯이 MV(…)로 시작되며, 여기서 `M`, `V`, `C / P / VM`는 각각 `Model(M)`, `View(V)`, `Controller(C) / Presenter(P) / ViewModel(VM)`을 뜻한다. 각각은 다음과 같은 역할을 수행한다.

* `Model` : Data 접근을 위한 Layer 혹은 데이터 자체를 책임지는 영역
* `View` : 레이어에 표현되는 것을 책임지는 영역. 말 그대로 View와 관련된 영역.
* `Controller` / `Presenter` / `ViewModel` : View를 업데이트하는 책임과 Model을 변경하는 책임을 가지며 경우에 따라 Activity의 역할을 수행하기도 한다. 

## MVC

### 전통적인 MVC

사실 MVC 패턴 조사 과정에서 애플에서 말하는 MVC가 전통적인 MVC와는 차이가 있다는 사실을 알게 되었다. 그래서 둘의 차이를 알아보는 것이 필요하다고 생각했다. 아래 그림은, 전통적인 MVC를 설명하는 그림이다.

![traditional-mvc](./Resources/Traditional_MVC.png)

전통적인 MVC에서는 User가 View를 통해 유저 액션을 Controller에게 전달하고, Controller는 Model에게 업데이트 요청을 보낸다. Model의 변경이 완료되면, Model은 View에게 변경 사항을 알리고 View는 이 내용을 바탕으로 Update된다.

**iOS에서도 위의 그림처럼 전통적인 MVC를 따르도록 구현할 순 있지만, 각각의 개체들이 서로를 알고 있어야 하기 때문에 커플링이 높고 재사용성이 낮기 때문에 사용하지 않는다고 한다.**

### Apple's MVC

![apple-mvc](./Resources/Apple_MVC.png)

반면, 애플의 MVC에서는 `View`와 `Model` 사이에 `Controller`가 매개자로 동작한다. **따라서 `Model`과 `View`는 서로의 존재에 대해서 알 필요가 없다.** 물론, `Controller`의 경우 View와 Model을 알아야 하므로 재사용성이 낮아진다. 그럼에도 불구하고 이러한 점은 꽤 긍정적인데, **일반적으로 `Model`에 적합하지 않은 까다로운 비지니스 로직을 처리할 장소가 필요한데 이를 `Model`이 아닌 `Controller`가 처리하면 되기 때문이다.**

한마디로 정리하면, MVC 패턴에서 Controller는  
1. **비지니스 로직을 처리한다.**
2. **Model에게 업데이트 요청을 보낸다.**
3. **Model이 Notify한 내용을 통해 View를 갱신한다.**

여기까지 보았을 때에는 훌륭한 방법처럼 보일 수 있지만, **안타깝게도 그렇지 않다.** 아래의 그림을 보자.

![realistic-mvc](./Resources/Realistic_MVC.png)

위 그림은, iOS에서 실제로 MVC가 동작하는 방식이다. UIView를 생성할 때 함께 생성되는 UIViewController 객체가 바로 Apple에서 말하는 `Controller`에 해당하는데, 이 때문에 UIViewController는 View가 로드되어야 비로소 생성된다. **즉, View의 라이프사이클에 Controller가 종속될 수 밖에 없다.** 

이러한 문제는 유닛테스트에서 나타난다. Controller 입장에서는 위에서 설명한 세 가지 기능이 View가 로드되어야만 테스트가 가능하고, View 입장에서는 자신의 라이프사이클이나 테스트를 위한 View를 만들기가 어렵다.

### 그래서 MVC는..?

따라서 MVC는 
* 아키텍처에 시간을 투자하기에 비용이 크다고 생각될 때 선택할 수 있는 최고의 패턴이다.
* 이미 Apple에서 MVC 아키텍쳐를 사용하고 있기 때문에, 추가적인 코드를 요구하지 않는다는 장점이 있어 개발 속도면에서 빠르다는 장점이 있다. 
* View와 Controller의 테스트가 힘들기 때문에 유지보수 면에서 리스크가 있다.

## MVP

![traditional-mvp](./Resources/MVP.png)

## MVVM

![mvvm](./Resources/MVVM.png)

## 디자인 패턴의 필요성

#### 출처

[Apple Developer MVC 문서](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html)
