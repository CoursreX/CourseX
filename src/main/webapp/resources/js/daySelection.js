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

