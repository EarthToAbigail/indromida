exports.up = (pgm) => {
	pgm.createTable("users_members_of_chats", 
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
		chat_id:
		{
			type:"int",
			notNull: true, 
			primaryKey: true, 
			references: "chats", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		},
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("users_members_of_chats", {ifExists: true});
};
