package com.zaching.web.voice;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;

public class ImageResizeTest {
	 
    public static void main(String[] args) throws Exception {
 
        File in = new File("c:/image.bmp");
        BufferedImage inputImage = ImageIO.read(in);
 
        int width = 440;
        int height = 330;
        // set resize
 
        String[] ext = { "bmp", "gif", "jpg", "jpeg", "png" };
        // can convert to image file format
 
        for (String format : ext) {
 
            BufferedImage outputImage = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
            Graphics2D g = outputImage.createGraphics();
            g.drawImage(inputImage, 0, 0, width, height, null);
 
            File out = new File("c:/temp/re_image." + format);
            FileOutputStream fos = new FileOutputStream(out);
            ImageIO.write(outputImage, format, fos);
        }
    }
}