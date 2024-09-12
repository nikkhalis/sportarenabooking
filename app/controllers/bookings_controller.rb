class BookingsController < ApplicationController
  before_action :set_court, only: [ :new, :create ]
  before_action :set_booking, only: [ :payment ]

  def new
    @booking = @court.bookings.new
  end

  def create
    @booking = @court.bookings.new(booking_params)
    @booking.user = current_user # Set the user who made the booking

    if @booking.save
      # Use the correct path helper for redirection
      redirect_to payment_court_booking_path(@court, @booking), notice: "Booking was successfully created."
    else
      # Log validation errors to the console and render the form again
      Rails.logger.debug(@booking.errors.full_messages)
      flash.now[:alert] = @booking.errors.full_messages.to_sentence
      render :new
    end
  end

  def payment
    @booking = Booking.find(params[:id])
  end

  private

  def set_court
    @court = Court.find(params[:court_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :court_id, :user_id)
  end
end
