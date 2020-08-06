window.addEventListener('load',function(){
  const price = document.getElementById("add-tax-price")
  const content = document.getElementById("profit")
  const input = document.getElementById("input")
  

  input.addEventListener('keyup',function(){
    const input_price = input.value;
    input_price2 = Math.floor(input_price*0.1)
    input_price3 = Math.floor(input_price*0.9)
    
    price.innerHTML = input_price2;
    content.innerHTML = input_price3;
  })
})








// price-inputがkeyupされたら、というイベント
// 入力されたデータ（価格）を取得
// 計算
// 計算結果をビューに表示