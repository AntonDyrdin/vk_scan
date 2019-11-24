function downloadFile(file_path){
    window.location = file_path
}
function startScan(){
    $.ajax({
        type: 'POST',
        url: 'start_scan_by_fork'
    });
}
