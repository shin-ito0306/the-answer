module QuestionHandler
  extend ActiveSupport::Concern

  def have_keyword?(keyword, search_kind)
    keyword.present? || (keyword.present? && search_kind.present?)
  end
end