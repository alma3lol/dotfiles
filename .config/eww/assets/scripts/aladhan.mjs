import axios from "axios";
import fs from "fs";
import moment from "moment";

const current_date = moment().format("DD-MM-YYYY");
let prayer_data = {};
if (fs.existsSync(`/tmp/${current_date}.json`)) {
	prayer_data = JSON.parse(fs.readFileSync(`/tmp/${current_date}.json`));
} else {
	prayer_data = await axios
		.get("http://ip-api.com/json")
		.then(async (res) => {
			const country = res.data.country;
			const city = res.data.city;
			const prayer_data = await axios
				.get(
					`http://api.aladhan.com/v1/timingsByCity/${current_date}?city=${city}&country=${country}&method=8`
				)
				.then((res) => res.data);
			fs.writeFileSync(
				`/tmp/${current_date}.json`,
				JSON.stringify(prayer_data)
			);
			return prayer_data;
		});
}

const now = moment();
const prayer_timings = prayer_data.data.timings;
const times = [
	"Midnight",
	"Lastthird",
	"Imsak",
	"Fajr",
	"Sunrise",
	"Dhuhr",
	"Asr",
	"Maghrib",
	"Isha",
	"Firstthird",
];
for (var i = 0; i < times.length; i++) {
	const time = moment(prayer_timings[times[i]], "HH:mm");
	if (now > time) {
		if (now <= time.clone().add(20, "m")) {
			console.log(
				`Past ${times[i]} (+${now.diff(time, "minutes")} minutes)`
			);
			break;
		}
	} else {
		if (time <= now.clone().add(20, "m")) {
			console.log(
				`${times[i]} in (-${time.diff(now, "minutes")} minutes)`
			);
		} else {
			const diff = moment.utc(time.diff(now));
			console.log(
				`${times[i]} in (-${diff.format("HH")}:${diff.format("mm")})`
			);
		}
		break;
	}
}
