package com.niit.cakeshakes.model;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	public static void upload(String path, MultipartFile file, String name) {
		if (!file.isEmpty()) {
			InputStream inputStream = null;
			OutputStream outputStream = null;
			if (file.getSize() > 0) {
				try {
					inputStream = file.getInputStream();
					outputStream = new FileOutputStream(path + name);
					int readbytes = 0;
					byte[] buffer = new byte[1024];
					while ((readbytes = inputStream.read(buffer, 0, 1024)) != -1) {
						outputStream.write(buffer, 0, readbytes);
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