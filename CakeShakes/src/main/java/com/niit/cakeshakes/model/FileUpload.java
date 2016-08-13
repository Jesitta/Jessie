package com.niit.cakeshakes.model;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	public static void upload(String path, MultipartFile image, String name) {
		if (!image.isEmpty()) {
			InputStream inputStream = null;
			OutputStream outputStream = null;
			if (image.getSize() > 0) {
				try {
					inputStream = image.getInputStream();
					outputStream = new FileOutputStream(path + name);
					int bytes = 0;
					byte[] buffer = new byte[1024];
					while ((bytes = inputStream.read(buffer, 0, 1024)) != -1) {
						outputStream.write(buffer, 0, bytes);
					}
				}

				catch (Exception e) {
					e.printStackTrace();
				} finally {

					try {
						outputStream.close();
						inputStream.close();

					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}