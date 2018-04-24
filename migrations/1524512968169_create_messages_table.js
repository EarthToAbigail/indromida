exports.up = (pgm) => {
pgm.createTable("messages", 
	{
		chat_id:
		{
			type:"int",
			notNull: true, 
			primaryKey: true, 
			references: "chats", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		},
		sender_id:
		{
			type:"int",
			notNull: true, 
			primaryKey: true, 
			references: "users", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		},
		content:{type: "text", notNull: true},
		sent_at: {type: "timestamp", notNull: true},
		delivered_at: {type: "timestamp"}
		
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("messages", {ifExists: true});
};
