function displayFileName() {
	var input = document.getElementById('file');
	if (input.files.length > 0) {
        var fileName = input.files[0].name;
        document.getElementById('file-name').textContent = fileName;
    } else {
        document.getElementById('file-name').textContent = '*.xlsx 파일만 업로드 가능합니다.';
    }
}

function createAccountAlert(file) {
    if (file == null || file.length === 0) {
        alert("파일을 업로드 해주세요");
        return false;
    } else {
        if (confirm("등록하시겠습니까?")) {
            alert("등록되었습니다.");
            console.log("File " + file.name + " has been registered.");
        } else {
            alert("등록이 취소되었습니다.");
        }
    }
}

function validateForm() {
    var fileInput = document.getElementById('file');
    var file = fileInput.files[0];
    return createAccountAlert(file); // 파일 없을 때 등록 못함
}
