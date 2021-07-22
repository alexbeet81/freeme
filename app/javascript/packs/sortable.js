import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#sortlist');
  Sortable.create(list, {
    ghostClass: "ghost",
    animation: 150,
  });
};

export { initSortable };
