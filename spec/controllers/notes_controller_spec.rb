require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  describe 'GET index' do
    it 'assigns all notes as @notes' do
      notes = instance_double('Array')
      stub_note_scope(to_a: notes)

      get :index

      expect(assigns(:notes)).to eq(notes)
    end
  end

  describe 'GET show' do
    it 'assigns the requested note as @note' do
      note = stub_find_note

      get :show, id: note.to_param

      expect(assigns(:note)).to eq(note)
    end
  end

  describe 'GET new' do
    it 'assigns a new note as @note' do
      note = stub_build_note
      expect(note).to receive(:attributes=).with(attributes)

      get :new, note: attributes

      expect(assigns(:note)).to eq(note)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested note as @note' do
      note = stub_find_note

      get :edit, id: note.to_param

      expect(assigns(:note)).to eq(note)
    end
  end

  describe 'POST create' do
    it 'creates a new Note' do
      note = stub_build_note_as_spy

      post :create, note: attributes

      expect(note).to have_received(:attributes=).with(attributes)
      expect(note).to have_received(:save)
    end

    describe 'with valid params' do
      it 'assigns a newly created note as @note' do
        note = stub_build_note(save: true)

        post :create

        expect(assigns(:note)).to eq(note)
      end

      it 'redirects to the created note' do
        note = stub_build_note(save: true)

        post :create

        expect(response).to redirect_to(note)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved note as @note' do
        note = stub_build_note(save: false)

        post :create

        expect(assigns(:note)).to eq(note)
      end

      it 're-renders the \'new\' template' do
        stub_build_note(save: false)

        post :create

        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    it 'updates the requested note' do
      note = stub_find_note_as_spy

      put :update, id: note.to_param, note: new_attributes

      expect(note).to have_received(:attributes=).with(new_attributes)
      expect(note).to have_received(:save)
    end

    describe 'with valid params' do
      it 'assigns the requested note as @note' do
        note = stub_find_note(save: true)

        put :update, id: note.to_param

        expect(assigns(:note)).to eq(note)
      end

      it 'redirects to the note' do
        note = stub_find_note(save: true)

        put :update, id: note.to_param

        expect(response).to redirect_to(note)
      end
    end

    describe 'with invalid params' do
      it 'assigns the note as @note' do
        note = stub_find_note(save: false)
        expect(note).to receive(:attributes=).with(new_attributes)

        put :update, id: note.to_param, note: new_attributes

        expect(assigns(:note)).to eq(note)
      end

      it 're-renders the \'edit\' template' do
        note = stub_find_note(save: false)
        expect(note).to receive(:attributes=).with(new_attributes)

        put :update, id: note.to_param, note: new_attributes

        expect(response).to render_template('edit')
      end
    end

    let(:new_attributes) { attributes.merge(title: 'New title') }
  end

  describe 'DELETE destroy' do
    it 'destroys the requested note' do
      note = stub_find_note_as_spy

      delete :destroy, id: note.to_param

      expect(note).to have_received(:destroy)
    end

    it 'redirects to the notes list' do
      note = stub_find_note(destroy: true)

      delete :destroy, id: note.to_param

      expect(response).to redirect_to(notes_url)
    end
  end

  def stub_note_scope(opts = {})
    note_scope = instance_double('Note::ActiveRecord_Relation')
    expect(class_double('Note').as_stubbed_const).to receive(:all)
      .and_return(note_scope)
    opts.each do |method_name, return_value|
      expect(note_scope).to receive(method_name).and_return(return_value)
    end
    note_scope
  end

  def stub_build_note(save: nil)
    note = instance_double('Note', to_model: Note.new)
    expect(stub_note_scope).to receive(:build).and_return(note)
    expect(note).to receive(:save).and_return(save) unless save.nil?
    note
  end

  def stub_find_note(save: nil, destroy: nil)
    note = instance_double('Note', to_model: Note.new)
    expect(stub_note_scope).to receive(:find).with(note.to_param)
      .and_return(note)
    expect(note).to receive(:save).and_return(save) unless save.nil?
    expect(note).to receive(:destroy).and_return(destroy) unless destroy.nil?
    note
  end

  def stub_build_note_as_spy
    note = instance_spy('Note', to_model: Note.new)
    stub_note_scope(build: note)
    note
  end

  def stub_find_note_as_spy
    note = instance_spy('Note', to_model: Note.new)
    expect(stub_note_scope).to receive(:find).with(note.to_param)
      .and_return(note)
    note
  end

  let(:attributes) { { title: 'foo', text: 'bar', published: true } }
end
