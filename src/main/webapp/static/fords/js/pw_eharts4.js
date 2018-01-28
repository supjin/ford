$(function(){
	///////////////折线图////////////////////////
	var zheChart= echarts.init(document.getElementById('zhe'));
	var zhe_option={
		title: {
	        //text: '未来一周气温变化',
	        //subtext: '纯属虚构'
	    },
	    tooltip: {
	        trigger: 'item',
		    formatter: "{a}<br/>{b} : {c}%"
	    },
	    legend: {
	        data:['生命线','毛线',"煲仔线"]
	    },
	    toolbox: {
	        show: true,
	        feature: {
	            dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    xAxis:  {
	        type: 'category',
	        boundaryGap: false,
	        data: ['周一','周二','周三','周四','周五','周六','周日']
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value} %'
	        }
	    },
	    series: [
	        {
	            name:'生命线',
	            type:'line',
	            data:[30, 10, 20, 40, 30, 25, 20],
	        },
	        {
	            name:'毛线',
	            type:'line',
	            data:[10, 20, 25,30, 40, 40, 40],
	        },
	        {
	            name:'煲仔线',
	            type:'line',
	            data:[70, 75, 80, 90, 80, 75, 60],
	        }
	    ]
	}
	//使用刚指定的配置项和数据显示图表
    zheChart.setOption(zhe_option);
})