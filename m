Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A5013654D
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jan 2020 03:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=htreHo3XdCWLZmWKzy4l+muMPxKvA8CiU4U+t7pQzsg=; b=52aiTTSZs0W633jVFtGb+opIOZ
	q4ZqU+Iiv7W6OhOvzY+EMu98LVnNGU8LIhCmKLABQxlyj0d9pWx9EmXY1hmWO2UNAHlMprs27l/o5
	1b6UvyfU5rNZMzrKBl6FOWZ107AhF2vmYJmvG6BPv7l22FeWmPIU62XKDWUfc91O+dlau71bjpTop
	AJ2rwmlZfG61kk+qUsNlydfXuJZ2YidArSRnxsfS6jMTqfQfr5qRNKebw2W8f+QUKvbLrQtz/0ci8
	kgm5T7xE2R5jZsbmriRusTrVz6yYPOOvlCJjLMSUtGQP4vKjPrF11MhLGXG/sVBoq4IEDtTux5qUK
	hnEKO+8A==;
Received: from localhost ([::1]:59256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ipjyu-002t6z-LY; Fri, 10 Jan 2020 02:25:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48634) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipjyp-002t6s-78
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=VDlkR41hbA9Nkv72aHNNlPOVPVwJRipad5w3Sr/YPe4=; b=QSxAxaK0o1GTKjnRtCj+vJ6CDF
 huuSi790ExwO/+cYDL6+57h/0+bF7u4u3+UX2cBPUrGWxfILktOYoYs78O4QNnLL0EQo//B6nwU5K
 8jp2F+dMxz7kdwr4Y/UWwdndK6tsiAbKF5E52riz6jDC54yi8XuQjzs9uqPMhtwKbm5PgM1ayxFeG
 M93kiCZYfN38c9HfPAhVLRnXLnhhrMEofQ6KYHqkoxTMxlHJnK63KhG1vn9syhdViAQWv6mOPcxpA
 Kr3x1/xV7FFAQBbi7gw4l4WKRrFwAHWDhhzKcxlschAFY8Ax1bkSWAosf+YTF2Z3bgsgIHAHd2E04
 yhyW9y5iqdlI4x1Zf9h6FTFU4MtPtAw8pQAy6J1XHZD+xTjF2W9YAll4NOi7pUa8qk2Pl2UzCewO/
 qaOO/7+/EfKcjDWBVaTr5toGlGoB7wHxSYuq6ozFzq3c7dDYGMiKfU5ZbKwpYGvL2dTWuhv8rP87l
 Wksr16O96g7BnD7FHqTd2rpK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipjyo-00061f-GT
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:24:54 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1ipjyo-00309Q-AR
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:24:54 +0000
MIME-Version: 1.0
Subject: Re: fix ldb-samba: require pid match for cached ldb
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-164@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-164@samba.org>
Date: Fri, 10 Jan 2020 02:24:53 +0000
Message-Id: <E1ipjyo-00309Q-AR@hr3.samba.org>
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

TmV3IGNvbW1lbnQgYnkgYWJhcnRsZXQgb24gU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkKCmh0dHBz
Oi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMTY0I2lzc3VlY29tbWVudC01NzI4
NDQ1MjcKQ29tbWVudDoKQ2xvc2luZyB0aGlzIGJlY2F1c2Ugd2UgZG9uJ3QgdXNlIEdpdEh1Yiwg
cHJhdGljdWxhcmx5IGZvciBwdWxsIHJlcXVlc3RzIGFueSBtb3JlIGFuZCB0aGlzIGlzbid0IHRo
ZSByaWdodCBmaXggaW4gYW55IGNhc2UgKHdlIGluY2x1ZGUgc3lzdGVtIGhlYWRlcnMgdmlhIHRo
ZSBzeXN0ZW0vIGhlYWRlcnMgZnJvbSBsaWJyZXBsYWNlKS4K
