Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40B15FC8F
	for <lists+samba-technical@lfdr.de>; Sat, 15 Feb 2020 05:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=X4568c0UPrVG8RNetFg9tLeoBz6fBYS+2lj1TEhwVpk=; b=L84pcMVihp2rzpBSiLyvpcqGYA
	Z9NRXos+PdMFX12MR0qxNvvqIbVv98riS7Mc6XetiOfJhaI/13pwnbx//eUBFoOoZIQBZAycJuL6d
	TdD8ojhDnEBdSzSQpaC5E491qr42uj9EP5KPAG29AphU5bzTn+N34kNGKEmXjXyPcx+c/nQO33KfY
	uA62IQWtVXDbzRlsn2W94WsRoDvrHKinGOfX2uJEzP2tlxlBYl2Sohvckz0lDN/0LYXrCquwLQZ3T
	X9HyoJ/8C46HY4kYdNm62URYrTBeDKntYB+ET8Jqz8pNWA9qu3HK5f6DjchggJCCZ1bKLgPkv1BXV
	1tQrHq7Q==;
Received: from localhost ([::1]:62462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2ozZ-009zR5-NU; Sat, 15 Feb 2020 04:23:45 +0000
Received: from m13-153.163.com ([220.181.13.153]:48602) 
 by hr1.samba.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256) (Exim)
 id 1j2ozS-009zQw-E5
 for samba-technical@lists.samba.org; Sat, 15 Feb 2020 04:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=ftibg
 X07AZtVAm+cA4cbUdJYZWdVixdwslVDU/NAM2E=; b=qD36qMdreU9l1M3aSGXwj
 oOoU+DrATK6y3fNhp9ZvoGoDAIpzHVVLdtoFbfSbas+yJQbqjQBC11GISJHyPZUI
 UDY+DVXjr/4gGcoNptFMT85zoTPhOt00diEmOKAlmYfW8fJybSJZOoT1OACi3WMe
 Do2DAx6ChwuGlr43XMenp8=
Received: from wuming_81$163.com ( [221.216.50.114] ) by
 ajax-webmail-wmsvr153 (Coremail) ; Sat, 15 Feb 2020 12:08:08 +0800 (CST)
X-Originating-IP: [221.216.50.114]
Date: Sat, 15 Feb 2020 12:08:08 +0800 (CST)
To: samba-technical@lists.samba.org
Subject: about ctdb deployment  without clustered file system
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: RYB6FWZvb3Rlcl9odG09MTIzODo1Ng==
MIME-Version: 1.0
Message-ID: <3dd860da.2394.17047084308.Coremail.wuming_81@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: mcGowAA3P6eobkde3JhqAg--.14871W
X-CM-SenderInfo: pzxpx0ljbyiqqrwthudrp/xtbBRQDKcFPAEhBDsAACsf
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

aGVsbG8sCgpldnJ5b25lLkknbSBzb3JyeSB0byBib3RoZXIgeW91IGd1eXMuIEkgd2FudCB0byBh
c2sgIGEgcXVlc3Rpb24gYWJvdXQgY3RkYi4KCkluIG9yZGluYXJ5IGNvbmZpZywgd2UgbmVlZCBh
IGNsdXN0ZXJlZCBmaWxlIHN5c3RlLCBzdWNoIGFzIGdsdXN0ZXJmcy9jZXBoIHRvIHByb3ZpZGUg
YSBzaGFyaW5nIHZvbHVtZSBmb3IgY3RkYi4KCklmIEkgZG8gbm90IGRlcGxveSBhbnkgY2x1dGVy
ZWQgZmlsZSBzeXN0ZW0sICB1c2Ugc2FtYmEvY3RkYi91dGlscy9ldGNkL2N0ZGJfZXRjZF9sb2Nr
IChtYXliZSBpdCBuZWVkcyByZXdyaXR0ZW4vbW9kaWZpZWQpICBpbnN0ZWFkIG9mIHRoZSBmaWxl
IGxvY2ssIGFuZCBwbGFjZSBldmVyeSBjb25maWcgZmlsZSBpbiBsb2NhbCBzZXJ2ZXJzIGluc3Rl
YWQgb2YgdGhlIHNoYXJpbmcgdm9sdW1lLCB3aWxsIGN0ZGIgd29yayB3ZWxsID8KCkkgaGF2ZSB0
ZXN0ZWQgc29tZSBzaXR1YXRpb25zIGFuZCBub3QgZm91bmQgYW55dGhpbmcgYWJub3JtYWwuSSBh
bSBhZnJhaWQgdGhhdCB0aGUgdGVzdHMgYXJlIG5vdCBlbm91Z2guCgp0aGFua3MgZm9yIGFueSBh
ZHZpY2UuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHd1bWluZwoK
