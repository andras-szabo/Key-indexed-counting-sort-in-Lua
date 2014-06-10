-- Key-indexed counting sort.
-- Sort a[] of N integers between 0 and R-1
-- i.e., NB, to be sorted things > 0

function kiSort(a)
	local count = { }
	for i = 0, 130 do count[i] = 0 end

	-- count frequencies
	for i = 1, #a do
		count[a[i]+1] = count[a[i]+1] + 1
	end

	-- calculate cumulates
	for i = 1, 130 do count[i] = count[i] + count[i-1] end

	-- set up aux
	local aux = { }
	for i = 1, #a do aux[i] = 0 end

	-- copy stuff onto aux
	for i = 1, #a do
		aux[count[a[i]]+1] = a[i]
		count[a[i]] = count[a[i]] + 1
	end

	return aux 
end

a = { 0, 1, 2, 3, 2, 3, 0, 5, 2, 0, 9, 123, 1}
a = kiSort(a)
for i,v in ipairs(a) do
	print(v)
end