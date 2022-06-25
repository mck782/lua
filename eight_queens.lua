N = 8


function is_place_ok (a, n, c)
    for i = 1, n - 1 do
        if (a[i] == c) or
            (a[i] - i == c - n) or
            (a[i] + i == c + n) then
                return false
        end
    end
    return true
end


function print_solution (a)
    for i = 1, N do
        for j = 1, N do
            io.write(a[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end


function add_queens (a, n)
    if n > N then
        print_solution(a)
        return true
    else
        for c = 1, N do
            if is_place_ok(a, n, c) then
                a[n] = c
                if add_queens(a, n + 1) then
                    return true
                end
            end
        end
    end
    return false
end


add_queens({}, 1)