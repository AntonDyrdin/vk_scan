function startScan(){
    $.ajax({
        type: 'POST',
        url: 'start_scan_by_fork'
    });
}