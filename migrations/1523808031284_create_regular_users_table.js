exports.up = (pgm) => {
	pgm.createTable("regular_users", 
	{
		user_id:
		{
			type:"int",
			notNull: true, 
			primaryKey: true, 
			references: "users", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		}
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("regular_users", {ifExists: true});
};
