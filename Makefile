
MODEL=mt5.large

all: dev-0/out.tsv test-A/out.tsv test-B/out.tsv

%/out.tsv: %/in.tsv txtplz.py
	./txtplz.py $(MODEL) --input-pattern 'Teleturniej "1 z 10". Zestaw pytań z wiedzy ogólnej. Pytanie: {} Odpowiedź: <>.' --batch-size 4 --search '<extra_id_0>\s*([^<>]+?)\s*<extra_id_1>' --no-sampling < $< > $@ 

clean:
	rm dev-0/out.tsv test-A/out.tsv test-B/out.tsv

