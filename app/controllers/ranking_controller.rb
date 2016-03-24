class RankingController < ApplicationController
  before_action :logged_in_user
    def show_have
        items = Have.group(:item_id).order('count_id desc').limit(3).count(:id) 
        @rankings = items.transform_keys{ |key| Item.find(key) }
    end

    def show_want
        items = Want.group(:item_id).order('count_id desc').limit(3).count(:id) 
        @rankings = items.transform_keys{ |key| Item.find(key) }
    end

end