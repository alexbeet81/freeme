const fetch = require('node-fetch')



// input.addEventListener('something', () => { } )
function getIcon(keyWord){
  fetch(`https://api.iconfinder.com/v4/icons/search?query=${keyWord}&count=10&premium=false&vector=false`, {
    mode: 'no-cors',
  headers: {
    'Content-Type': 'application/json',
     'Authorization': 'Bearer 4OgPhxvQmirUXTmHXvsh21b5Vfs9McVukloqQVrVl2v71ith1cIdw4zH23sfi1UC'
  },
  data: {
    grant_type: 'client_credentials',
    client_id: 'T6vkCg4hfpOABsf2oWMlIgwdUX8vdFrXkneHXGDjLUVj5eGK3rqdAUE0ojGSyA2f'
  }
})
.then(response => response.json())
.then(data => {
  console.log('Success:', data);
  console.log(data.icons[0].raster_sizes[0].formats[0].preview_url)
  //needs a return to replace console.log, remove parenthesis
})
}

export {getIcon}
