/**
 * 轮播图管理
 */
layui.define(
				[ 'form', 'layer', 'laypage', 'laydate' ],
				function(exports) {
					var $ = layui.jquery, form = layui.form(), layer = layui.layer, laypage = layui.laypage;
					exports('AddNews', {});
					// 注意，这里是模块输出的核心，模块名必须和list时的模块名一致
					// 一进入,页面进行全查询
					// 按钮绑定

					// 处理请求
					function processAajxSubmit(url, submitdata) {
						$.ajax({
							type : "post",
							url : url,
							async : true,
							data : submitdata,
							success : function(data) {
								if(data.code==200){
					 				parent.layer.msg("保存成功");
					 				var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
						    		parent.layer.close(index); //执行关闭  这两句的意思是关闭当前窗口
					 			}else{
					 				layer.msg("对不起,服务器连接不上,请刷新");
					 			}
							}

						});
					}
					// 添加的方法
					$("#btn_EditNews").click(
							function() {
								var submitdata = $("#news_form").serialize();
								processAajxSubmit(webPath
										+ "/news/saveNews",
										submitdata);
								return false;
							});

				})