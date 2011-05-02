## PARABL's input:
# geneID, varID, c1, c0, n1, n0, score

# matlab's output: 
# each line is one sample, each column is the genotype of one SNP

samples = []

iidx = 0
while line=ARGF.gets do
  cols = line.chomp.split(/\s+/)
  samples[iidx] = []

  
  cols.each do |gt|
    samples[iidx] << gt.to_i
  end
  iidx += 1
end


nvar = samples[0].size
nsample = samples.size

controls = samples[0..(nsample/2-1)] 
cases = samples[(nsample/2)..(nsample-1)] 

geneID = "testGene"
  
0.upto(nvar - 1) do |vidx|
  varID = "SNP_#{vidx}"
  c1 = 0
  c0 = 0
  cases.each do |ca|
    if ca[vidx] > 0 
      c1 += 1
    end
  end

  controls.each do |co|
    if co[vidx] > 0
      c0 += 1 
    end
  end

  if c1 > 0 or c0 > 0
    puts "#{geneID}\t#{varID}\t#{c1}\t#{c0}\t#{cases.size}\t#{controls.size}"
  end
end
