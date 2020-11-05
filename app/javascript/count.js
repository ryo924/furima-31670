function count (){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup", () => {
    const countPrice = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${countPrice/10}`;
    num1 = parseInt(countPrice)
    num2 = parseInt(addTaxPrice.innerHTML) 
    const profit = document.getElementById("profit");
    profit.innerHTML = `${num1 - num2}`;
  });
}

window.addEventListener('load', count);