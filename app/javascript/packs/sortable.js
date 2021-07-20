import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#sortlist');
  Sortable.create(list);
};

export { initSortable };
