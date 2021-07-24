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

  // function generateJsonPatch(obj, patchObject=[], parent: string=null) {
  //   for (const key in obj) {
  //     if (obj.hasOwnProperty(key)) {
  //       if (obj[key] instanceof Object) {
  //         if (parent) {
  //           parent = parent + '/' + key;
  //         } else {
  //           parent = key;
  //         }
  //         generateJsonPatch(obj[key], patchObject, parent);
  //       } else if (obj[key]) {
  //         let fieldName;
  //         if (parent) {
  //           fieldName = parent + '/' + key;
  //         } else {
  //           fieldName = key;
  //         }
  //         const patchField = { op: 'replace', path: `/${fieldName}`, value: `${obj[key]}` };
  //         patchObject.push(patchField);
  //       }
  //     }
  //   }
  //   return patchObject;
  // }

  // // USAGE:
  // const test = {
  //   'a': '1',
  //   'b': '2',
  //   'c': [{
  //     'd': '4',
  //     'e': '5'
  //   }]
  // };

  // console.log(generateJsonPatch(test))

  document.querySelector('#save-skill').addEventListener('click', (e) => {
    let order = sortable.toArray();
    console.log(order)
    console.log(order.indexOf('2'));

    // set all posotions

    const newPositions = []
    // get all skill ids
    document.querySelectorAll('#sortlist li').forEach((e, index) => {
      console.log(e.dataset.skill, index)
      newPositions.push({skill: e.dataset.skill, position: index})
    })

    console.log(newPositions);
    // get all positions
    // document.querySelectorAll('#sortlist li').forEach( e => {
    //   console.log(e.dataset.id)
    // })
    // get all new positions
    // update all positions

    fetch(`http://localhost:3000/api/v1/skills`, {
      method: 'POST',
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify({
        position: newPositions
      })
    })

    // fetch(`http://localhost:3000/api/v1/users/6-super_mario`)
    //   .then(res => res.json())
    //   .then(res => res.skills.forEach( skill => {
    //     // console.log(skill.id)
    //     fetch(`http://localhost:3000/api/v1/skills/${skill.id}`, {
    //       method: 'PATCH',
    //       headers: {
    //         "Content-type": "application/json",
    //         // "X-User-Email": "super@mario.com",
    //         // "X-User-Token": "2cXcadDzZk4s8fXySgFb"
    //       },
    //       body: JSON.stringify({
    //         skill_name: "this is a test"
    //       })
    //     })
    //     .then(res => res.json())
    //     .then(res => console.log(res))
    //   }))
    // fetch(`http://localhost:3000/api/v1/users/6-super_mario`, {
    //   method: 'PATCH',
    //   headers: {
    //     "Content-type": "application/json",
    //     "X-User-Email": "super@mario.com",
    //     "X-User-Token": "2cXcadDzZk4s8fXySgFb"
    //   },
    //   body: JSON.stringify({
    //     headline: "My name is NOT Mario!"
    //   })
    // })
    // .then( response => response.json())
    // .then( response => response.skills.forEach( e => console.log(e.position)))
    // do a patch request
    // itterate through the skills.
    // itterate through the order array.
    // set position to equal the position in the array

  })
};

export { initSortable };
