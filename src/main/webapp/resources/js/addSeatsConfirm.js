function addSeatsConfirm(course_id, course_no, faculty_name) {
    console.log(course_id, course_no, faculty_name);
    alert("증원 강의 정보를 확인해주세요.\n\n과목번호: " + course_id + "\n분반: " + course_no + "\n교수명: "+ faculty_name);

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
                $.ajax({
                    url: 'http://localhost:8080/ajax/addSeatsProcess.jsp',
                    type: 'POST',
                    data: {
                        courseId: course_id,
                        course_no: course_no,
                        increaseAmount: increaseAmount
                    },
                    success: function(response) {
                        alert(increaseAmount + "명 증원되었습니다. \n 새로고침을 해주세요!");
                        window.location.href = "admin_index.jsp";
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr, status, error);
                        alert("증원 도중 오류가 발생했습니다.다시 시도해주세요.");
                        window.location.href = "admin_index.jsp";
                    }
                });
            } else {
                alert("1보다 적은 정원은 증원 불가합니다.");
            }
        }
    }
}
