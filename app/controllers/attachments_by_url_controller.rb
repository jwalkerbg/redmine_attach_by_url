class AttachmentsByUrlController < ApplicationController
  unloadable

  def create
    url = params[:attachment_by_url][:url]
    attach = RedmineAttachByUrl::DownloadService.download_start(url)
    attach_presenter = RedmineAttachByUrl::AttachmentByUrlPresenter.new(attach)
    render :json => attach_presenter.as_json
  end

  def state
    attach = AttachmentByUrl.find(params[:id])
    attach_presenter = RedmineAttachByUrl::AttachmentByUrlPresenter.new(attach)
    render :json => attach_presenter.as_json
  end

  def destroy
    attach = RedmineAttachByUrl::DownloadService.download_stop(params[:id])
    attach_presenter = RedmineAttachByUrl::AttachmentByUrlPresenter.new(attach)
    render :json => attach_presenter.as_json
  end
end