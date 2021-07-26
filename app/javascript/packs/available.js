const available = () => {
  document.querySelector('#test-button').addEventListener('click', (e) => {
    console.log(e)
    console.log('test')
  })
}

export { available };
