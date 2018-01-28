$(function(){
    /////////////////////环形图表///////////////////
    var huanChart = echarts.init(document.getElementById('huangx'));
    var hengdata = new Array(); 
    var zhidata = new Array(); 
    for (var i=0; i<procjsonObj.length; i++) {
		hengdata[i]="";
		zhidata[i]=procjsonObj[i].name;
		
	}
    //指定图表的配置项和数据
    var  huan_option= {
        tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        x: 'left',
	        data:zhidata
	    },
	    series: [
	        {
	            name:'访问来源',
	            type:'pie',
	            radius: ['50%', '70%'],
	            avoidLabelOverlap: false,
	            label: {
	                normal: {
	                    show: false,
	                    position: 'center'
	                },
	                emphasis: {
	                    show: false,//中间文字是否显示
	                    textStyle: {
	                        fontSize: '30',
	                        fontWeight: 'bold'
	                    }
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:procjsonObj
	        }
	    ]
	}
    //使用刚指定的配置项和数据显示图表
    huanChart.setOption(huan_option);
})