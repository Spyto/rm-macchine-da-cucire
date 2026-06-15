const slides = document.querySelectorAll(".slider img");

let currentSlide = 0;

function showSlide(index) {

    slides.forEach(slide => {
        slide.classList.remove("active");
    });

    if(slides.length > 0){
        slides[index].classList.add("active");
    }
}

function nextSlide() {

    currentSlide++;

    if(currentSlide >= slides.length){
        currentSlide = 0;
    }

    showSlide(currentSlide);
}

if(slides.length > 0){

    showSlide(currentSlide);

    if(slides.length > 1){
        setInterval(nextSlide, 5000);
    }

}

/* MENU HAMBURGER */

const menuToggle = document.querySelector(".menu-toggle");
const nav = document.querySelector("nav");

if(menuToggle && nav){

    menuToggle.addEventListener("click", () => {

        nav.classList.toggle("show");

    });

}