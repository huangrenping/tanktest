package web.game.Bytes;

import java.io.UnsupportedEncodingException;

/**
author:alexzhou 
email :zhoujiangbohai@163.com
date  :2012-11-9
 **/

public final class BytesWriter {

	private byte[] data;
	private int count;
	
	public BytesWriter() {
		this(64);
	}
	
	public BytesWriter(int size) {
		this.data = new byte[size];
	}
	
	public byte[] getBytes() {
		return this.data.length == count ? data : count == 0 ? null : BytesUtil.resizeBytes(this.data, count);
	}

	public void write(byte[] value) {
		this.write(value, 0, value == null ? 0 : value.length);
	}
	
	public void write(byte[] d, int offset, int len) {
		if(d == null || len == 0) return;
		int newCount = count + len;
		if(newCount > this.data.length) {
			int newSize = Math.max(this.data.length << 1, newCount);
			this.data = BytesUtil.resizeBytes(this.data, newSize);
		}
		System.arraycopy(d, offset, this.data, this.count, len);
		this.count = newCount;
	}
	
	public void writeInt(int value) {
		this.write(BytesUtil.intToBytes(value));
	}
	
	public void writeShort(int value) {
		this.write(BytesUtil.shortToBytes(value));
	}
	
	public void writeLong(long value) {
		this.write(BytesUtil.longToBytes(value));
	}
	
	public void writeByte(byte value) {
		int newCount = count + 1;
		if(newCount > this.data.length) {
			int newSize = Math.max(this.data.length << 1, newCount);
			this.data = BytesUtil.resizeBytes(this.data, newSize);
		}
		this.data[count] = value;
		this.count = newCount;
	}
	
	public void writeBytes(byte[] value) {
		int length = (value == null ? 0 : value.length);
		//发送大数据时
		if(length >= 0xFFFF) {
			this.writeShort(0xFFFF);
			this.writeInt(length);
		}else {
			//告诉服务端发送的数据的大小
			this.writeShort(length);
		}
		this.write(value);
	}
	
	public void writeUTF(String value) {
		if(value == null || value.length() == 0) {
			this.writeShort(0);
		}
		byte[] bytes = null;
		try {
			bytes = value.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		this.writeBytes(bytes);
	}

}

