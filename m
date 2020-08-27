Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F1925508E
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 23:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=r5tRqPy/ZH2Pu3HUGCuP2GWzw43vjQkTcX3DUWhcXto=; b=rW3hvFGmae4zCZNZaYQio7EL3i
	pzFMygHhegctCmw47LLojJHA1WDaPPAFWBGI1HAQyi8/0JslaIKj4aI9h+24SujifNk+hyQrpgwwh
	ebT1fUbSTz3RevkEXHtoetGuV44oAHB6dGOt+UOzvW+jmQslwQqVj6ZH5uL7Z5GeV6Tcg0p1IQtGN
	y7c/TO9ApqERRxqh4Q9tA6SalXeA7+MA9XomU4oi8dlTcjYCQ9TO9gS/0QsI8TCalvsN8VEcTAGPe
	gWdn2thUiIyosGfa5RmuW4foDKpcnFBkFKYa0OwixccAby5OQ3Q/Qc8KaRPtiTPare+aqFLdLyGcw
	b2Oxx43Q==;
Received: from localhost ([::1]:64098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBPRn-0010rt-L0; Thu, 27 Aug 2020 21:28:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPRi-0010qz-Cs
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=immw3sWvaoJy5nFeLFCfRjqFWPH3fMlK/Wb1jXQyD+0=; b=vO2fCRzn3BHx54CaWIWkNNexIP
 v307A3dTIHyNDmOrnylMGeL8vKDXHG3hHijWJnzw8Pd9r5gBq8cn2BG9VdOhWCJB5TsMMzvdFHLeJ
 khJu1ZuAK+Wkis5n+PowTLg3QAwh+BxBNvCmbW+lg0bUOWSKmfT8cJ6VHnwpBBvZ4HooAsm2MfoOh
 jE8vQsA/XTFGQlmJyHqchFqGhHIYt7NwiZrQCgSm/pzdoTYSeP+M7o1xSPuscx8TGQtbEnqOBswiZ
 LznwsO4Fv+SZStBLBjtqswT9InjHoWq06iCYBsGw2IrUKgsHOfMk9p4WTG8dJfEnBx1/ZScAevJFc
 YKUnTNPP8FmsVkC0KPKwNbUdSGHBks/QZTCCFjLAG3JYtB48da1xa8xDU27h4XxSjD+mEvOE5xq0D
 zY+gGsw2exVQJQ6wI04XbdvwfQP9EUV1XlHbI4h7BCtvAeDg40JyOH/DbxDNSybc0y86m2f8UseFI
 nLyevuTXmRFWf2nILLiJrjaP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPRg-0004Qa-1q
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:28:32 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBPRf-006isE-Uo
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:28:31 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: [RFE] smbstatus -L does not resolve UIDs to
 names
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-202@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-202@samba.org>
Date: Thu, 27 Aug 2020 21:28:31 +0000
Message-Id: <E1kBPRf-006isE-Uo@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5CgpbUkZFXSBzbWJzdGF0dXMgLUwgZG9lcyBub3QgcmVzb2x2ZSBVSURzIHRvIG5h
bWVzCmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMjAyCkRlc2NyaXB0
aW9uOiBUaGlzIFBSIHNob3cgdXNlcm5hbWUgaW5zdGVhZCBvZiBVSURzIGluIHNtYnN0YXR1cyAt
TCBvdXRwdXQuDQoNCiAvdXNyL2xvY2FsL3NhbWJhL2Jpbi9zbWJzdGF0dXMgLUwNCkxvY2tlZCBm
aWxlczoNClBpZCAgICAgICAgICBVaWQgICAgICAgIERlbnlNb2RlICAgQWNjZXNzICAgICAgUi9X
ICAgICAgICBPcGxvY2sgICAgICAgICAgIFNoYXJlUGF0aCAgIE5hbWUgICBUaW1lDQpgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1gDQoxNTU3NyAgICAgICAgZnJlZCAg
ICAgICBERU5ZX05PTkUgIDB4MTAwMDgxICAgIFJET05MWSAgICAgTk9ORSAgICAgICAgICAgICAv
c2hhcmUgICAuICAgV2VkIEp1bCAgNCAxNzoyNzoxNyAyMDE4DQoxNTU3NyAgICAgICAgZnJlZCAg
ICAgICBERU5ZX05PTkUgIDB4MTAwMDgxICAgIFJET05MWSAgICAgTk9ORSAgICAgICAgICAgICAv
c2hhcmUgICAuICAgV2VkIEp1bCAgNCAxNzoyNzoxNyAyMDE4DQoNCg0KU2lnbmVkLW9mZi1ieTog
QW1pdCBLdW1hciBhbWl0a3VtYUByZWRoYXQuY29tCg==
