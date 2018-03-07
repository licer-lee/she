function Map() {
	this.elements = new Array();

	/**
	 * 返回数组长度
	 * 
	 * @returns {Number}
	 */
	this.size = function() {
		return this.elements.length;
	}

	/**
	 * 清空数组
	 */
	this.clear = function() {
		this.elements = new Array();
	}

	/**
	 * 装入数据 {key:value}
	 * 
	 * @param key
	 * @param value
	 */
	this.put = function(key, value) {
		if (key == null || key == undefined)
			return;
		if (this.containsKey(key)) {
			this.update(key, value);
		} else {
			this.elements.push({
				key : key,
				value : value
			})
		}

	}

	/**
	 * 根据key获取当前数组中所对应的值 / 找不到返回null
	 * 
	 * @param key
	 * @returns {*}
	 */
	this.get = function(key) {
		try {
			for ( var i = 0; i < this.size(); i++) {
				if (this.elements[i].key == key) {
					return this.elements[i].value;
				}
			}
		} catch (e) {
			return null;
		}
		return null;
	}

	/**
	 * 根据key删除数组数据
	 * 
	 * @param key
	 * @returns {boolean}
	 */
	this.remove = function(key) {
		try {
			for ( var i = 0; i < this.size(); i++) {
				if (this.elements[i].key == key) {
					this.elements.splice(i, 1);
					return true;
				}
			}
		} catch (e) {
			return false;
		}
		return true;
	}

	/**
	 * 更新数组value值
	 * 
	 * @param key
	 * @param value
	 * @returns {boolean}
	 */
	this.update = function(key, value) {
		for ( var i = 0; i < this.size(); i++) {
			if (this.elements[i].key == key) {
				this.elements[i].value = value;
				return true;
			}
		}
		return false;
	}

	/**
	 * 是否包含key值
	 * 
	 * @param key
	 * @returns {boolean}
	 */
	this.containsKey = function(key) {
		try {
			for ( var i = 0; i < this.size(); i++) {
				if (this.elements[i].key == key) {
					return true;
				}
			}
		} catch (e) {
			return false;
		}
		return false;
	}

	/**
	 * 获取数组中所有数据
	 * 
	 * @returns {Array}
	 */
	this.keys = function() {
		var array = new Array();
		for ( var i = 0; i < this.size(); i++) {
			array.push(this.elements[i].value);
		}
		return array;
	}

	/**
	 * 通过数组下标获取data
	 * 
	 * @param number
	 * @returns {*}
	 */
	this.getIndex = function(number) {
		if (number < 0 || number >= this.size()) {
			return null;
		}
		return this.elements[number];
	}

}