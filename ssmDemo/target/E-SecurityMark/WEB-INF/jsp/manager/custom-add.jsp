<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: 24537
  Date: 2019/1/31
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <jsp:include page="common/head.jsp"></jsp:include>
    <link rel="stylesheet" href="../../../statics/lib/layui/css/layui.css"  media="all">
    <title>添加客服</title>
</head>
<body style="min-height: 0px;">
<div class="codeView docs-example">
    <form onsubmit="return false;" class="form form-horizontal" id="permissionAdd">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">联系方式：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="联系方式" id="userPhone" name="userPhone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">客服头像：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class="z_photo upimg-div clear proDetail" style="border: 2px dashed #E7E6E6; width: 160px;padding: 3px;">
                    <div id="preview" style="width: 160px;height: 150px;">
                        <img id="imgProDetail0" name="imgProDetail0" border="0" src="../../../statics/img/a11.png" width="160" height="150" onclick="$('#previewImg').click();">
                    </div>
                    <input type="file" onchange="onePicUpLoad(this,0,160,150)" style="display: none;" id="previewImg">
                </div>
                <span style="color: #7E7E7E;">温馨提示：为了美观，像素尺寸规定为：640*640</span>
            </div>
        </div>

        <div class="row cl" style="margin-top: 93px;">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont"></i> 提交</button>
            </div>
        </div>
    </form>
</div>
<jsp:include page="common/foot.jsp"></jsp:include>
<script src="../../../statics/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="../../../statics/lib/jquery.validation/1.14.0/additional-methods.js"></script>
<script type="text/javascript" src="../../../statics/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script src="../../../statics/common/imgUp/imgUp.js"></script>
<script src="../../../statics/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    $("#permissionAdd").validate({
        rules:{
            userPhone:{
                required:true
            },
            imgProDetail0:{
                required:true,
                notEqualTo:'../../../statics/img/a11.png'
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            var userPhone = $("#userPhone").val();
            var imgPath=$("#imgProDetail0").attr("src");

            var data={
                userPhone:userPhone,
                userImg:imgPath
            }
            postData("addCustom",data,function (res) {
                if(res.status == "1"){
                    parent.location.replace(parent.location.href)
                }else{
                    layer.msg("添加失败 T.T," + res.errmsg,{icon:5,time:3000})
                }
            })

        }
    });


    //----------------------视频上传----------------------------

    var ot; //时间
    var oloaded;//大小
    //上传文件方法
    function UpladFile() {
        var fileObj = document.getElementById("videoFile").files[0]; // js 获取文件对象
        if(fileObj.name){
            $(".el-upload-list").css("display","block");
            $(".el-upload-list li").css("border","1px solid #20a0ff");
            $("#videoName").text(fileObj.name);
        }else{
            alert("请选择文件");
        }
    }
    /*点击取消*/
    function del(){
        $("#file").val('');
        $(".el-upload-list").css("display","none");
    }
    /*点击提交*/
    function sub(){
        var fileObj = document.getElementById("videoFile").files[0]; // js 获取文件对象
        if(fileObj==undefined||fileObj==""){
            alert("请选择文件");
            return false;
        };
        var url = "/admin/upload/videoUpload"; // 接收上传文件的后台地址

        var data = new FormData();
        data.append("file", fileObj);

        var form = new FormData(); // FormData 对象
        form.append("file", fileObj); // 文件对象
        xhr = new XMLHttpRequest(); // XMLHttpRequest 对象
        xhr.open("post", url, true); //post方式，url为服务器请求地址，true 该参数规定请求是否异步处理。
        xhr.onload = uploadComplete; //请求完成
        xhr.onerror = uploadFailed; //请求失败
        xhr.upload.onprogress = progressFunction; //【上传进度调用方法实现】
        xhr.upload.onloadstart = function() { //上传开始执行方法
            ot = new Date().getTime(); //设置上传开始时间
            oloaded = 0; //设置上传开始时，以上传的文件大小为0
        };
        xhr.send(form); //开始上传，发送form数据

    }


    //上传进度实现方法，上传过程中会频繁调用该方法
    function progressFunction(evt) {
        // event.total是需要传输的总字节，event.loaded是已经传输的字节。如果event.lengthComputable不为真，则event.total等于0
        if(evt.lengthComputable) {
            $(".container").css("display","block");
            /*进度条显示进度*/
            $(".loading").css("width", Math.round(evt.loaded / evt.total * 100) + "%");
            $(".loadText").text(Math.round(evt.loaded / evt.total * 100) + "%");

            //注意进度条依赖 element 模块，否则无法进行正常渲染和功能性操作
            layui.use('element', function(){
                var element = layui.element;
                element.progress('demo', Math.round(evt.loaded / evt.total * 100) + "%");
            });
            if(Math.round(evt.loaded / evt.total * 100) == 100){
                //加载层-风格4
                layerLoadID=layer.msg('正在上传至阿里云，请稍后...', {
                    icon: 16,
                    shade: 0.01,
                    time:false //取消自动关闭
                });
            }
        }

        var time = document.getElementById("time");
        var nt = new Date().getTime(); //获取当前时间
        var pertime = (nt - ot) / 1000; //计算出上次调用该方法时到现在的时间差，单位为s
        ot = new Date().getTime(); //重新赋值时间，用于下次计算

        var perload = evt.loaded - oloaded; //计算该分段上传的文件大小，单位b
        oloaded = evt.loaded; //重新赋值已上传文件大小，用以下次计算

        //上传速度计算
        var speed = perload / pertime; //单位b/s
        var bspeed = speed;
        var units = 'b/s'; //单位名称
        if(speed / 1024 > 1) {
            speed = speed / 1024;
            units = 'k/s';
        }
        if(speed / 1024 > 1) {
            speed = speed / 1024;
            units = 'M/s';
        }
        speed = speed.toFixed(1);
        //剩余时间
        var resttime = ((evt.total - evt.loaded) / bspeed).toFixed(1);
        time.innerHTML = '上传速度：' + speed + units + ',剩余时间：' + resttime + 's';
        if(bspeed == 0)
            time.innerHTML = '上传已取消';
    }
    //上传成功响应
    function uploadComplete(evt) {
        if(evt.target.responseText){
            var result = JSON.parse(evt.target.responseText);
            //服务端接收完文件返回的结果  注意返回的字符串要去掉双引号
            if(result.status == "1"){
                layer.close(layerLoadID);//手动关闭 加载
                layer.msg("上传成功",{icon:1,time:2000})
                $(".el-upload-list__item-status-label").css('display','block');
                if($(".preview video source").length > 0){
                    $(".preview video source").attr('src',result.result.data);
                }else{
                    $(".preview").append("<video oncanplaythrough='myFunction(this)'  controls='' autoplay='' name='media' style='max-width: 563px;'><source src="+result.result.data+" type='video/mp4'></video>");
                }
                $(".preview").attr('data-videoSrc',result.result.data);
            }else{
                layer.msg("上传失败！",{icon:5,time:2000})
            }
        }else{
            layer.msg("上传失败:响应数据为空",{icon:5,time:2000})
        }
    }
    //上传失败
    function uploadFailed(evt) {
        alert("上传失败！");
    }

    function myFunction(ele) {
        var hour = parseInt((ele.duration)/3600);
        var minute = parseInt((ele.duration%3600)/60);
        var second = Math.ceil(ele.duration%60);
        //console.log(Math.floor(ele.duration));
        //document.write("这段视频的时长为："+hour+"小时，"+minute+"分，"+second+"秒");
        console.log("这段视频的时长为："+hour+"小时，"+minute+"分，"+second+"秒");
    }

</script>

</body>
</html>
