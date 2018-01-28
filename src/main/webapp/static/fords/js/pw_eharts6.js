$(function(){
    /////////////////////扇形图表///////////////////
    var shanChart = echarts.init(document.getElementById('shangx'));
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
	        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
	    },
	    series : [
	        {
	            name: '访问来源',
	            type: 'pie',
	            radius : '70%',//大小
	            center: ['50%', '50%'],//x轴y轴距离
	            data:[
	                {value:335, name:'直接访问'},
	                {value:310, name:'邮件营销'},
	                {value:234, name:'联盟广告'},
	                {value:135, name:'视频广告'},
	                {value:1548, name:'搜索引擎'}
	            ],
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