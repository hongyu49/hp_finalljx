
Ext.define("MoveIn.view.Form", {
    extend: "Ext.Carousel",
    alias: "widget.form9",
    config: {
		items: [
			{
				xtype: "toolbar",
				docked: "top",
				title: "Form",
				items: [{
					xtype: "button",
					text: "Back",
					ui: "action",
					id:"new-note-back2"
				}]
		
			},
			{
				html : 'Item 1',
				style: 'background-color: #5E99CC'
			},
			{
				html : 'Item 2',
				style: 'background-color: #759E60'
			},
			{
				html : 'Item 3'
			}
		]
    }
});
