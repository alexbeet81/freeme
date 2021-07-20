window.addEventListener('load', function(){
  var items = document.querySelectorAll('#sortlist li'),
  dragged = null;

  for (let i of items) {
    i.addEventListener('dragstart', function(){
      dragged = this;

      for (let it of items) {
        if (it != dragged) {it.classList.add('hint'); }
      }
    });
    i.addEventListener('dragenter', function(){
      if (this != dragged) {this.classList.add('active'); }
    });

    i.addEventListener('dragleave', function(){
      this.classList.remove('active');
    });

    i.addEventListener('dragend', function(){
      for (let it of items) {
        this.classList.remove('hint');
        this.classList.remove('active');
      }
    });

    i.addEventListener('dragover', function(evt){
      evt.preventDefault();
    });

    i.addEventListener('drop', function(evt){
      evt.preventDefault();
      if (this != dragged) {
        let all = document.querySelectorAll('#sortlist li'),
          draggedpos = 0, droppedpos = 0, ;
          for (let it= 0; it<all.length; it++){
            if (dragged == all[it]) { draggedpos = it; }
            if (this == all[it]) { droppedpos = it; }
          }
          if (draggedpos < droppedpos) {
            this.parentNode.insertBefore('dragged', this.nextSibling);
          }else{
            this.parentNode.insertBefore('dragged', this);
          }

      }
    });
  }
});

