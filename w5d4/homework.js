function madLib(verb, adj, noun) {
  var str = "";
  return "We shall " + verb.toUpperCase() + " the " + adj.toUpperCase() + " " + noun.toUpperCase();
}


function isSubString(searchString, subString) {
  var i = searchString.indexOf(subString);
  if (i < 0) {
    return false;
  }
  return true;
}


function fizzBuzz(array) {
  var arr = [];
  for (var i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 && array[i] % 5 != 0) {
      arr.push(array[i]);
    } else if (array[i] % 3 != 0 && array[i] % 5 === 0) {
      arr.push(array[i]);
    }
  }

  return arr;
}

function isPrime(num) {
  if (num < 2) {
    return false;
  }

  for (var i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNPrimes(n) {
  arr = [];
  i = 2;
  sum = 0;
  while (arr.length < n) {
    if isPrime(i) {
      arr.push(i);
    }
  }

  for (var i = 0; i < arr.length; i++) {
    sum += arr[i];
  }

  return sum;
}
