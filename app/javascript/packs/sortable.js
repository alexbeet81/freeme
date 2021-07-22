import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#sortlist');

  let sortable = Sortable.create(list, {
    ghostClass: "ghost",
    animation: 150,
    onEnd: (event) => {
      // fetch POST
      // alert(`${event.oldIndex} moved to ${event.newIndex}`);
      fetch(`http://localhost:3000/api/v1/users/5-dennis_bergkamp`)
      .then(res => res.json())
      .then(res => console.log(res))

    }
  });

  document.querySelector('#save-skill').addEventListener('click', (e) => {
    let order = sortable.toArray();
    console.log(order)
  })
};

export { initSortable };
