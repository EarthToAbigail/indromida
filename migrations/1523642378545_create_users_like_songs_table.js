exports.up = (pgm) => {
	pgm.createTable("users_like_songs", 
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
		song_id: {type: "text", notNull: true, primaryKey: true},
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("users_like_songs", {ifExists: true});
};
