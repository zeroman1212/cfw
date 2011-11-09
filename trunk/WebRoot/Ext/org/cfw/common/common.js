WELCOME_URL='Ext/welcome.jsp';//欢迎页面

/**
 * 用于grid渲染列值
 * @param store 
 * @param value
 * @returns
 */
function renderByValue(store,value){
	if (!store){
		return value;
	}
	for ( var i = 0; i < store.data.length; i++) {
		if (store.data.items[i].data.value == value) {
			return store.data.items[i].data.display;
		}
	}
	return value;
}