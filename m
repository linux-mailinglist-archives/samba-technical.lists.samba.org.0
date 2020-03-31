Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6207198ABE
	for <lists+samba-technical@lfdr.de>; Tue, 31 Mar 2020 05:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=NkfvRU86JOOb4TGrudQvUz6qQRERwYDty3IssN24G5s=; b=njVS615TwJ7vs3CebgdhpUl4Qk
	/pGGWOLT1awJA5ZdX7O80t3Pl1IliHgxkSkuTvfsvdYF56KSo01ja/u+V3YSpKNyzwe8Qfr+Fpexg
	96Blm/LBcGcWtcde4K1EU0ZgFprNEG+IRE43Cqcbzllnep19LhCabF2AaI56jdS5PRl6+xlblnjZJ
	j1L6XNfBl4nJk3r4JaGmwPGohVXNNzT7XTaEB15MPrbHImt3AIis8AdKqLpOEvSKww3A/QNnEcbI9
	GzB4SMSsXIML3DhAQQ9p33/bqE9yuCO76gTelzqqxQ3ot3jWQdaeZIA0A/BeGPpGNx+TPbSEUmuMm
	v5U45J5Q==;
Received: from localhost ([::1]:44668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJ82m-0013ku-Lr; Tue, 31 Mar 2020 03:58:28 +0000
Received: from m13-53.163.com ([220.181.13.53]:31923) 
 by hr1.samba.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256) (Exim)
 id 1jJ82g-0013kn-O9
 for samba-technical@lists.samba.org; Tue, 31 Mar 2020 03:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=gGqjc
 W/63WhJbFdHDNx0rbKvHEKlUA6uGgMNjgm8c58=; b=gnDJtWcMZoJfSd9IODZP6
 yvCiNBdw/xZTIoN4MT/Kimjb2H/1k1JLs+FV/3uMjo6wnCtQX/tmMKoo0O5vxtO7
 +2Ynx82KYTOq1av115pN59mw2lhz2a2LiVC28hPLOuoAFQzoaSYxiJPqiAnEyz/z
 80zk7aYGckg4WfI4cqeZYw=
Received: from ssdl.566$163.com ( [123.139.227.174] ) by
 ajax-webmail-wmsvr53 (Coremail) ; Tue, 31 Mar 2020 11:42:44 +0800 (CST)
X-Originating-IP: [123.139.227.174]
Date: Tue, 31 Mar 2020 11:42:44 +0800 (CST)
To: "Jeremy Allison" <jra@samba.org>, 
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: problem about smbd_smb2_flush_send_queue
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: JONswGZvb3Rlcl9odG09MjE0MTo1Ng==
MIME-Version: 1.0
Message-ID: <3d2ae9a3.3208.1712eaf2c90.Coremail.ssdl.566@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: NcGowAB3g+U0vIJe1eQJAA--.43667W
X-CM-SenderInfo: hvvgzhqvwwqiywtou0bp/1tbiRxT3h1c7Ok-vCAAAsd
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
From: dongleilei via samba-technical <samba-technical@lists.samba.org>
Reply-To: dongleilei <ssdl.566@163.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgYWxsOgogICAgICAgICAgSSBlbmNvdW50ZXJlZCBhIHByb2JsZW0gcmVjZW50bHkuIAogICAg
ICAgICAgd2hlbiBpIGNvcHkgZmlsZXMgZnJvbSBzYW1iYSBzaGFyZSB0byB3aW5kb3dzIGNsaWVu
dCwgIHRoZSBjb3B5IHByb2Nlc3Mgc3VkZGVubHkgaHVuZyB1cCB3YWl0aW5nIGZvciByZXNwb25z
ZSBmcm9tIHNhbWJhIHNlcgogICAgICAgICAgd2hlbiBpIGRlYnVnIHNtYmQgcHJvY2VzcywgaSBm
b3VuZCB0aGUgcHJvZ3JhbSBlbnRlciBoZXJlLgoKCmluIHNvdXJjZTMvc21iZC9zbWIyX3NlcnZl
ciAgc21iZF9zbWIyX2ZsdXNoX3NlbmRfcXVldWUKCgogb2sgPSBpb3ZfYWR2YW5jZSgmZS0+dmVj
dG9yLCAmZS0+Y291bnQsIHJldCk7CmlmICghb2spIHsKcmV0dXJuIE5UX1NUQVRVU19JTlRFUk5B
TF9FUlJPUjsKfQoKCmlmIChlLT5jb3VudCA+IDApIHsKLyogd2UgaGF2ZSBtb3JlIHRvIHdyaXRl
ICovICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnRlciBoZXJlClRFVkVOVF9GRF9X
UklURUFCTEUoeGNvbm4tPnRyYW5zcG9ydC5mZGUpOwpyZXR1cm4gTlRfU1RBVFVTX09LOwp9CgoK
LS0tLS0KbXkgcXVlc3Rpb24gaXMgOiBpcyB0aGVyZSBhbnkgd2F5IGZvciBzbWJkIHRvIHJlc2Vu
ZCB0aGUgcmVtYWluaW5nIGRhdGE/CiAgICAgICAgICAgICAgICAgICAgICAgICAgIHdoeSBteSBj
bGllbnQgaHVuZyB1cCBmb3IgYSBsb25nIHRpbWU/CgoKcGVhY2UgYW5kIGhhcHBpbmVzcwoK
