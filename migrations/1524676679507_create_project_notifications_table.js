exports.up = (pgm) => {
pgm.createTable("project_notifications", 
	{
		not_id: {
			type:"int",
			notNull: true, 
			primaryKey: true, 
			references: "notifications", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		},
		pid:
		{
			type:"int",
			notNull: true, 
			references: "projects", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		}
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("project_notifications", {ifExists: true});
};
