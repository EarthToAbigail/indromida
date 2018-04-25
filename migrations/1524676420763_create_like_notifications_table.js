exports.up = (pgm) => {
pgm.createTable("like_notifications", 
	{
		not_id: {
			type:"int",
			notNull: true, 
			primaryKey: true, 
			references: "notifications", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		},
		sender_id:
		{
			type:"int",
			notNull: true, 
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
	pgm.dropTable("like_notifications", {ifExists: true});
};
