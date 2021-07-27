const available = () => {

  const availableLable = document.getElementById('available-lable');
  const id = availableLable.dataset.user;

  document.querySelector('#available-checkbox').addEventListener('click', (e) => {
    if (document.getElementById('available-checkbox').checked) {

      availableLable.innerHTML = "Available"

      fetch(`http://localhost:3000/api/v1/users/${id}`, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          available: true
        })
      })

    } else {
      console.log('off')
      availableLable.innerHTML = "Unavailable"

      fetch(`http://localhost:3000/api/v1/users/${id}`, {
        method: 'PATCH',
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          available: false
        })
      })
    }
  })
}

export { available };


// <label for="available" data-user="<%= @user.id %>" id="available-lable">
