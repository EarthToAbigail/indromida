exports.up = (pgm) => {
	pgm.createTable("musicians_interested_projects", 
	{
		user_id:
		{
			type:"int",
			notNull: true, 
			primaryKey: true, 
			references: "musicians", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		},
		pid:
		{
			type:"int",
			notNull: true, 
			primaryKey: true, 
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
	pgm.dropTable("musicians_play_instruments", {ifExists: true});
};
