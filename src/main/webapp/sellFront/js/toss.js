/**
 * 
 */
function tossPayInit() {
	const clientKey = 'test_ck_kYG57Eba3GmLme6My65krpWDOxmA'

   	const customerKey = crypto.randomUUID()  //"VUEWF1yYWn17zOh3L6Wot" // 내 상점에서 고객을 구분하기 위해 발급한 고객의 고유 ID(임의값)
	console.log('***customerKey : ',customerKey)
    const button = document.getElementById("payment-button")
    const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
    const paymentMethodWidget = paymentWidget.renderPaymentMethods(
      "#payment-method", 
      { value: Number(obj.price) },
      { variantKey: "DEFAULT" } 
    )
    paymentWidget.renderAgreement(
      '#agreement',
      { variantKey: "AGREEMENT" } // 기본 이용약관 UI 렌더링
    )
   console.log("obj :",obj.price)
   paymentMethodWidget.updateAmount(Number(obj.price))
   const selectedPaymentMethod = paymentMethodWidget.getSelectedPaymentMethod()
      
    const payObj = {
        orderId: obj.pdt_code +'_' + orderid,            
        orderName: obj.title,
        successUrl: window.location.origin + "/KDT_TeamProject/pay/success",  
        failUrl: window.location.origin + "/KDT_TeamProject/pay/fail",        
        customerName: obj.sell_id
    }
    console.log(payObj)
    button.addEventListener("click", function () {
      paymentWidget.requestPayment(payObj)
    })
}
