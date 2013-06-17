# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :content do
    name 'Tagline'
    slug 'tagline'
    text 'Texto **legal** e <em>bacana</em>'
  end
end
