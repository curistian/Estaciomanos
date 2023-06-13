const debounce = function(func, wait, immediate){
    let timeout;
    return function(...args){
        const context = this;
        const later = function(){
            timeout=null;
            if(!immediate) func.apply(context, args);
        };
    const callNow = immediate && !timeout;
    clearTimeout(timeout);
    timeout = setTimeout(later. wait);
    if(callNow) func.apply(context,args);
    };
};

const target = document.querySelectorAll('.main-title, .col-md-4');
const animationClass = 'animate';

function animeScroll(){
    const windowHeight = window.innerHeight;
    target.forEach(function(element){
        const elementRect = element.getBoundingClientRect();
        const elementTop = elementRect.top;
        const elementBottom = elementRect.bottom;
        if((elementTop < windowHeight) && (elementBottom > 0)){
            element.classList.add(animationClass);
        } else{
            element.classList.remove(animationClass);
        }
    });
}

animeScroll();
if(target.length){
    window.addEventListener('scroll', function(){
        animeScroll();
    })
}