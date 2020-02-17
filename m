Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0D3160B8B
	for <lists+samba-technical@lfdr.de>; Mon, 17 Feb 2020 08:27:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=nqxNwS9fbqp14PkAsDog07qeXsJTKqoSI72paPa6rmo=; b=yncthiHsIR98Vu4QnaJoLpCUWP
	hPo4716X97Z53K9OGKFGNWiYctHmZFBY2vsMvDstKQZD2i+Cq2DMFaElOEuyjackDTVZ61Y8M5yiM
	lTBswkYRPZ3090S6rD9Y3FhOfQzflw6SQqVCkuL3pyY8kKQnqELFXXHvVUUn7VyKMdMjiGUgnmbyR
	yPzEMb7HZ4C/e7yXhOOEkQP1P6P+d4zU5xNbhy8W27r0lD/yQZGaA57LKZmv4ZXg5dTpma6s9uFMO
	J5HE1QzWVlaD36+VXBWAX724ruZOdaqNVhF/FbkeqJ8IVj3IOIy/4DEhSYt1QQGedTBmuRACDJase
	OJiVHRrw==;
Received: from localhost ([::1]:32592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j3anl-00AC1J-4G; Mon, 17 Feb 2020 07:26:45 +0000
Received: from m13-81.163.com ([220.181.13.81]:28660) 
 by hr1.samba.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256) (Exim)
 id 1j3anX-00AC1B-4n
 for samba-technical@lists.samba.org; Mon, 17 Feb 2020 07:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=H1A36
 O9i4N2Q1FPjHAdxG7QetMV4hd/Vxm1ytFcTkls=; b=k2i9rzJFT+0OrAoM/o3N/
 DUtMV8pC4No0sTeI9GWabNHJyaYnOzCPr0dLxy4WpGY/cBwqA1Ug8WoqCS6K1Pjm
 nA6MDzIzhy1qjdk+HZZngJbthT47why8oWrqZ0cl5Wwe0TV+7F5VkOW4KlKuS1rU
 CX42fLjc1AYLjbJ3bUpCYQ=
Received: from wuming_81$163.com ( [221.216.50.114] ) by
 ajax-webmail-wmsvr81 (Coremail) ; Mon, 17 Feb 2020 15:26:20 +0800 (CST)
X-Originating-IP: [221.216.50.114]
Date: Mon, 17 Feb 2020 15:26:20 +0800 (CST)
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: about doc of ctdb
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: B5btFmZvb3Rlcl9odG09NzYzOjU2
MIME-Version: 1.0
Message-ID: <676e7866.55a7.170520a6ed8.Coremail.wuming_81@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: UcGowABXJ1QcQEpe7sXqAQ--.47042W
X-CM-SenderInfo: pzxpx0ljbyiqqrwthudrp/1tbiHgTMcFSInRZGewACsO
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: =?utf-8?b?6aOO5peg5ZCNIHZpYSBzYW1iYS10ZWNobmljYWw=?=
 <samba-technical@lists.samba.org>
Reply-To: =?GBK?B?t+fO3sP7?= <wuming_81@163.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

ICAgIHNvcnJ5IHRvIGJvdGhlciAgeW91IGFnYWluLgogICAgSSBoYXZlIG5vdCBmb3VuZCBhbnkg
ZG9jIG9uIHRoZSBpbXBsZW1lbnRhdGlvbi9kZXNnaW4gb2YgY3RkYi4gSSB3YW50IHRvIHJlYWQg
dGhlIHNvdXJjZSBjb2RlIG9mIGN0ZGIsIG15YmUgZG8gc29tZSBkZWJ1Z3MuCiAgICBJcyB0aGVy
ZSBzb21lIGRvYyA/IG9yIGhvdyB0byBmaW5kID8KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3dW1pbmc=
