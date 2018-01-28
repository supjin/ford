var setting = {
			check: {
				enable: true,
				chkboxType: {"Y":"", "N":""}
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: beforeClick,
				onCheck: onCheck
			}
		};

		var zNodes =[
			{id:4, pId:0, name:"产品", open:true, nocheck:true},
			{id:41, pId:4, name:"产品a"},
			{id:42, pId:4, name:"产品b"},
			{id:43, pId:4, name:"产品c"},
			{id:44, pId:4, name:"产品d"},
			{id:5, pId:0, name:"零件", open:true, nocheck:true},
			{id:51, pId:5, name:"零件1"},
			{id:52, pId:5, name:"零件2"},
			{id:53, pId:5, name:"零件3"},
			{id:54, pId:5, name:"零件4"},
			{id:55, pId:5, name:"零件5"},
			{id:56, pId:5, name:"零件6"},
			{id:57, pId:5, name:"零件7"},
			{id:58, pId:5, name:"零件8"},
			{id:59, pId:5, name:"零件9"},
			{id:60, pId:5, name:"零件10"},
			{id:6, pId:0, name:"福特灯", open:true, nocheck:true},
			{id:61, pId:6, name:"灯1"},
			{id:62, pId:6, name:"灯2"},
			{id:63, pId:6, name:"灯3"},
			{id:64, pId:6, name:"灯4"}
		 ];

		function beforeClick(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}
		
		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
		}

		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});