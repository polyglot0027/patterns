class CPU
end

class BasicCPU < CPU
end

class TurboCPU < CPU
end

class Motherboard
  attr_accessor :cpu
  attr_accessor :memory_size

  def initialize(cpu=BasicCPU.new, memory_size=1024)
    @cpu = cpu
    @memory_size = memory_size
  end
end

class Drive
  attr_reader :type # either :cd, :dvd or :hard_disk
  attr_reader :size # in Mb
  attr_reader :writable # true if this drive is writable

  def initialize(type, size, writable)
    @type = type
    @size = size
    @writable = writable
  end
end

class Computer
  attr_accessor :display
  attr_accessor :motherboard
  attr_reader   :drives

  def initialize(display=:crt, motherboard=Motherboard.new, drives=[])
    @motherboard = motherboard
    @drives = drives
    @display = display
  end
end

class ComputerBuilder
  attr_reader :computer

  def initialize
    @computer = Computer.new
  end

  def basic_cpu
    computer.motherboard.cpu = BasicCPU.new
  end

  def turbo_cpu
    computer.motherboard.cpu = TurboCPU.new
  end

  def display=(display)
    computer.display = display
  end

  def memory_size=(size_in_mb)
    computer.motherboard.memory_size = size_in_mb
  end

  def add_cd(writer=false)
    computer.drives << Drive.new(:cd, 760, writer)
  end

  def add_dvd(writer=false)
    computer.drives << Drive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size_in_mb)
    computer.drives << Drive.new(:hard_disk, size_in_mb, true)
  end
end

builder = ComputerBuilder.new
builder.turbo_cpu
builder.add_hard_disk(1_000_000)
builder.memory_size = 16000
builder.add_cd(true)
builder.add_dvd
computer = builder.computer
