module RedmineAttachByUrl
  class DownloadService
    class << self
      def download_start(url, author)
        attach = AttachmentByUrl.new(:url => url,
                                     :author => author,
                                     :state => AttachmentByUrl::QUEUED)
        if attach.save
          RedmineAttachByUrl::Downloader.delay.download(attach.id)
        end
        attach
      end

      def download_stop(attach_id)
        attach = AttachmentByUrl.find(attach_id)
        if [AttachmentByUrl::IN_PROGRESS,
            AttachmentByUrl::QUEUED].include?(attach.state)

          attach.state = AttachmentByUrl::CANCELED
          attach.save
        end
        attach
      end
    end
  end
end
