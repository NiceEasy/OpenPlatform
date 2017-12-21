<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form"%>
<%  //路径配置 
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/";   
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta name="viewport" content="width=device-width, initial-scale = 1.0, user-scalable = no">
<title>Vue Test</title>
<link href="<%=basePath%>static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
	.class1{
	  background: #444;
	  color: #eee;
	}
</style>

<script type="text/javascript" src="<%=basePath%>static/vue/dist/vue.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-3.2.1.min.js"> </script>
<script src="<%=basePath%>static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
	<div id="app">
	  <p>{{ message }}</p>
	</div>
	
	<div id="app2">
	    <div v-html="message"></div>
	</div>
	
	<div id="app3">
	  <label for="r1">修改颜色</label><input type="checkbox" v-model="class1" id="r1">
	  <br><br>
	  <div v-bind:class="{'class1': class1}">
	    directiva v-bind:class
	  </div>
	</div>
	
	<div id="app4">
		{{5+5}}<br>
		{{ ok ? 'YES' : 'NO' }}<br>
		{{ message.split('').reverse().join('') }}
		<div v-bind:id="'list-' + id">菜鸟教程</div>
	</div>
	
	<div id="app5">
	    <p v-if="seen">现在你看到我了</p>
	    <template v-if="ok">
	      <h1>Test教程</h1>
	      <p>学的不仅是技术，更是梦想！</p>
	      <p>哈哈哈，打字辛苦啊！！！</p>
	    </template>
	</div>
	
	<div id="app6">
	    <pre><a v-bind:href="url">跳转链接</a></pre>
	</div>
	
	<div id="app61">
	    <pre><a v-on:click="doSomething">doSomething</a></pre>
	</div>
	
	<div id="app7">
	    <p>{{ message }}</p>
	    <input v-model="message">
	</div>
	
	<div id="app8">
	  {{ message | capitalize }}
	</div>
	
</body>
<script>
	new Vue({
	  el: '#app',
	  data: {
	    message: 'Hello Vue.js!'
	  }
	})
	
	new Vue({
		  el: '#app2',
		  data: {
		    message: '<h1>Test教程</h1>'
		  }
		})
	
	new Vue({
		el: '#app3',
	  data:{
	  	class1: false
	  }
	});
	
	new Vue({
		  el: '#app4',
		  data: {
			ok: true,
		    message: 'RUNOOB',
			id : 1
		  }
		})
	
	new Vue({
		  el: '#app5',
		  data: {
		    seen: true,
		    ok: true
		  }
		})
	
	new Vue({
		  el: '#app6',
		  data: {
		    url: 'http://www.baidu.com'
		  }
		})
	
	new Vue({
		  el: '#app61',
		  data: {
			  name: 'http://www.baidu.com'
		  },
		  // 在 `methods` 对象中定义方法
		  methods: {
			 doSomething: function (event) {
				      // 方法内 `this` 指向 vm
				      console.info('Hello ' + this.name + '!')
				      // `event` 是原生 DOM 事件
				      console.info(event.target.tagName)
		    }
		  }
		})
	
	new Vue({
		  el: '#app7',
		  data: {
		    message: 'Runoob!'
		  }
		})
	
	new Vue({
		  el: '#app8',
		  data: {
			message: 'runoob'
		  },
		  filters: {
		    capitalize: function (value) {
		      if (!value) return ''
		      value = value.toString()
		      return value.charAt(0).toUpperCase() + value.slice(1) + " ABCDEF"
		    }
		  }
		})
	
	Vue.config.debug = true;// 开启vue 调试功能
    new Vue({
        el: '#app9',
        data: {
            images: []
        },
        methods: {
            addPic(e){
                e.preventDefault();
                $('input[type=file]').trigger('click');
                return false;
            },
            onFileChange(e) {
                var files = e.target.files || e.dataTransfer.files;
                if (!files.length)return; 
                this.createImage(files);
            },
            createImage(file) {
                if(typeof FileReader==='undefined'){
                    alert('您的浏览器不支持图片上传，请升级您的浏览器');
                    return false;
                }
                var image = new Image();         
                var vm = this;
                var leng=file.length;
                for(var i=0;i<leng;i++){
                    var reader = new FileReader();
                    reader.readAsDataURL(file[i]); 
                    reader.onload =function(e){
                    vm.images.push(e.target.result);                                    
                    };                 
                }                        
            },
            delImage:function(index){
                this.images.shift(index);
            },
            removeImage: function(e) {
                this.images = [];
            },
            uploadImage: function() {
                console.log(this.images);
                return false;
                var obj = {};
                obj.images=this.images
                $.ajax({
                    type: 'post',
                    url: "upload.php",
                    data: obj,
                    dataType: "json",
                    success: function(data) {
                        if(data.status){
                            alert(data.msg);
                            return false;
                        }else{
                            alert(data.msg);
                            return false;
                        }
                    }
                });
            }
        }
    })
</script>

</html>