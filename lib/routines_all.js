{
	routines_all: [
		{
			week_1: {
				day_1: {
					date: "Monday July 24, 2023",
					workouts: {
						workout_1: {
							name: "Cool down",
							routines: [{ name: Lunges, duration: 31 }],
						},
						workout_3: {
							name: Warmup,
							routines: [{ name: Lunges, duration: 31 }],
						},
						workout_4: {
							name: "Core 1",
							routines: [{ name: Pushups, duration: 60 }],
						},
					},
				},
				day_3: {
					date: "Wednesday, July 26, 2023",
					workout_4: {
						name: "Legs 1",
						routines: [
							{ name: Squats, duration: 2 },
							{ name: Lunges, duration: 31 },
						],
					},
					workout_5: {
						name: "warm up",
						routines: [
							{ name: "Jumping jacks", duration: 30 },
							{ name: "High knees", duration: 60 },
						],
					},
					workout_6: {
						name: "Core 2",
						routines: [
							{ name: Burpees, duration: 60 },
							{ name: Pushups, duration: 60 },
							{ name: "Jumping jacks", duration: 30 },
						],
					},
				},
				day_5: {
					date: "Friday, July 28, 2023",
					workout_6: {
						name: "Core 2",
						routines: [
							{ name: Burpees, duration: 60 },
							{ name: Pushups, duration: 60 },
							{ name: "Jumping jacks", duration: 30 },
						],
					},
					workout_7: {
						name: "legs 2",
						routines: [
							{ name: "Right side lunges", duration: 60 },
							{ name: "Left side lunges", duration: 60 },
							{ name: "High knees", duration: 60 },
						],
					},
				},
			},
		},
	];
}

const payload = {
	city: null,
	company_photo: [
		"data:image/png;base64,/9j/4AAQSkZJRgABAQAAAQABAAD",

		"data:image/png;base64,/9j/4QAYRXhpZgAASUkqAAgAAAA",

		"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAACmY",

		"data:image/png;base64,/9j/4QAYRXhpZgAASUkqAAgAAAA",
	],
	country: "Nigeria",
	cover_photo: "data:image/png;base64,/9j/4AAQSkZJRgABAQAAAQABAAD",
	experience_years: "3",
	identification_type: "",
	identity_number: "",
	instant_service: "no",
	mobile_service: "no",
	office_address: "Abuja, Federal Capital Territory, Nigeria",
	phone_number: "0076607130",
	professional_skill: "Mechanic",
	professional_skill_data:
		'{"Mechanic":{"isTicked":false,"specs":{"General Repairs":false,"Computer Diagnoses":false,"Routine  Servicing":false,"Engine Repair":false,"Brake Repair":false}},"Body Shop":{"isTicked":false,"specs":{"Fix body part":false,"Remove dents":false,"Install windshields":false,"Painting Straighten":false,"Metal panels":false}},"Car Air - Conditioning":{"isTicked":false,"specs":{"Install":false,"Compressor":false,"Leakage":false,"Fix":false,"Condenser":false,"Fill Gas":false}},"Electrical":{"isTicked":false,"specs":{"Lighting system":false,"Coil":false,"Fuse":false,"Fuelpump":false,"Re-wire":false}},"Tire Shop":{"isTicked":false,"specs":{"Flat tire":false,"Gauge tire":false,"Wheel Balancing":false,"Alignment Rotating":false,"Tire replacement":false}},"Towing":{"isTicked":false,"specs":{"Accident  Car":false,"Road Assistant":false,"Transportation":false,"Heavy Duty":false,"Small Duty":false}},"security":{"isTicked":false,"specs":{"Car Alarm":false,"Tracker":false,"GPS":false,"Key Programmer":false,"Camera":false}}}',
	referral_code: "",
	shop_description: "The First. The Best. ",
	shop_name: "Mech First",
	state: "lagos",
	tax_identification_no: "",
	vehicle_type: ["Acura"],
	vehicle_type_data:
		'{"Acura":true,"Audi":false,"Aston":false,"Martin":false,"Abarth":false,"IVM":false,"Daihatsu":false,"Porsche":false,"Bentely":false,"Alfa":false,"Romeo":false,"Datsun":false,"Mercedes-Benz":false,"Jaguar":false,"Ferrari":false,"Honda":false,"Opel":false,"Lotus":false,"Fiat":false,"Infiniti":false,"Ford":false,"McLaren":false,"Lamborghini":false,"Isuzu":false,"Volkswagen":false,"Mini":false,"Lancia":false,"Lexus":false,"BMW":false,"Rolls-Royce":false,"Maserati":false,"Mazda":false,"Vauxhall":false,"Pegan":false,"Mitsubishi":false,"Ultima":false,"Morris":false,"Nissan":false,"Noble":false,"Nord":false,"Suzuki":false,"Mercury":false,"Renault":false,"Toyota":false,"Lincoln":false,"Pontiac":false,"Kia":false,"Chevrolet":false,"MG":false,"Hyundai":false,"Buick":false,"Joylong":false,"Cadillac":false,"Jeep":false,"Geely":false,"Chrysler":false,"Jac":false,"Changan":false,"Iveco":false,"Daewoo":false,"Hummer":false,"Saab":false,"Great":false,"wall":false,"Samsung":false,"GMC":false,"Saturn":false,"Foton":false,"Scion":false,"Seat":false,"Dongfeng":false,"Skoda":false,"Dodge":false,"Ssang":false,"Yong":false,"Citroen":false,"Subaru":false,"Alfa Romeo":false,"Aston Martin":false,"Cheverolet":false,"FIAT":false,"Genesis":false,"INFINITI":false,"isuzu":false,"Land Rover":false,"MINI":false,"Polestar":false,"Ram":false,"smart":false,"Tesla":false,"Volvo":false}',
	working_hours: {
		Sunday: {
			from: { hour: "1", meridian: "AM" },
			to: { hour: "5", meridian: "PM" },
		},
	},
	working_hours_data:
		'{"Sunday":{"isChecked":true,"time":{"from":{"hour":"1","meridian":"AM"},"to":{"hour":"5","meridian":"PM"}}},"Thursday":{"isChecked":false,"time":{"from":{"hour":"","meridian":"AM"},"to":{"hour":"","meridian":"PM"}}},"Monday":{"isChecked":false,"time":{"from":{"hour":"","meridian":"AM"},"to":{"hour":"","meridian":"PM"}}},"Friday":{"isChecked":false,"time":{"from":{"hour":"","meridian":"AM"},"to":{"hour":"","meridian":"PM"}}},"Tuesday":{"isChecked":false,"time":{"from":{"hour":"","meridian":"AM"},"to":{"hour":"","meridian":"PM"}}},"Saturday":{"isChecked":false,"time":{"from":{"hour":"","meridian":"AM"},"to":{"hour":"","meridian":"PM"}}},"Wednesday":{"isChecked":false,"time":{"from":{"hour":"","meridian":"AM"},"to":{"hour":"","meridian":"PM"}}}}',
};
