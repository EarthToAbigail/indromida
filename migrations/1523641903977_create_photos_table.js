exports.up = (pgm) => {
	pgm.createTable("photos", 
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
		link: {type: "text", notNull: true, primaryKey: true},
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("photos", {ifExists: true});

};
