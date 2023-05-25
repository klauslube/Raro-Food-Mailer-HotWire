document.addEventListener("turbo:load", function() {
  const toggleUserMenu = (event) => {
    const userMenu = document.querySelector('.context-menu');
    
    if (userMenu.classList.contains('hidden')) {
      userMenu.classList.remove('hidden')
    } else {
      userMenu.classList.add('hidden')
    }

    event.stopPropagation();
  };

  const hideUserMenu = () => {
    const userMenu = document.querySelector('.context-menu');
    userMenu.classList.add('hidden');
  };

  const openUserMenu = document.querySelector('#open-user-menu');

  openUserMenu.addEventListener('click', toggleUserMenu);
  document.addEventListener('click', hideUserMenu);
})