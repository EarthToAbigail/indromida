exports.up = (pgm) => {
	pgm.createTable("twitter_infos", 
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
		twiiter_id:
		{
			type:"text",
			unique:true,
			notNull: true
		},
		twitter_mail:
		{
			type: "text",
			unique: "true"
		}
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("twitter_infos", {ifExists: true});
};
