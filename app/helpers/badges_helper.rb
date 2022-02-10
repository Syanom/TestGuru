module BadgesHelper
  def badge_header
    if @badge.new_record?
      t('admin.badges.for_helper.create_new_badge')
    else
      t('admin.badges.for_helper.edit_badge', name: @badge.name)
    end
  end
end
