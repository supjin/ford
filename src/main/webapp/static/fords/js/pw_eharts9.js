$(function(){
	///////////////折线图////////////////////////
	var bzheChart= echarts.init(document.getElementById('bzhe'));
	var bzhe_option={
		title: {
	        //text: '未来一周气温变化',
	        //subtext: '纯属虚构'
	    },
	    tooltip: {
	        trigger: 'item',
		    formatter: "{a}<br/>{b} : {c}"
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
	        data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value} '
	        }
	    },
	    series: [
	        {
	            name:'生命线',
	            type:'line',
	            data:[3000, 1000, 2000, 4000, 3000, 2500, 2000, 2000, 4000, 3000, 2500, 2000],
	        },
	        {
	            name:'毛线',
	            type:'line',
	            data:[1000, 2000, 2500,3000, 4000, 40000, 4000, 2500,3000, 4000, 4000, 4000],
	        },
	        {
	            name:'煲仔线',
	            type:'line',
	            data:[700, 75000, 8000, 9000, 8000, 7500, 6000, 8000, 9000, 8000, 7500, 600],
	        }
	    ]
	}
	//使用刚指定的配置项和数据显示图表
    bzheChart.setOption(bzhe_option);
})