exports.up = (pgm) => {
	pgm.createTable("google_infos", 
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
		google_id:
		{
			type:"text",
			unique:true,
			notNull: true
		},
		google_mail:
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
	pgm.dropTable("google_infos", {ifExists: true});
};
