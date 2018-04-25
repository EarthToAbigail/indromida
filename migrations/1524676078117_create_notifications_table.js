exports.up = (pgm) => {
pgm.createTable("notifications", 
	{
		not_id: "id",
		receiver_id:
		{
			type:"int",
			notNull: true, 
			references: "users", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		},
		content:{type: "text", notNull: false},
		url: {type: "text", notNull: false},
		
		created_at: {type: "timestamp", notNull: true},
		seen_at: {type: "timestamp"}
		
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("notifications", {ifExists: true});
};
