using FuzzyLogic

fis = @mamfis function denoise(x[1:8])::y
    for i = 1:8
        x[i] := begin
            domain = -1000:1000
            POS = TriangularMF(-255.0, 255.0, 765.0)
            NEG = TriangularMF(-765.0, -255.0, 255.0)
        end
    end

    y := begin
        domain = -1000:1000
        PO = TriangularMF(-255.0, 255.0, 765.0)
        NE = TriangularMF(-765.0, -255.0, 255.0)
    end

    x2 == POS && x5 == POS && x7 == POS --> y == PO
    x5 == POS && x7 == POS && x4 == POS --> y == PO
    x7 == POS && x4 == POS && x2 == POS --> y == PO
    x4 == POS && x2 == POS && x5 == POS --> y == PO
    x1 == POS && x3 == POS && x8 == POS && x6 == POS --> y == PO
    x1 == POS && x2 == POS && x3 == POS && x5 == POS --> y == PO
    x2 == POS && x3 == POS && x5 == POS && x8 == POS --> y == PO
    x3 == POS && x5 == POS && x8 == POS && x7 == POS --> y == PO
    x5 == POS && x8 == POS && x7 == POS && x6 == POS --> y == PO
    x8 == POS && x7 == POS && x6 == POS && x4 == POS --> y == PO
    x7 == POS && x6 == POS && x4 == POS && x1 == POS --> y == PO
    x6 == POS && x4 == POS && x1 == POS && x2 == POS --> y == PO
    x4 == POS && x1 == POS && x2 == POS && x3 == POS --> y == PO
    x2 == NEG && x5 == NEG && x7 == NEG --> y == NE
    x5 == NEG && x7 == NEG && x4 == NEG --> y == NE
    x7 == NEG && x4 == NEG && x2 == NEG --> y == NE
    x4 == NEG && x2 == NEG && x5 == NEG --> y == NE
    x1 == NEG && x3 == NEG && x8 == NEG && x6 == NEG --> y == NE
    x1 == NEG && x2 == NEG && x3 == NEG && x5 == NEG --> y == NE
    x2 == NEG && x3 == NEG && x5 == NEG && x8 == NEG --> y == NE
    x3 == NEG && x5 == NEG && x8 == NEG && x7 == NEG --> y == NE
    x5 == NEG && x8 == NEG && x7 == NEG && x6 == NEG --> y == NE
    x8 == NEG && x7 == NEG && x6 == NEG && x4 == NEG --> y == NE
    x7 == NEG && x6 == NEG && x4 == NEG && x1 == NEG --> y == NE
    x6 == NEG && x4 == NEG && x1 == NEG && x2 == NEG --> y == NE
    x4 == NEG && x1 == NEG && x2 == NEG && x3 == NEG --> y == NE
end

function denoise_kernel(fis, inputs)
    λ₁ = maximum(fis.rules[i].antecedent(fis, inputs) for i = 1:13)
    λ₂ = maximum(fis.rules[i].antecedent(fis, inputs) for i = 14:26)
    λ₀ = max(0, 1 - λ₁ - λ₂)
    255 * (λ₁ - λ₂) / (λ₁ + λ₂ + λ₀)
end

inputs = (x1 = 1.0, x2 = 1.0, x3 = 1.0, x4 = 1.0, x5 = 1.0, x6 = 1.0, x7 = 1.0, x8 = 1.0)
@btime denoise_kernels($fis, $inputs)