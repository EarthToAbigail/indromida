exports.up = (pgm) => {
	pgm.createTable("users_have_interests", 
	{
		user_id:
		{
			type:"int",
			notNull: true, 
			primaryKey: true, 
			references: "users", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		},
		tag: {type: "varchar(50)", notNull: true, primaryKey: true},
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("users_have_interests", {ifExists: true});
};
