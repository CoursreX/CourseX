function updateSelectedMenu() {
    const menus = document.querySelectorAll('.sidebar__menu');

    menus.forEach(menu => {
        menu.addEventListener('click', (event) => {
            menus.forEach((m) => {
                const img = event.currentTarget.querySelector('img');
                img.src = img.getAttribute('data-original-src');
                m.classList.remove('selected');
            });

            // 클릭된 메뉴에 'selected' 클래스를 추가하고 src를 변경
            const selectedImg = event.currentTarget.querySelector('img');
            selectedImg.src = selectedImg.getAttribute('data-selected-src');
            event.currentTarget.classList.add('selected');
        });
    });
}
document.addEventListener('DOMContentLoaded', updateSelectedMenu);