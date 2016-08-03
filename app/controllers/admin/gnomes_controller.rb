class Admin::GnomesController < Admin::BaseController

  def new
    @gnome = Gnome.new
  end

  def create
    @category = Category.find_or_create_by(name: params[:gnome][:category])

    @gnome = Gnome.new(gnome_params)
    @category.gnomes << @gnome

      if @category.save
        flash[:success] = "Item successfully created"
        redirect_to admin_gnome_path(@gnome)
      else
        flash[:error] = "Invalid entry"
        render :new
      end
  end

  def show
    @gnome = Gnome.find(params[:id])
  end

  def edit
    @gnome = Gnome.find(params[:id])
    @category = @gnome.category
  end

  def update
    @gnome = Gnome.find(params[:id])
    @gnome.update_attributes(gnome_params)
    @category = Category.find_or_create_by(name: params[:gnome][:category])
    @category.gnomes << @gnome

    redirect_to admin_gnome_path(@gnome)
  end

  private

  def gnome_params
    params.require(:gnome).permit(:name,
                                  :desc,
                                  :price,
                                  :image)
  end
end
