const priceInput = document.getElementById("item-price");
console.log(priceInput);

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

const addTaxDom = document.getElementById("add-tax-price");
const commission = Math.floor(inputValue * 0.1);
addTaxDom.innerHTML = commission

const profitDom = document.getElementById("profit");
profitDom.innerHTML = Math.floor(inputValue - commission);
})

