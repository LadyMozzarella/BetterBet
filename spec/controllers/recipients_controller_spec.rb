require 'spec_helper'

describe RecipientsController do
  context '#new' do
    it 'should be a success'
  end

  context '#create' do
    context 'with valid attributes' do
      it 'should create a recipent'
      it 'should redirect'
    end

    context 'with invalid attributes' do
      it 'shouln\'t create a recipent'
      it 'should render'
    end
  end
end