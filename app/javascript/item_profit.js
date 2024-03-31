const price = () => {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const ProfitDom = document.getElementById("profit");
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
      ProfitDom.innerHTML = Math.floor(inputValue - Math.floor(inputValue * 0.1 ));
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render",price);