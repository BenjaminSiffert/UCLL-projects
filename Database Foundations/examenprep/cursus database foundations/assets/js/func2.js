"use strict";



//nummer alle h2 en h3, geef id en maak automatische inhoudsopgave
//tenzij het main element een class geentoc meekreeg
if (!document.querySelector("main.geentoc")) {
  const hoofdtitel = document.querySelector("h1");
  let toc = document.createElement('section');
  toc.id = "toc";
  hoofdtitel.insertAdjacentElement("afterend", toc);
  let toclijst = document.createElement('ul');
  toc.insertAdjacentElement("afterbegin", toclijst);


  let alleTitels = document.querySelectorAll("h2, h3");
  let h2Teller = 1;
  let h3Teller = 1;
  let titeltekst;
  for (let i = 1; i <= alleTitels.length; i++) {
    titeltekst = alleTitels[i - 1].innerText;
    if (alleTitels[i - 1].localName === "h2") {
      h3Teller = 1;
      alleTitels[i - 1].innerText = h2Teller + " " + alleTitels[i - 1].innerText;
      toclijst.innerHTML += `<a href="#${titeltekst.split(' ').join('-')}"><li class="h2">${alleTitels[i - 1].innerText}</li></a>`;
      h2Teller++;
    } else {
      alleTitels[i - 1].innerText =
        h2Teller - 1 + "." + h3Teller + " " + alleTitels[i - 1].innerText;
      toclijst.innerHTML += `<a href="#${titeltekst.split(' ').join('-')}"><li class="h3">${alleTitels[i - 1].innerText}</li></a>`;
      h3Teller++;
    }
    // zorg dat id's geen spaties bevatten, vervang door koppelteken
    alleTitels[i - 1].id = titeltekst.split(' ').join('-');
  }
}




//toon / verberg oplossing
let knoppen = document.querySelectorAll("section.taak button");
for (let i = 0; i < knoppen.length; i++) {
  knoppen[i].addEventListener("click", toonVerberg);
}
function toonVerberg(e) {
  e.target.parentElement.classList.toggle("toon");
}


//zoek de huidige rubriek op basis van eerste twee letters van titel element
let navItems = ["Ho", "Le", "Mo", "SQ", "FA"];
let eersteTweeLettersTitle = document.title.slice(0, 2);
console.log(eersteTweeLettersTitle);
let i = navItems.indexOf(eersteTweeLettersTitle) + 1;
let queryString = "header nav li:nth-child(" + i + ")";
document.querySelector(queryString).classList.toggle("hier");

//laatste update van elke file in de footer
let laatsteupdate = document.lastModified;

