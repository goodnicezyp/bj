/**
 * Created by Pengxx on 2016/8/25 0025.
 */
/*ajax封装*/
function postData(path, data, callback, errorCallback) {
    this.data = data;
    $.ajax({
        url: path,
        data: data,
        traditional: true,
        dataType: 'json',
        type: 'POST',
        success: callback,
        error: errorCallback
    })
}
