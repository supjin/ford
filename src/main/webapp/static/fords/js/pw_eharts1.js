$(function(){	/////////////////////柱状图表///////////////////
    var myChart = echarts.init(document.getElementById('main'));
   
    var hengdata = new Array(); 
    var zhidata = new Array(); 
   for (var i=0; i<jsonObj.length; i++) {
		hengdata[i]="";
		zhidata[i]=jsonObj[i].NONLVE;
	}
  
    //指定图表的配置项和数据
    var option = {
        title:{
            //text:'EChars入门'
        },
        //提示框组件
        tooltip:{
            //坐标轴触发，主要用于柱状图，折线图等
            trigger:'axis'
        },
        //图例
        legend:{
            data:['销量']
        },
        //横轴
        xAxis:{
            data:hengdata,
        },
        //纵轴
        yAxis:{
        },
        //系列列表。每个系列通过type决定自己的图表类型
        series:[{
            //name:'销量',
            //柱形图
            type:'bar',
            data:zhidata,
            //设置柱子的宽度
            barWidth : 30,
            //配置样式
            itemStyle: {   
                //通常情况下：
                normal:{  
　　　　　　　　　　　　//每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
                    color: function (params){
                        var colorList = ['#c3b79d','#3487bd','#747b8b','#117ca8','#bf93c6','#0c9ab0','#af76ba','#10ac96','#92559b','#24cab2'];
                        return colorList[params.dataIndex];
                    }
                },
                //鼠标悬停时：
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            },
        }],
        //控制边距　
        grid: {
            left: '0%',
            right:'10%',
            containLabel: true//边距开关
        },
    };
    //使用刚指定的配置项和数据显示图表
    myChart.setOption(option);
})