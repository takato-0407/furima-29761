

function pullDown() {

  const pullDownButton = document.getElementById("item-price") 
  const pullDownParents = document.getElementById("add-tax-price")
  const pullDownChild = document.getElementById("profit")

  pullDownButton.addEventListener('keyup', function(){
    let price = pullDownButton.value;
    if (300 <= price && price <= 9999999){
      let fee = Math.floor(price * 0.1)
      let gains = price - fee
      pullDownParents.innerHTML = fee
      pullDownChild.innerHTML = gains
    } else {
      pullDownParents.innerHTML = '-'
      pullDownChild.innerHTML = '-'
    }
    })
  }


window.addEventListener('load', pullDown)


