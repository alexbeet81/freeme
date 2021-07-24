import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#sortlist');

  let sortable = Sortable.create(list, {
    ghostClass: "ghost",
    animation: 150,
    onEnd: (event) => {
      // fetch POST
      // alert(`${event.oldIndex} moved to ${event.newIndex}`);
      // fetch(`http://localhost:3000/api/v1/users/5-dennis_bergkamp`)
      // .then(res => res.json())
      // .then(res => console.log(res))
      //
    }
  });

  document.querySelector('#save-skill').addEventListener('click', (e) => {
    let order = sortable.toArray();
    // console.log(order)
    order.forEach( e => console.log(e))
    // fetch(`http://localhost:3000/api/v1/users/5-dennis_bergkamp`)
    //   .then(res => res.json())
    //   .then(res => res.skills.forEach( skill => {
    //     skill.level = "test";
    //   }))
    fetch(`http://localhost:3000/api/v1/users/5-dennis_bergkamp`, {
      method: 'PATCH',
      headers: {
        "Content-type": "application/json",
        "X-User-Email": "dennis@berkamp.com",
        "X-User-Token": "SszxUGurVaYpqh4_wUW6"
      },
      body: JSON.stringify({
        headline: "I HATE football!"
      })
    })
    .then( response => response.json())
    .then( response => console.log(response.headline))
    // do a patch request
    // itterate through the skills.
    // itterate through the order array.
    // set position to equal the position in the array

  })
};

export { initSortable };
