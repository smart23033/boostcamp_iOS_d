## ARC 문제 (쌍쌍바)

## **아래와 같은 관계를 가지도록 클래스를 정의하세요.**

1. `Person`, `FingerPrint`, `Apartment`, `CreditCard` 클래스를 정의하세요.

2.  각각의 클래스는 아래의 멤버들을 가집니다.
	* class Person :

		name(String)  
		fingerPrint(FingerPrint)  
		apartment(Apartment)  
		creditCard(CreditCard)  
	* class FingerPrint :  

		id(Int)  
		person(Person)  
	* class Apartment :  

		unit(String)  
		tenant(Person)  
	* class CreditCard :  

		cardNumber(Int)
		customer(Person)

3. 클래스간 관계는 다음과 같습니다.

	* Person이 존재하면 FingerPrint(지문)은 반드시 존재하며(not nil) FingerPrint가 존재하면 Person도 반드시 존재합니다.(not nil)
	* Person은 Apartment에 살 수도 있지만 살지 않을 수도 있습니다.(nil) Apartment에는 tenant(거주자)가 존재할 수도 있지만 존재하지 않을 수도 있습니다(nil)
	* Person은 CreditCard(신용카드)를 사용할 수도 있고 사용하지 않을 수도 있습니다. CreditCard는 생성될 때 카드의 주인이(Person) 반드시 있어야 합니다.  

4. 각 클래스에 Initializer, Deinitializer를 만들어주세요.
5. Initializer와 Deinitializer에는 해당 클래스 인스턴스가 생성 혹은 (메모리에서) 해제되었음을 알 수 있도록 print()를 통해 로그를 출력해주세요.
6. 위의 관계를 유지하면서, reference cycle 문제가 발생하지 않도록 코드를 작성해주세요.
7. 테스트는 각각의 인스턴스 초기화 후 nil을 대입하여 모든 객체에서 Deinitializer가 동작하는지 확인할 수 있으면 됩니다.

클래스 작성에 어려움이 있으시면, [여기](https://github.com/smart23033/boostcamp_iOS_d/tree/master/Week3/Quiz/ExampleCode)를 참고하셔도 됩니다. 해당 코드는 중요 키워드를 모두 제거하여 동작하지 않는 상태입니다.
