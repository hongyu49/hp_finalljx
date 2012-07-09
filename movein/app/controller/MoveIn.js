Ext.define("MoveIn.controller.MoveIn", {
	extend: "Ext.app.Controller",
	config: {
		routes:{
			'login': 'showLoginIn',
			'home' : 'showHomeIn',
			'showform/:id' : 'showForm'
		},
		refs: {
			nav: "nav",
			home: "home",
			list: "list",

			btnlogin: "#btn_login",
			btnlist: "#open-list"
		},
		control: {
			btnlogin:{
				tap: "btnlogin"
			},
			btnlist:{
				tap: "btnlist"
			}
		}
	},
	btnlogin: function(){
		var nav = this.getNav();
		var home = Ext.widget("home");
		nav.push(home);
	},
	btnlist: function(){
		var nav = this.getNav();
		var list = Ext.widget("list");
		nav.push(list);
	},
	launch: function () {
		this.callParent();
		console.log("launch");
	},
	init: function () {
		this.callParent();
		console.log("init");
	}
});