class NavId
  def id
    @id || '1'
  end

  def s
    @id = '2'
  end
end
