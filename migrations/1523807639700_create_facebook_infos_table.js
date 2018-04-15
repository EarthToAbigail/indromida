exports.up = (pgm) => {
	pgm.createTable("facebook_infos", 
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
		facebook_id:
		{
			type:"text",
			unique:true,
			notNull: true
		},
		facebook_mail:
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
	pgm.dropTable("facebook_infos", {ifExists: true});
};
