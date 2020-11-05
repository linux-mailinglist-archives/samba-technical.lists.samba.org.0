Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9C2A7B73
	for <lists+samba-technical@lfdr.de>; Thu,  5 Nov 2020 11:14:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=y0rYQeWIUwkVwctkFvPhndkzHNNTFE12qE9aM7tgSzU=; b=CpeVHgwaVvEIYYMUAqZuWuatwh
	1v2bEBzPoJZZfMB3j6p60ROkdbMeGlCcBf7DNcNyFeUvvzZWwIVSajUwr9u6VQMln48TgiMuM5PbY
	RTDsGIVkNjGcn8jyL5M6fZgQ/kNHVbmYKymq9BTrg2C/mXzFIYsVzw/bzDRvTuiQnWCnNjE7EE48D
	F6Kgzs6a7C2wrUw+AANoZr16vsI7ZULxoVu/BgijVmobMJDc5J8vGJ6PCbk9WEcfclibaNNAvnSYC
	YL57PcCSv5wQ9JlWMD5e3R0YWHmLP1qngvxTvMcz3QQ4lVwu84xaTCb62+DumVJWkPxG8bTvrqu16
	5tJhrZBA==;
Received: from ip6-localhost ([::1]:51214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kacHQ-0000Cm-Vt; Thu, 05 Nov 2020 10:14:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41728) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kacHM-0000C2-10
 for samba-technical@lists.samba.org; Thu, 05 Nov 2020 10:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=y0rYQeWIUwkVwctkFvPhndkzHNNTFE12qE9aM7tgSzU=; b=qEKNEXEtNKHXyX7tmLSKjvivA7
 8fNx76XrvLfQk8023vYgTsbtwSVTuSbINsSYlrVpk/J8XUZUMrzUGBpbkjzzAKrs0GCQrskOTXkwx
 e0HXiGfJmUtor9CP25nDnC/pNMj9a/tdJXxeXqN30ABbONV/kvXjtA0lRZd9P+uS91tfUV5QMcOn9
 mpWm6myjwqqOf7YYn9jc3uWlnK5DcRsiHWwvVqKlyqR6ympMgQfIr4tQX81xNNmU7Pvai7LaKci4V
 5QQJKeyozt9vkVSb+bHnggkKJvij/X8WDp/1Oqo5Roe1deTwg6lDEhKUc6lw9TgByaqyZyso5lVIq
 Zni7Hg7ej+vY97tDE8DjSVxqhU0uPDGZFkuuIZAH18PUFME0l4MJxjA8fPwjadzuO8FXS/n/qJBnT
 QkrdMMGsY9Kd2676LMyuPXQZt6EGnJs67Jgr1c8BezIR/cCr8Eku3XppeH4SCVXVXKdvTRzBvBKxW
 RQhR/e79m3zPu4gQuG+TY/s3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kacHL-0001cr-Nq
 for samba-technical@lists.samba.org; Thu, 05 Nov 2020 10:14:03 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.13] Samba 4.13.3
Organization: Samba Team
Message-ID: <7f5fe1e8-96f4-4de3-f804-336ca8b61444@samba.org>
Date: Thu, 5 Nov 2020 11:14:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.13.3 is scheduled for Tuesday, December 15 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

