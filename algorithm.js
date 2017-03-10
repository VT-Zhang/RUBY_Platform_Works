// function binary(arr, x){
//     var left_i = 0;
//     var right_i = arr.length - 1;
//     var i;
//
//     while (left_i <= right_i){
//         i = (left_i + right_i) / 2 | 0;
//         console.log(i);
//         if (arr[i] < x) {
//             left_i = i + 1;
//         }
//         else if (arr[i] > x){
//             right_i = i - 1;
//         }
//         else {
//             console.log(i);
//             return i;
//         }
//     }
//     console.log(-1);
//     return -1;
// }
//
// binary([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30], 5)

// function flatten(arr){
//     var newarr = [];
//     for(var i = 0; i<arr.length; i++){
//         if (Array.isArray(arr[i]) == true){
//             for (var j = 0; j<arr[i].length; j++){
//                 newarr.push(arr[i][j]);
//             }
//         }
//         else newarr.push(arr[i]);
//     }
//     console.log(newarr);
//     return newarr;
// }
// flatten([1,[2,3],4,[]])

function removeDuplicate(arr){
    var newarr = [];
    var counter = 0;
    for(var i=0; i<arr.length; i++){
        newarr[i] = arr[i];
        for(var j=i+1; j<arr.length; j++){
            if(arr[j] == arr[i]){
                arr[j]=arr[j+1];
            }
        }
    }
    // for(var k=0; k<counter; k++){
    //     newarr.pop();
    // }
    console.log(newarr);
    return newarr;
}
removeDuplicate([1,2,1,3,4,2])


function removeDuplicates(num) {
  var x,
      len=num.length,
      out=[],
      obj={};

  for (x=0; x<len; x++) {
    obj[num[x]]=0;
  }
  for (x in obj) {
    out.push(x);
  }
  return out;
}
var Mynum = [1, 2, 2, 4, 5, 4, 7, 8, 7, 3, 6];
result = removeDuplicates(Mynum);
console.log(Mynum);
console.log(result);



function unique1(arr){
  var newarr = [];
  for(var i = 0; i < arr.length; i++){
    if (newarr.indexOf(arr[i]) == -1){
        newarr[newarr.length] = arr[i];
    }
  }
  console.log(newarr);
  return newarr;
}

var Mynum = [1, 2, 2, 4, 5, 4, 7, 8, 7, 3, 6];
unique1(Mynum);




function unique4(arr){
  arr.sort();
  var newarr=[arr[0]];
  for(var i = 1; i < arr.length; i++){
    if( arr[i] != newarr[newarr.length-1]){
      newarr[newarr.length] = arr[i];
    }
  }
  console.log(newarr);
  return newarr;
}
var Mynum = [1, 2, 2, 4, 5, 4, 7, 8, 7, 3, 6];
unique4(Mynum);



function unique5(arr){
  var newarr = [];
  for(var i = 0; i<arr.length; i++) {
    for(var j = i+1; j < arr.length; j++)
      if (arr[i] == arr[j]){
         i++;
         j = i;
         console.log("this is j :" + j);
      }
    newarr[newarr.length] = arr[i];
  }
  console.log(newarr);
  return newarr;
}

var Mynum = [1, 2, 2, 2, 4, 5, 4, 7, 8, 7, 3, 6];
unique5(Mynum);


var a = ++2;
