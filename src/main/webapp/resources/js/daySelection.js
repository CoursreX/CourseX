function daySelection(day) {
    const button = document.getElementById(day);
    button.classList.toggle('selected');

    const selectedDaysInput = document.getElementById('selectedDays');
    let selectedDays = selectedDaysInput.value ? selectedDaysInput.value.split(',') : [];

    if (button.classList.contains('selected')) { // 요일 추가
        selectedDays.push(day);
    } else { // 요일 삭제
        selectedDays = selectedDays.filter(selectedDay => selectedDay !== day);
    }

    selectedDaysInput.value = selectedDays.join(',');
    console.log(selectedDaysInput)
}

/*function resetDayButtons() { // 새로고침 초기화
    const days = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    days.forEach(day => {
        document.getElementById(day).addEventListener('click', () => daySelection(day));
    });
}

window.onload = resetDayButtons;
*/
