exports.up = (pgm) => {
	pgm.createTable("chats", 
	{
		chat_id:"id",
		chat_title:{type: "varchar(100)", notNull: true},
		chat_description: {type: "text", default: "There is no Description for this chat"},
		created_at: {type: "timestamp"},
		updated_at: {type: "timestamp"}
		
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("chats", {ifExists: true});
};
