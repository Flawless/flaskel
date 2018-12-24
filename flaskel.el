(defun flaskel-test (&optional buf-name)
  (interactive)
  (let (old-point
        (buf-name (or buf-name "*flask-test*")))
    (unless (comint-check-proc buf-name)
      (with-current-buffer (get-buffer-create buf-name)
        (unless (zerop (buffer-size)) (setq old-point (point)))
        (pop-to-buffer buf-name)
        (shell-command "docker-compose exec -T web flask test" buf-name)))
    (when old-point (push-mark old-point))))

(provide 'autothemer)
