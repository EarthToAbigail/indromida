exports.up = (pgm) => {
	pgm.createTable("projects_require_instruments", 
	{
		pid:
		{
			type:"int",
			notNull: true, 
			primaryKey: true, 
			references: "projects", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		},
		instrument:
		{
			type: "varchar(100)",
			notNull: true,
			primaryKey: true
		}
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("projects_require_instruments", {ifExists: true});
};
