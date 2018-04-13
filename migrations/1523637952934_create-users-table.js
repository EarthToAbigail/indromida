exports.up = (pgm) => {
	pgm.createTable("users", 
	{
		id:"id",
		username: {type: "varchar(100)", unique: true},
		email: {type: "varchar(255)", unique: true},
		firstname: {type: "varchar(100)"},
		lastname: {type: "varchar(100)"},
		birthdate: {type: "timestamp"},
		biography: {type: "text"},
		gender: {type: "bit"},
		phone: {type: "varchar(100)"},
		profile_picture: {type: "text"},
		password_hash: {type: "text"},
		country: {type: "varchar(100)"},
		city: {type: "varchar(100)"},
		profile_privacy: {type: "bit"},
		messaging_privacy: {type: "bit"},
		created_at: {type: "timestamp"},
		updated_at: {type: "timestamp"}
	},
	{
		ifNotExists: true
	});
};

exports.down = (pgm) => {
	pgm.dropTable("users", {ifExists: true});
};
