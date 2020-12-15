function item (){
 const priceEnter  = document.getElementById("item-price");
 priceEnter.addEventListener("input", () => {
   const inputValue = priceEnter.value;
   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = Math.floor(inputValue / 10);
   const profitShowDom = document.getElementById("profit");
   const addTax = addTaxDom.innerHTML
   profitShowDom.innerHTML = Math.floor(inputValue - addTax);
 });
}

window.addEventListener('load', item);
