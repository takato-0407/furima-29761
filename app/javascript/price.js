

function pullDown() {

  const pullDownButton = document.getElementById("item-price") 
  const pullDownParents = document.getElementById("add-tax-price")
  const pullDownChild = document.getElementById("profit")

  pullDownButton.addEventListener('keyup', function(){
    let price = pullDownButton.value;
    let fee = price * 0.1
    let gains = price - fee
    pullDownParents.innerHTML = fee
    pullDownChild.innerHTML = gains
    })
  }


window.addEventListener('load', pullDown)