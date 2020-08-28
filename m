Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3932D2558D5
	for <lists+samba-technical@lfdr.de>; Fri, 28 Aug 2020 12:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=UuHVz4wiTG2W910BHFGtwWWw5R43CCy29M01Ir01T3g=; b=OzzW5vIShZMoWfUARdsAnrS3CS
	WICGytWQ3Po/3e+QT1/NRv+2kZrVB6g2TWlGnCmuYtqk8uppc0krZwUgEvVAnGbWMcplFWDh4U2sx
	8ixIFncSjIYC7PwVqrXqNSfW0BDxUmcD2Hu0LRdh99jTNPsbdm4/ihjzgMa30zHxNvEzUK0dFW+CS
	3s47BRrqo5JbDCcv5kezQ9F1X+OCn8TPhrYI7DyitnnqrWI7lIaNlxVSNBgNrelz97fNiQhzNluiM
	W1Z2kmr/wIhGEuQU33rtCiQmNJkt7BAJBKyPJ1+NP8p+mHNQp4+siO+U7ICyyzR7fCbIDJj32q5v1
	W1rLrS3A==;
Received: from localhost ([::1]:62374 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBbu2-0018Vb-Tr; Fri, 28 Aug 2020 10:46:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22450) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBbtx-0018VU-AN
 for samba-technical@lists.samba.org; Fri, 28 Aug 2020 10:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=/VuCCM2DBVzvbwYrsn4ejNPhVMSlsXn7Mv89Dwx72qQ=; b=2aMwScp+xtk7FuaT0UNLy4GoLm
 XQUpZSQHu7TxNcgGD/gBeNTyVDOzR+sfoKdLvUX2QLKcrAyawemG0cXjRT6OQ/tFFCLaAz0idtCLl
 flFBHAfNPP+uEpO5pUzxuy9JIqs8q5LVbRF+axgsndkhN/DVfq0URihxALDM8vW6S9bysDMPJHqp0
 AutoHaUoZfMLZiSizi7GiYJVAf01clF5pDT3cZf8kdAlge/DY8M73BgJkUWKetg65+V+d2ASctbO6
 PA4zJ5rePULt4dMI2fC3QTJtimKeMgD23OQzpCumidRUMM27hSijDlNQAF/l05cBoeT8fd0GH9tuZ
 ns6Z0OUi0khVScLuW9omrgPKdnupe63X3bv95vx7Noh9QugDqJzx8DS8H/zqww7y8pGQR0GF5bGn1
 GwreOi9GPWvrDH4YVVDWM+1BfzrHmvKbPJ6R8wd37wH43qR+svgHZMNtnA3+TDI8Hw3VUWx7T/7Qg
 thdtctciLa/AAWVhZt+djHSO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBbtu-0003dc-Kq
 for samba-technical@lists.samba.org; Fri, 28 Aug 2020 10:46:30 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBbtu-007RlN-HH
 for samba-technical@lists.samba.org; Fri, 28 Aug 2020 10:46:30 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: Fix compatibility issues with the timespec
 struct
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-212@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-212@samba.org>
Date: Fri, 28 Aug 2020 10:46:30 +0000
Message-Id: <E1kBbtu-007RlN-HH@hr3.samba.org>
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
ZXBvc2l0b3J5CgpGaXggY29tcGF0aWJpbGl0eSBpc3N1ZXMgd2l0aCB0aGUgdGltZXNwZWMgc3Ry
dWN0Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMjEyCkRlc2NyaXB0
aW9uOiBJJ20gY29tcGlsaW5nIGBmZm1wZWdgIHdpdGggYC0tZW5hYmxlLWxpYnNtYmNsaWVudGAu
IER1cmluZyB0aGUgY29uZmlndXJhdGlvbiBwaGFzZSBJJ20gZ2V0dGluZzoNCmBgYA0KLi9mZmJ1
aWxkL2NvbmZpZy5sb2c6L3Vzci9pbmNsdWRlL3NhbWJhLTQuMC9saWJzbWJjbGllbnQuaDoxNTg6
MTg6IGVycm9yOiBmaWVsZCAnYnRpbWVfdHMnIGhhcyBpbmNvbXBsZXRlIHR5cGUNCi4vZmZidWls
ZC9jb25maWcubG9nOi91c3IvaW5jbHVkZS9zYW1iYS00LjAvbGlic21iY2xpZW50Lmg6MTYyOjE4
OiBlcnJvcjogZmllbGQgJ210aW1lX3RzJyBoYXMgaW5jb21wbGV0ZSB0eXBlDQouL2ZmYnVpbGQv
Y29uZmlnLmxvZzovdXNyL2luY2x1ZGUvc2FtYmEtNC4wL2xpYnNtYmNsaWVudC5oOjE2NjoxODog
ZXJyb3I6IGZpZWxkICdhdGltZV90cycgaGFzIGluY29tcGxldGUgdHlwZQ0KLi9mZmJ1aWxkL2Nv
bmZpZy5sb2c6L3Vzci9pbmNsdWRlL3NhbWJhLTQuMC9saWJzbWJjbGllbnQuaDoxNzA6MTg6IGVy
cm9yOiBmaWVsZCAnY3RpbWVfdHMnIGhhcyBpbmNvbXBsZXRlIHR5cGUNCmBgYA0KDQpUaGUgcHJv
YmxlbSBhcHBlYXJzIHRvIGJlIHRoYXQgdGhlIGB0aW1lc3BlY2Agc3RydWN0IGlzIG5vdCBkZWZp
bmVkLiBJbmNsdWRpbmcgYHRpbWUuaGAgc29sdmVzIHRoZSBpc3N1ZS4gSXQgY2FuIGJlIHJlcHJv
ZHVjZWQgaW4gNC45LjEsIGJ1dCBub3QgaW4gNC44Lg0KDQpJbiBhIHNvbWV3aGF0IHJlbGF0ZWQg
bm90ZSAtIGxpYnNtYmNsaWVudC5oIGN1cnJlbnRseSBjYW5ub3QgYmUgdXNlZCB3aXRoIGAtLXN0
ZD1jOTlgIGJlY2F1c2Ugb2YgdGhlIGRlcGVuZGVuY3kgb24gYHRpbWVzcGVjYC4K
