class LogsController < ApplicationController
  def create
    id = params[:connection_id]
    user = current_user
    connection = Connection.find(id)
    # date = params[:log][:date] != "" ? Date.parse(params.require(:log)[:date]) : Date.today
    date = params[:log][:date] != "" ? params[:log][:date] : Date.today
    comment = params[:log][:comment] != "" ? params[:log][:comment] : "n/a"
    data = {source: params.require(:log)[:source],
            comment: comment,
            timestamp: date
            }
    log = Log.create(data)
    connection.logs << log
    updated = Connection.get_connection(user, connection)
    render :json => {response: updated}
  end

  def destroy
    id = params[:id]
    connection_id = params[:connection_id]
    user = current_user
    connection = Connection.find(connection_id)
    log = Log.find(id)
    log.destroy
    updated = Connection.get_connection(user, connection)
    render :json => {response: updated}
  end
end