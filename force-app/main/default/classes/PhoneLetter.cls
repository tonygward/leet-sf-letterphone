public with sharing class PhoneLetter {

    private Map<String, List<String>> digitLetters = new Map<String, List<String>> {
        '0' => new List<String>(),
        '1' => new List<String>(),
        '2' => new List<String> { 'a', 'b', 'c' },
        '3' => new List<String> { 'd', 'e', 'f' },
        '4' => new List<String> { 'g', 'h', 'i' },
        '5' => new List<String> { 'j', 'k', 'l' },
        '6' => new List<String> { 'm', 'n', 'o' },
        '7' => new List<String> { 'p', 'q', 'r', 's' },
        '8' => new List<String> { 't', 'u', 'v' },
        '9' => new List<String> { 'w', 'x', 'y', 'z' },
        '*' => new List<String>(),
        '#' => new List<String>()
    };

	public List<String> dial(String digits){
        if (String.isBlank(digits)) {
            return new List<String>();
        }

        List<String> values = new List<String>();
        IterableString digit = new IterableString(digits);
        while (digit.hasNext()) {
            List<String> letters = this.digitLetters.get(digit.next());
            if (values.isEmpty()) {
                values = letters;
                continue;
            }
            List<String> valuesTemp = mergeLists(values, letters);
            values.clear();
            values.addAll(valuesTemp);
        }
        return values;
	}

    private List<String> mergeLists(List<String> firstList, List<String> secondList) {
        List<String> values = new List<String>();
        for (String first : firstList) {
            for (String second : secondList) {
                values.add(first + second);
            }
        }
        return values;
    }

    public class IterableString implements Iterator<String> {

        private String values;
        private Integer currentIndex = 0;

        public IterableString(String values) {
            this.values = values;
        }

        public Boolean hasNext() {
            if (String.isBlank(this.values)) {
                return false;
            }
            if (currentIndex >= this.values.length()) {
                return false;
            }
            return true;
        }

        public String next() {
            if (this.hasNext() == false) {
                throw new NoSuchElementException('Iterator has not more elements');
            }
            currentIndex = currentIndex + 1;
            return this.values.substring(currentIndex - 1, currentIndex);
        }
    }
}