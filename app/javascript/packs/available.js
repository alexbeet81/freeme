const available = () => {
  document.querySelector('#available-switch').addEventListener('click', (e) => {
    console.log(typeof(e))
  })
}

export { available };
