package tk.licer.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 访客信息
 * @author liwc
 */
@Entity
@GenericGenerator(name="id_uuid", strategy="uuid")
@Table(name="visitor")
public class Visitor implements java.io.Serializable {

	private static final long serialVersionUID = -6586573292234922868L;
	
	private String id;
	private String ip;
	private String userAgent;
	private String host;
	private String cookie;
	private String accept;
	private String acceptEncoding;
	private String acceptLanguage;
	private Timestamp time;
	
	/** default constructor */
	public Visitor() {
	}

	/** full constructor */
	public Visitor(String ip, Timestamp time, String userAgent, String host,
			String cookie, String accept, String acceptEncoding,
			String acceptLanguage) {
		this.ip = ip;
		this.time = time;
		this.userAgent = userAgent;
		this.host = host;
		this.cookie = cookie;
		this.accept = accept;
		this.acceptEncoding = acceptEncoding;
		this.acceptLanguage = acceptLanguage;
	}

	
	@Id
	@GeneratedValue(generator = "id_uuid")
	@Column(name = "ID", unique = true, nullable = false, length = 128)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "IP", nullable = false, length = 50)
	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Column(name = "USER_AGENT", nullable = false, length = 1024)
	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	@Column(name = "TIME", nullable = false)
	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	@Column(name = "HOST", length = 1024)
	public String getHost() {
		return this.host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	@Column(name = "COOKIE", length = 1024)
	public String getCookie() {
		return this.cookie;
	}

	public void setCookie(String cookie) {
		this.cookie = cookie;
	}

	@Column(name = "ACCEPT", length = 1024)
	public String getAccept() {
		return this.accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}

	@Column(name = "ACCEPT_ENCODING", length = 1024)
	public String getAcceptEncoding() {
		return this.acceptEncoding;
	}

	public void setAcceptEncoding(String acceptEncoding) {
		this.acceptEncoding = acceptEncoding;
	}

	@Column(name = "ACCEPT_LANGUAGE", length = 1024)
	public String getAcceptLanguage() {
		return this.acceptLanguage;
	}

	public void setAcceptLanguage(String acceptLanguage) {
		this.acceptLanguage = acceptLanguage;
	}
}