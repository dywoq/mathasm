package mathasm

import "testing"

func TestPow(t *testing.T) {
	tests := []struct {
		name string
		x    float64
		n    int
	}{
		{"equal check", 2.0, 3},
	}

	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			got := Pow(test.x, test.n)
			want := 8.0
			if got != want {
				t.Errorf("got %v, want %v", got, want)
			}
		})
	}
}
