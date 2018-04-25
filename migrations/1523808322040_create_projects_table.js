exports.up = (pgm) => {
	pgm.createTable("projects", 
	{
		pid: "id",
		user_id:
		{
			type:"int",
			notNull: true, 
			references: "musicians", 
			onDelete: "cascade",
			onUpdate: "cascade" 
		},
		title: 
		{
			type:"text",
			notNull: true
		},
		date:
		{
			type: "timestamp"
		},
		genre:
		{
			type: "varchar(100)"
		},
		n_participants: 
		{
			type: "int"
		},
		location:
		{
			type: "text"
		},
		Description:
		{
			type: "text"
		}
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("projects", {ifExists: true});
};
