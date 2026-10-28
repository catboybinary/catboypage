<script lang="ts">
	const BIRTH_DATE = Date.UTC(2006, 4, 5, 0, 55); // 05.05.2006 00:55 UTC
	const DECIMALS = 9;

	let now = $state(Date.now());

	$effect(() => {
		now = Date.now();
		const interval = setInterval(() => (now = Date.now()), 20);
		return () => clearInterval(interval);
	});

	function birthday(year: number) {
		return Date.UTC(year, 4, 5, 0, 55);
	}

	function ageInYears(at: number) {
		if (at <= BIRTH_DATE) return 0;

		const birthYear = new Date(BIRTH_DATE).getUTCFullYear();
		let completedYears = new Date(at).getUTCFullYear() - birthYear;
		let lastBirthday = birthday(birthYear + completedYears);

		if (lastBirthday > at) {
			completedYears--;
			lastBirthday = birthday(birthYear + completedYears);
		}

		const nextBirthday = birthday(birthYear + completedYears + 1);
		const fraction = (at - lastBirthday) / (nextBirthday - lastBirthday);

		return completedYears + fraction;
	}

	const age = $derived(ageInYears(now).toFixed(DECIMALS));
</script>

<h1 class="fancy fancy-shadow">SYSTEM</h1>
<p>Username: catboybinary</p>
<p>Age: {age}</p>
<p>Pronouns: any</p>
<p>im testing in prod</p>
