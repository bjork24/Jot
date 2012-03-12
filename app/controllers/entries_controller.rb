class EntriesController < ApplicationController
  
  before_filter :authenticate

  def index
    @entries = []
    (0..14).each do |n|
      @entries << Entry.is_written?(Date.today - n)
    end
  end

  def show
    if params[:id]
      entry = Entry.find(params[:id]).created_at
      redirect_to("/entries/#{entry.strftime("%y")}/#{entry.month}/#{entry.day}")
    else
      @entries = Entry.get_entries(params)
    end
  end

  def new
    entry = Entry.is_written?(params)
    if entry
      redirect_to(entry)
    else
      @entry = Entry.new
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    if params[:date_token]
      jotDate = Date::strptime(params[:date_token], "%y-%m-%d").to_datetime
      @entry = Entry.new(params[:entry])
      respond_to do |format|
        if @entry.save
          @entry.created_at = jotDate
          @entry.save
          format.html { redirect_to("/entries/#{jotDate.month}/#{jotDate.day}", :notice => 'Entry was successfully created.') }
          format.xml  { render :xml => @entry, :status => :created, :location => @entry }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(@entry, :notice => 'Entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(entries_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    if(params[:field])
      @entries = Entry.find(:all, :order => 'created_at DESC', :conditions => ["#{params[:field]} REGEXP '[[:<:]]#{params[:query]}[[:>:]]'"])
    else
      @entries = Entry.find(:all, :order => 'created_at DESC', :conditions => ["body REGEXP '[[:<:]]#{params[:query]}[[:>:]]' OR title REGEXP '[[:<:]]#{params[:query]}[[:>:]]'"])
    end
  end
  
end
