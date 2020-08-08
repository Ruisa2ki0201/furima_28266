const pay = () => {
  Payjp.setPublicKey("pk_test_0730f39c0cb7a7acc215d332"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
    console.log(card)
    console.log("sample")
    


    Payjp.createToken(card, (status, response) => {
      console.log(response);
      if (status === 200) {
        const token = response.id;
        // const renderDom = document.getElementsByClassName("credit-card-form");
        const renderDom = document.getElementById('charge-form');
        
        // console.log(renderDom );
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        console.log(tokenObj);
        renderDom.insertAdjacentHTML('beforeend', tokenObj);

        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
      }
    });
  });
};

window.addEventListener("load", pay);