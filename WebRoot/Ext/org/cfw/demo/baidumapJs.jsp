<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/Ext/head.jsp" />
<script src="http://api.map.baidu.com/api?v=1.2" type="text/javascript"></script>
<style type="text/css">
html{height:100%}
body{height:100%;margin:0px;padding:0px}
#container{height:100%}
</style>
<title>百度地图 演示</title>
</head>
<body>
<div id="container"></div>
<script type="text/javascript">
var map = new BMap.Map("container");          // 创建地图实例
var point = new BMap.Point(116.404, 39.915);  // 创建点坐标
map.centerAndZoom(point, 15);                 // 初始化地图，设置中心点坐标和地图级别

//添加比例尺控件
var opts = {
	offset: new BMap.Size(150, 5),
	type: BMAP_NAVIGATION_CONTROL_SMALL
};  
map.addControl(new BMap.ScaleControl(opts)); 

//添加导航控件
map.addControl(new BMap.NavigationControl());

map.addControl(new BMap.NavigationControl()); //地图平移缩放控件
map.addControl(new BMap.OverviewMapControl()); //缩略地图控件
map.addControl(new BMap.MapTypeControl()); //地图类型控件
map.setCurrentCity("北京"); // 仅当设置城市信息时，MapTypeControl的切换功能才能可用  

//添加标注
point = new BMap.Point(116.410, 39.915);  // 创建点坐标
var marker = new BMap.Marker(point);        // 创建标注  
map.addOverlay(marker);                     // 将标注添加到地图中  

//多标注沿折线运动
var bounds = null;
var linesPoints = null;
var spoi1 = new BMap.Point(116.380967,39.913285);    // 起点1
var spoi2 = new BMap.Point(116.380967,39.953285);    // 起点2
var epoi  = new BMap.Point(116.424374,39.914668);    // 终点
var myIcon = new BMap.Icon("http://dev.baidu.com/wiki/static/map/API/examples/images/Mario.png", new BMap.Size(32, 70), {imageOffset: new BMap.Size(0, 0)});

function initLine(){
    bounds = new Array();
    linesPoints = new Array();
    map.clearOverlays();                                                    // 清空覆盖物
    var driving3 = new BMap.DrivingRoute(map,{onSearchComplete:drawLine});  // 驾车实例,并设置回调
        driving3.search(spoi1, epoi);                                       // 搜索一条线路
    var driving4 = new BMap.DrivingRoute(map,{onSearchComplete:drawLine});  // 驾车实例,并设置回调
        driving4.search(spoi2, epoi);                                       // 搜索一条线路
}

run = function (){
    for(var m = 0;m < linesPoints.length; m++){
        var pts = linesPoints[m];
        var len = pts.length;
        var carMk = new BMap.Marker(pts[0],{icon:myIcon});
        map.addOverlay(carMk);
        resetMkPoint(1,len,pts,carMk)
    }
    
    function resetMkPoint(i,len,pts,carMk){
        carMk.setPosition(pts[i]);
        if(i < len){
            setTimeout(function(){
                i++;
                resetMkPoint(i,len,pts,carMk);
            },100);
        }
    }
    
}

function drawLine(results){
    var opacity = 0.45;
    var planObj = results.getPlan(0);
    var b = new Array();
    var addMarkerFun = function(point,imgType,index,title){
        var url;
        var width;
        var height
        var myIcon;
        // imgType:1的场合，为起点和终点的图；2的场合为车的图形
        if(imgType == 1){
            url = "resources/images/map_icons/dest_markers.png";
            width = 42;
            height = 34;
            myIcon = new BMap.Icon(url,new BMap.Size(width, height),{offset: new BMap.Size(14, 32),imageOffset: new BMap.Size(0, 0 - index * height)});
        }else{
            url = "images/trans_icons.png";
            width = 22;
            height = 25;
            var d = 25;
            var cha = 0;
            var jia = 0
            if(index == 2){
                d = 21;
                cha = 5;
                jia = 1;
            }
            myIcon = new BMap.Icon(url,new BMap.Size(width, d),{offset: new BMap.Size(10, (11 + jia)),imageOffset: new BMap.Size(0, 0 - index * height - cha)});
        }
        
        var marker = new BMap.Marker(point, {icon: myIcon});
        if(title != null && title != ""){
            marker.setTitle(title);
        }
        // 起点和终点放在最上面
        if(imgType == 1){
            marker.setTop(true);
        }
        map.addOverlay(marker);
    }
    var addPoints = function(points){
        for(var i = 0; i < points.length; i++){
            bounds.push(points[i]);
            b.push(points[i]);
        }
    }
    
    // 绘制驾车步行线路
    for (var i = 0; i < planObj.getNumRoutes(); i ++){
        var route = planObj.getRoute(i);
        if (route.getDistance(false) <= 0){continue;}
        addPoints(route.getPath());
        // 驾车线路
        if(route.getRouteType() == BMAP_ROUTE_TYPE_DRIVING){
            map.addOverlay(new BMap.Polyline(route.getPath(), {strokeColor: "#0030ff",strokeOpacity:opacity,strokeWeight:6,enableMassClear:true}));
        }else{
        // 步行线路有可能为0
            map.addOverlay(new BMap.Polyline(route.getPath(), {strokeColor: "#30a208",strokeOpacity:0.75,strokeWeight:4,enableMassClear:true}));
        }
    }
    
    map.setViewport(bounds);
    
    // 终点
    addMarkerFun(results.getEnd().point,1,1);
    // 开始点
    addMarkerFun(results.getStart().point,1,0);
    linesPoints[linesPoints.length] = b;
}

initLine();

</script>
</body>
</html>