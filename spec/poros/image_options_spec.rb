require 'rails_helper'

RSpec.describe "Image Options" do
  it "exists" do
    json = {:data=>
                  [{:id=>"96eec9e5-09ee-4c8a-bc1c-22960e8d39b9",
                    :type=>"image",
                    :attributes=>
                     {:id=>"96eec9e5-09ee-4c8a-bc1c-22960e8d39b9",
                      :url=>
                       "https://api.deepai.org/job-view-file/96eec9e5-09ee-4c8a-bc1c-22960e8d39b9/outputs/output.jpg",
                      :source=>"Deep AI"}},
                   {:id=>"2083492",
                    :type=>"image",
                    :attributes=>
                     {:id=>2083492,
                      :url=>
                       "https://pixabay.com/get/54e0dd404e5bae14f1dc846096293f7c123cdeed574c704f752f7bd69145c059_640.jpg",
                      :source=>"Pixabay"}}]}
    image_options = ImageOptions.new(json)
    expect(image_options.deep_id).to be_a(String)
    expect(image_options.deep_url).to be_a(String)
    expect(image_options.deep_source).to be_a(String)
    expect(image_options.deep_source).to eq("Deep AI")
    expect(image_options.pixabay_id).to be_a(String)
    expect(image_options.pixabay_url).to be_a(String)
    expect(image_options.pixabay_source).to be_a(String)
    expect(image_options.pixabay_source).to eq("Pixabay")
  end
end
