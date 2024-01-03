class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = 'Kitten was created!!'
      redirect_to @kitten, notice: "Kitten succesfully created."
    else
      flash[:alert] = 'Error creating kitten. You suck.'
      render :new
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])																																									
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:success] = 'Kitten updated the cat!!'
      redirect_to @kitten, notice: "Kitten successfully updated"
    else
      flash[:alert] = 'You need a new Job. Redo the form. '
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = 'Kitten was burned alive!!'
    redirect_to kitten_path, notice: "Kitten was destroyed"
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
