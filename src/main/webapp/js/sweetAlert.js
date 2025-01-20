    function alertDefaultSuccess(title, text) {
        return Swal.fire({
            icon: 'success',
            title: title,
            text: text,
        }).then((result) => {
             result.isConfirmed;
        });
    }
    function alertDefaultError(title, text) {
        return Swal.fire({
            icon: 'error',
            title: title,
            text: text,
        }).then((result) => {
            result.isConfirmed;
        });
    };

    function alertDefaultWarning(title, text) {
        return Swal.fire({
            icon: 'warning',
            title: title,
            text: text,
        }).then((result) => {
            result.isConfirmed;
        });
    };

    function alertDefaultInfo(title, text) {
        return Swal.fire({
            icon: 'info',
            title: title,
            text: text,
        }).then((result) => {
            result.isConfirmed;
        });
    };

    function alertDefaultQuestion(title, text) {
        return Swal.fire({
            icon: 'question',
            title: title,
            text: text,
        }).then((result) => {
            result.isConfirmed;
        });
    };

    function alertConfirmQuestion(title, text, confirmButtonText, cancelButtonText) {
        return Swal.fire({
            title: title,
            text: text,
            icon: 'Question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: confirmButtonText,
            cancelButtonText: cancelButtonText,
            reverseButtons: true, // 버튼 순서 거꾸로

        }).then((result) => {
            return result.isConfirmed;
        });
    }

    function alertConfirmWarning(title, text, confirmButtonText, cancelButtonText) {
        return Swal.fire({
            title: title,
            text: text,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: confirmButtonText,
            cancelButtonText: cancelButtonText,
            reverseButtons: true, // 버튼 순서 거꾸로

        }).then((result) => {
            return result.isConfirmed;
        });
    }