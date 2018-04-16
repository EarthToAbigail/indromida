exports.up = (pgm) => {
	pgm.createTable("musicians_play_instruments", 
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
	pgm.dropTable("musicians_play_instruments", {ifExists: true});
};
