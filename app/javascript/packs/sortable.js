import Sortable from 'sortablejs';

const initSortable = () => {
  const sortSkills = document.querySelector('#sort-skill');

  let sortableSkill = Sortable.create(sortSkills, {
    ghostClass: "ghost",
    animation: 150,
  });

  const sortProject = document.querySelector('#sort-project');

  let sortableProject = Sortable.create(sortProject, {
    ghostClass: "ghost",
    animation: 150,
  });

  const sortExperience = document.querySelector('#sort-experience');

  let sortableExperience = Sortable.create(sortExperience, {
    ghostClass: "ghost",
    animation: 150,
  })

  document.querySelector('#save-skill').addEventListener('click', (e) => {
    let order = sortableSkill.toArray();

    // set all posotions
    const newPositions = []
    // get all skill ids
    document.querySelectorAll('#sort-skill li').forEach((e, index) => {
      // console.log(e.dataset.skill, index)
      newPositions.push({skill: e.dataset.skill, position: index})
    })

    fetch(`http://localhost:3000/api/v1/skills`, {
      method: 'POST',
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify({
        position: newPositions
      })
    })
  })

  document.querySelector('#save-project').addEventListener('click', (e) => {
    let order = sortableProject.toArray();

    const newPositions = []

    document.querySelectorAll('#sort-project li').forEach((e, index) => {
      console.log(e.dataset.project, index)
      newPositions.push({project: e.dataset.project, position: index})
    })

    fetch(`http://localhost:3000/api/v1/projects`, {
      method: 'POST',
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify({
        position: newPositions
      })
    })
  })

  document.querySelector('#save-experience').addEventListener('click', (e) => {
    let order = sortExperience.toArray();

    const newPositions = []

    document.querySelectorAll('#sort-experience li').forEach((e, index) => {
      newPositions.push({project: e.dataset.project, position: index})
    })
  })

  fetch(`http://localhost:3000/api/v1/experience`, {
    method: 'POST',
    headers: {
      "Content-type": "application/json",
    },
    body: JSON.stringify({
      position: newPositions
    })
  })
};

export { initSortable };
