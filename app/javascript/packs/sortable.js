import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#sortlist');

  let sortable = Sortable.create(list, {
    ghostClass: "ghost",
    animation: 150,
  });

  document.querySelector('#save-skill').addEventListener('click', (e) => {
    let order = sortable.toArray();

    // set all posotions
    const newPositions = []
    // get all skill ids
    document.querySelectorAll('#sortlist li').forEach((e, index) => {
      console.log(e.dataset.skill, index)
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
};

export { initSortable };
