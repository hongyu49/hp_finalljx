var view;
Ext.application({
	name: "MoveIn",
	controllers: ["Move"],
	views: ["Nav", "Login", "Home", "List", "File"],
	launch: function () {
		view = Ext.create("MoveIn.view.Nav");
		Ext.Viewport.add(view);
	}
});