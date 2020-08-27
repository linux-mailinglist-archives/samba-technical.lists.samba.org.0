Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F6255087
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 23:23:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=67h03JMfDe8NeCk7XOsR9ptxMacWa8GCvmqrS0RlVrQ=; b=CM/owVMxiz9/Nv6ZqDLOh6VT9z
	RT6RcTMJveaOg8OItZ5DySe6hqtTBEYVGhdeeseEoxP0Z/9YTqDuFVE4nmoMTZbPCP0EwXX2HYhJ+
	4HeUK9uT/5Wa6oW5PgQEensVWhcJtVOt9mD+UFmwzaOz+bpFDOKbP3ZD02/i00jG9VMbgwP4WKD+I
	GIC34iVDHof6A6Pz7zry4onW/xjZ3HFOAmKMWBuXd3nGnozTG1Ay9unt+rgc1Py7mZE7egXEsaOdd
	QRa4xsLvBUQmuuOZwYYVT6ghVhW1yFjmPIYQ8ScGsI2LiY3imr0fKwfOS+V9GNPvhyLzZ3+a7KJG3
	C9qfAA5g==;
Received: from localhost ([::1]:62556 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBPMt-0010db-3e; Thu, 27 Aug 2020 21:23:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33258) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPMm-0010cq-WE
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=pruKOZFyEMiXplCVedDBFkOSgoe6GMawmbiiz1sTqmo=; b=hiIhgRxIeZV1xrRf2ovwbQCSvX
 NPV4A0JMposwAg8b9ugNdHVjDPZ1mi27tG/InBasdHSbjmGiRei5tS4BO1qe7gQbD1nuD/UWJgvW8
 SA5QJmXgeLiaWVgVBt9vQPvwS7ykbLzDW0gHBB0f04PtEbo1ZVk/daGUY8jsZ+2kMdztC5iiECSxy
 r9VMFCMlcrnAqUeoq4SBOrfQjuPCuMhgESCtRwf7uXkT0bi+jyS1jqRZ/FXyxplam0wx3eti3sf+6
 JVluKzre/SXHACexs2pL8h1XZrXkcq/QNtfptQ7V8vMdpCIUShceFoDvq4Fv9YH7xeb9SIYjA3+xy
 nyp52RetNyE5xtsuY+TYVSrocjFViU1KufEvO4qliF5H/Bx5PZDEjH6M/7t1+xykgB55WYJiIjqBZ
 VMvxDDkSxHtgdqgXduRsCXG9QOcvw/iniWNvWJkmEhrnkaqnJEKrgWqUVLIlqUGAAVB6Buh0lwPqX
 UKQX5uMh0kCwtd/sDvSqdl/a;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPMm-0004KV-Nq
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:23:28 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBPMm-006ibl-JR
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:23:28 +0000
MIME-Version: 1.0
Subject: Re: Add a lttng VFS module for samba.
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-205@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-205@samba.org>
Date: Thu, 27 Aug 2020 21:23:28 +0000
Message-Id: <E1kBPMm-006ibl-JR@hr3.samba.org>
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

TmV3IGNvbW1lbnQgYnkgZG91Z2xhc2JhZ25hbGwgb24gU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkK
Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMjA1I2lzc3VlY29tbWVu
dC02ODIxOTg0MzkKQ29tbWVudDoKU2FtYmEgZG9lcyBub3QgdXNlIGdpdGh1Yi4gSXQgbG9va2Vk
IGxpa2Ugd2UgZGlkIGZvciBhIHNob3J0IHRpbWUgKHNvcnJ5KSwgYnV0IHdlIGRvbid0LiBUaGUg
Y29ycmVjdCBwbGFjZSB0byBzdWJtaXQgdGhpcywgb25jZSB0aGUgbWVyZ2UgY29uZmxpY3RzIGFy
ZSBmaXhlZCBpcyBodHRwczovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9zYW1iYS8NCg0KCg==
