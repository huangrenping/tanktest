package web.game.Bytes;

import java.io.UnsupportedEncodingException;

/**
 * 接受服务端数据时，读取字节并转换到相应类型
author:alexzhou 
email :zhoujiangbohai@163.com
date  :2012-11-7
 **/

public final class BytesReader {

	private final byte []data;
	private final int size;
	private int position;
	
	public BytesReader(byte []data) {
		this.data = data;
		this.size = data.length;
		this.position = 0;
	}
	
	public byte[] read(int len) {
		if(len < 0) return null;
		byte[] value = BytesUtil.copyBytes(data, position, position + len);
		this.position += len;
		return value;
	}

	public int getSize() {
		return size;
	}
	
	public boolean isAvailable() {
		return size - position > 0;
	}
	
	public short readShort() {
		byte[] value = read(2);
		return BytesUtil.bytesToShort(value);
	}
	
	public int readInt() {
		byte[] value = read(4);
		return BytesUtil.bytesToInt(value);
	}
	
	public long readLong() {
		byte[] value = read(8);
		return BytesUtil.bytesToLong(value);
	}
	
	public byte readByte() {
	    int value = this.isAvailable() ? (0xFF & data[position++]) : -1;
		return (byte)value;
	}
	
	public byte[] readBytes() {
		int len = readShort();
		//读取大数据
		if(len >= 0xFFFF) {
			len = this.readInt();
		}
		return len == 0 ? null : read(len);
	}
	
	public String readUTF() {
		byte[] bytes = readBytes();
		if(null != bytes) {
			try {
				return new String(bytes,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}

