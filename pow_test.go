package mathasm

import "testing"

func TestPow(t *testing.T) {
	tests := []struct {
		name string
		x    float64
		n    int
		want float64
	}{
		{"equal check", 2.0, 3, 8.0},
	}

	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			got := Pow(test.x, test.n)
			if got != test.want {
				t.Errorf("got %v, want %v", got, test.want)
			}
		})
	}
}

func BenchmarkPow(b *testing.B) {
	for b.Loop() {
		_ = Pow(2.0, 3)
	}
}
