function rightIFrameLoad(iframe) {
	var pHeight = getWindowInnerHeight() - $('#header').height() - 5;

	$('div.body').height(pHeight);
	console.log(pHeight);

}

// ��������� ȡ�������������߶�
function getWindowInnerHeight() {
	var winHeight = window.innerHeight || (document.documentElement && document.documentElement.clientHeight) || (document.body && document.body.clientHeight);
	return winHeight;

}

// ��������� ȡ���������������
function getWindowInnerWidth() {
	var winWidth = window.innerWidth || (document.documentElement && document.documentElement.clientWidth) || (document.body && document.body.clientWidth);
	return winWidth;

}

/**
 * ��ʾ���ֲ�
 */
function showOverlay() {
	// ���ֲ��߷ֱ�Ϊҳ�����ݵĿ��
	$('.overlay').css({
		'height': $(document).height(),
		'width': $(document).width()
	});
	$('.overlay').show();
}

/**
 * ��ʾLoading��ʾ
 */
function showLoading() {
	// ����ʾ���ֲ�
	showOverlay();
	// Loading��ʾ���ھ���
	$("#loadingTip").css('top',
		(getWindowInnerHeight() - $("#loadingTip").height()) / 2 + 'px');
	$("#loadingTip").css('left',
		(getWindowInnerWidth() - $("#loadingTip").width()) / 2 + 'px');

	$("#loadingTip").show();
	$(document).scroll(function() {
		return false;
	});
}

/**
 * ����Loading��ʾ
 */
function hideLoading() {
	$('.overlay').hide();
	$("#loadingTip").hide();
	$(document).scroll(function() {
		return true;
	});
}

/**
 * ģ�ⵯ��ģ̬����DIV
 * @param innerHtml ģ̬����HTML����
 */
function showModal(innerHtml) {
	// ȡ����ʾģ��ģ̬������DIV
	var dialog = $('#modalDiv');

	// ��������
	dialog.html(innerHtml);

	// ģ̬����DIV���ھ���
	dialog.css({
		'top': (getWindowInnerHeight() - dialog.height()) / 2 + 'px',
		'left': (getWindowInnerWidth() - dialog.width()) / 2 + 'px'
	});

	// ����DIVԲ��
	dialog.find('.modal-container').css('border-radius', '6px');

	// ģ̬���ڹرհ�ť�¼�
	dialog.find('.btn-close').click(function() {
		closeModal();
	});

	// ��ʾ���ֲ�
	showOverlay();

	// ��ʾ���ֲ�
	dialog.show();
}

/**
 * ģ��ر�ģ̬����DIV
 */
function closeModal() {
	$('.overlay').hide();
	$('#modalDiv').hide();
	$('#modalDiv').html('');
}