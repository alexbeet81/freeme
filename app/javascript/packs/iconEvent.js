const fetch = require('node-fetch')



// input.addEventListener('something', () => { } )
function getIcon(keyWord){
  fetch(`https://api.iconfinder.com/v4/icons/search?query=${keyWord}&count=10&premium=false&vector=false`, {
  headers: {
    'Content-Type': 'application/json',
     'Authorization': 'Bearer X0vjEUN6KRlxbp2DoUkyHeM0VOmxY91rA6BbU5j3Xu6wDodwS0McmilLPBWDUcJ1',
     'origin': "https://developer.iconfinder.com"
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
