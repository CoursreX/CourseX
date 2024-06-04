function addSeatsAlert(courseId) {
    alert("증원 강의 정보를 확인해주세요.\n\n과목번호: " + courseId + "\n과목명: 컴퓨터구조\n교수명: 박숙영");

    if (confirm("증원하시겠습니까?")) {
        var increaseAmount = prompt("증원인원을 작성해주세요. (정수만 입력 가능)");

        if (increaseAmount === null) {
            alert("증원이 취소되었습니다.");
            return;
        }

        // 숫자가 아닌 다른 값 입력시 프로세스 종료
        increaseAmount = Number(increaseAmount, 10);
        if (Number.isNaN(increaseAmount) || !Number.isInteger(increaseAmount)) {
            alert("유효한 정수를 입력해주세요. 증원이 중단됩니다.");
            return;
        }

        if (confirm("증원인원을 확인해주세요.\n\n" + increaseAmount + "명 증원합니다.")) {
            if (increaseAmount >= 1) {
                alert(increaseAmount + " 명 증원되었습니다.");
            } else {
                alert("1보다 적은 정원은 증원 불가합니다.");
            }
        }
    }
}
