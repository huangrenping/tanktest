package web.game.Bytes;

import java.io.IOException;
import java.io.InputStream;

/**
author:alexzhou 
email :zhoujiangbohai@163.com
date  :2012-11-7
 **/

public final class BytesUtil {
 
	/**
	 *整型转换成字节数组 
	 * @param value 要转换的整型值
	 * @return
	 */
	public static byte[] shortToBytes(int value) {
		byte []write = new byte[2];
		write[1] = (byte)( (value >>> 8) & 0xFF);
		write[0] = (byte)( (value >>> 0) & 0xFF);
		return write;
	}
	
	public static byte[] intToBytes(int value) {
		byte []write = new byte[4];
		write[3] = (byte)( (value >>> 24) & 0xFF);
		write[2] = (byte)( (value >>> 16) & 0xFF);
		write[1] = (byte)( (value >>> 8) & 0xFF);
		write[0] = (byte)( (value >>> 0) & 0xFF);
		return write;
	}
	
	public static byte[] longToBytes(long value) {
		byte []write = new byte[8];
		write[0] = (byte)( (value >>> 56) & 0xFF);
		write[1] = (byte)( (value >>> 48) & 0xFF);
		write[2] = (byte)( (value >>> 40) & 0xFF);
		write[3] = (byte)( (value >>> 32) & 0xFF);
		write[4] = (byte)( (value >>> 24) & 0xFF);
		write[5] = (byte)( (value >>> 16) & 0xFF);
		write[6] = (byte)( (value >>> 8) & 0xFF);
		write[7] = (byte)( (value >>> 0) & 0xFF);
		return write;
	}
	
	/**
	 * 字节数组转换成整型
	 * @param value
	 * @return
	 */
	public static int bytesToInt(byte []value) {
/*		int i1 = (value[0] & 0xFF) << 24;
		int i2 = (value[1] & 0xFF) << 16;
		int i3 = (value[2] & 0xFF) << 8;
		int i4 = (value[3] & 0xFF) << 0;*/
		int i1 = (value[3] & 0xFF) << 24;
		int i2 = (value[2] & 0xFF) << 16;
		int i3 = (value[1] & 0xFF) << 8;
		int i4 = (value[0] & 0xFF) << 0;
		return (i1 | i2 | i3 | i4);
	}
	
	public static short bytesToShort(byte[] value) {
/*		int s1 = (value[0] & 0xFF) << 8;
		int s2 = (value[1] & 0xFF) << 0;*/
		int s1 = (value[1] & 0xFF) << 8;
		int s2 = (value[0] & 0xFF) << 0;
		return (short)(s1 | s2);
	}
	
	public static long bytesToLong(byte[] value) {
/*		long L1 = (value[0] & 0xFF) << 56;
		long L2 = (value[1] & 0xFF) << 48;
		long L3 = (value[2] & 0xFF) << 40;
		long L4 = (value[3] & 0xFF) << 32;
		long L5 = (value[4] & 0xFF) << 24;
		long L6 = (value[5] & 0xFF) << 16;
		long L7 = (value[6] & 0xFF) << 8;
		long L8 = (value[7] & 0xFF) << 0;*/
		long L1 = (value[7] & 0xFF) << 56;
		long L2 = (value[6] & 0xFF) << 48;
		long L3 = (value[5] & 0xFF) << 40;
		long L4 = (value[4] & 0xFF) << 32;
		long L5 = (value[3] & 0xFF) << 24;
		long L6 = (value[2] & 0xFF) << 16;
		long L7 = (value[1] & 0xFF) << 8;
		long L8 = (value[0] & 0xFF) << 0;
		return (L1 | L2 | L3 | L4 | L5 | L6 | L7 | L8);
	}
	
	/**
	 * 从指定字节数组中拷贝部分数据
	 * @param origin
	 * @param from
	 * @param to
	 * @return
	 */
	public static byte[] copyBytes(byte[] origin,int from,int to) {
		int len = to - from;
		if(len < 0 || origin.length - from <= 0) {
			throw new IllegalArgumentException("copyBytes->error arguments:to="+to+",from="+from);
		}
		byte[] ret = new byte[len];
		if(len == 0) return ret;
		System.arraycopy(origin, from, ret, 0, Math.min(len, origin.length - from));
		return ret;
	}
	
	/**
	 * 重置字节数组的大小，然后把原内容复制到新的字节数组中
	 * @param origin
	 * @param newSize
	 * @return
	 */
	public static byte[] resizeBytes(byte[] origin,int newSize) {
		if(newSize < 0) {
			throw new IllegalArgumentException("resizeBytes->newSize must >= 0");
		}
		byte[] ret = new byte[newSize];
		if(newSize == 0) return ret;
		System.arraycopy(origin,0,ret,0,Math.min(origin.length, newSize));
		return ret;
	}
	
	
	/**
	 * 读取输入流中字节,并保存到指定的字节数组中
	 * @param is
	 * @param data
	 * @param off
	 * @param len
	 */
	public static void readData(InputStream is, byte data[], int off, int len) {
		int hasRead = 0;
		final int BUFFER = 1024;
		while(hasRead < len) {
			try {
				int remain = len - hasRead;
				int count = is.read(data, off + hasRead, remain > BUFFER ? BUFFER : remain);
				if(count < 0) throw new IOException("readData->read data error");
				hasRead += count;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}

