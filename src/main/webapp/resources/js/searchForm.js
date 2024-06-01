// 라디오 버튼 선택에 따라 검색 입력칸 표시/숨김 처리
function handleRadio(event) {
    const searchFilterElements = document.querySelectorAll('.enroll__filter__element');

    searchFilterElements.forEach(element => element.style.display = 'none');

    if(event.target.value === 'code') {
        searchFilterElements[0].style.display = 'block';
    } else if(event.target.value === 'name') {
        searchFilterElements[1].style.display = 'block';
    } else if(event.target.value === 'category') {
        searchFilterElements[2].style.display = 'block';
    }
}