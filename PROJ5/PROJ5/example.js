const right = document.getElementById('rightt');
const left = document.getElementById('leftt');
const logo = document.getElementById('logo')

const KNOWLEDGE = document.getElementById('KNOWLEDGE');

const slide = document.getElementById('Slide')
let x = 1;
let interval = 2000
setInterval(myTimer, interval);

let y = 0;



let array = ["class1", "class2", "class3","class4"]
function myTimer() {


    slide.classList.remove(array[x - 1])
    if (x > 3) {
        x = 0;
    }
    slide.classList.add(array[x])

    clearInterval(interval);
  
   
       
  
    //y++;
    //if (y > 2) {
    //    y = 0;
    //}
    //if (y == 0) {
    //    KNOWLEDGE.innerHTML = "There is no friend as loyal as a book.";

    //}

    //if (y == 1) {
    //    KNOWLEDGE.innerHTML = "EXPLORE THE WORLDS KNOWLEDGE....";

    //}

    //if (y == 2) {
    //    KNOWLEDGE.innerHTML = "A reader lives a thousand lives before he dies..";

    //} 

    x++;
  
}



const pic = function () {
   

    slide.classList.remove(array[x - 1])
    if (x > 3) {
        x = 0;
    }
    slide.classList.add(array[x])

 
       
  
  
    
    x++;
    console.log(y)
  


}


const picbefore = function () {
    if (x < 0) {
        x =3
        slide.classList.remove(array[0])
    } else {
        slide.classList.remove(array[x + 1])
    }
    slide.classList.add(array[x])

    x--;

   
 

}

right.addEventListener('click', pic);
left.addEventListener('click', picbefore)



setInterval(tim, 2000);





function tim() {


    
  

    clearInterval(interval);




    y++;
    if (y > 2) {
        y = 0;
    }
    if (y == 0) {
        KNOWLEDGE.innerHTML = "There is no friend as loyal as a book.";

    }

    if (y == 1) {
        KNOWLEDGE.innerHTML = "EXPLORE THE WORLDS KNOWLEDGE....";

    }

    if (y == 2) {
        KNOWLEDGE.innerHTML = "A reader lives a thousand lives before he dies..";

    }

   

}
