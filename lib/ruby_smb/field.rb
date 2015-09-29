module RubySMB
class  Field
  autoload :Composite, 'ruby_smb/field/composite'
  autoload :LeafField, 'ruby_smb/field/leaf_field'
  def initialize(children:  [], name:  nil, n_bytes:  0, value:  '', n_bytes_allocated: 0)
            @children  =  children
            @name      =  name
            @n_bytes   =  n_bytes
    @n_bytes_allocated = n_bytes_allocated
            @value     =  value
  end

  def add_child(child)
    children << child
  end

  def ancestors
  end

  def delete_child(field)
    children.delete(field)
  end

  def binary_s
    if    margin  > 0
      value_binary_s = value + padding
    elsif margin == 0
      value_binary_s = value
    elsif margin  < 0
      value_binary_s = value.byteslice(0..margin-1)
    end
    value_binary_s
  end

  def children
    @children
  end

  def children=(children)
    @children = children
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def n_bytes
    @n_bytes
  end

  def n_bytes=(n)
    @n_bytes = n
  end

  def value
    @value
  end

  def value=(value)
    @value = value
  end

private
  def margin
    n_bytes - n_bytes_value
  end

  def n_bytes_value
    value.bytesize
  end

  def padding
    padding = "\x00" * margin
  end
end
end
