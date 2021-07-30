
function showcaseAni(){

    let skillsGrid = document.querySelector('.sc-skills-grid');

    let introPos = skillsGrid.getBoundingClientRect().top;
    console.log(introPos);
    // let screenPos = window.innerHeight;

    // if(introPos < screenPos){
    //   skillsGrid.classlist.add()
    // }



    let projGrid = document.querySelector('.sc-project-card');
    let expGrid = document.querySelector('.sc-exp-grid');
    let skillPos = skillsGrid.getBoundingClientRect().top;
    let projPos = projGrid.getBoundingClientRect().top;
    let expPos = expGrid.getBoundingClientRect().top;

    let screenPos = window.innerHeight;

    if(skillPos < screenPos){
      skillsGrid.classList.add('skill-appear')
    }

    if(projPos < screenPos){
      projGrid.classList.add('pro-appear')
    }

    if(expPos < screenPos){
      expGrid.classList.add('exp-appear')
    }
};
showcaseAni();


window.addEventListener('scroll', showcaseAni);

