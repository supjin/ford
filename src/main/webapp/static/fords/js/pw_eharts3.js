$(function(){
    /////////////////////扇形图表///////////////////
    var shanChart = echarts.init(document.getElementById('shan'));
    var hengdata = new Array(); 
    var zhidata = new Array(); 
   for (var i=0; i<equjsonObj.length; i++) {
		hengdata[i]="";
		zhidata[i]=equjsonObj[i].name;
		
	}
    //指定图表的配置项和数据
    var  shan_option= {
        title : {
	        //text: '某站点用户访问来源',
	        //subtext: '纯属虚构',
	        x:'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        left: 'left',
	        data: zhidata
	    },
	    series : [
	        {
	            name: '访问来源',
	            type: 'pie',
	            radius : '70%',//大小
	            center: ['50%', '50%'],//x轴y轴距离
	            data:equjsonObj,
	            itemStyle: {
	                emphasis: {
	                    shadowBlur: 10,
	                    shadowOffsetX: 0,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            }
	        }
	    ],
	}
    //使用刚指定的配置项和数据显示图表
    shanChart.setOption(shan_option);
})