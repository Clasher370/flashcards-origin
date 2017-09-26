class CardOnIndex
  def self.setter(params_id, current_user)
    if params_id
      current_user.cards.find(params_id)
    elsif current_user.current_block
      current_user.current_block.cards.pending.first ||
      current_user.current_block.cards.repeating.first
    else
      current_user.cards.pending.first ||
      current_user.cards.repeating.first
    end
  end
end
