const price = () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  const commission = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = commission

  const profitDom = document.getElementById("profit");
  profitDom.innerHTML = Math.floor(inputValue - commission);
  })
}

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
