module RubySMB
class Field
class LeafField < Field
  def initialize_field(n_bytes: nil, value: nil)
  end

  def n_bytes
    value.bytesize
  end

  def n_bytes=(n)
    n_bytes = n
  end

  def n_bytes_allocated
    @n_bytes_allocated
  end

  def n_bytes_allocated=(n)
    @n_bytes_allocated = n
  end

  def padding
    if (n_bytes_allocated - n_bytes) > 0
      padding = "\x00" * (n_bytes_allocated - n_bytes)
    else
      padding = ''
    end

    padding
  end

  def to_binary_s
    value + padding
  end

  def value
    @value
  end

  def value=(value)
    @value = value
  end
end
end
end
