require 'rails_helper'

RSpec.describe 'Information page' do
  describe 'As a visitor' do
    it "can display information about glitch art" do
      visit '/'
      click_on 'What is Glitch Art?'
      expect(current_path).to eq('/information')
      expect(page).to have_content('What is Glitch Art?')
      expect(page).to have_content("Have you ever accidentally opened a file in the wrong application and panicked? Little did you know you just unlocked a new databending skill! Databending is the process of manipulating a media file of a certain format in a software designed to edit files of another format. Artists have figured out how to percisely manipulate and delicately corrupt data without breaking the file.")
      expect(page).to have_content("Glitch Art is a visual style artform that utilizes databending. It is characteried by using digital and analog errors for asthetic purposes and exposes a medium for expression and creativity in electronic technologies.")
      expect(page).to have_content('Here are some resources we enjoyed!')
      expect(page).to have_content('Phillip Stearns has created an extensive resource list for glitch art! Check it out if you want to learn more!')
      expect(page).to have_link('resource list')
      expect(page).to have_content("Checkout osromusic's repo for a collection of artists and galleries!")
      expect(page).to have_link("osromusic's repo")
      expect(page).to have_content("Glitchet's art resourses offers a multitude of glitching tutorials utilizing a variety of data file types.")
      expect(page).to have_link("Glitchet's art resourses")

      expect(page).to have_content('About Our App')
      expect(page).to have_content("Glitch Craft allows you to select an image to glitch from two different sourcesbased off a keyword. The first image is generated fully from scratch based on an AI's preception of the keyword from DeepAI. The second image is found based off human generated perceptions of a keyword through image tags. After selecting an image, we'll cause a random glitch to the image's code and yeild your new glitched masterpiece!")
    end
  end
end
