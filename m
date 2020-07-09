Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35938219C08
	for <lists+samba-technical@lfdr.de>; Thu,  9 Jul 2020 11:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=miJ8EF/YLxdPuMmz5HHMReK3KVv6gcRqT36dE1CwBas=; b=S9WDXwBSZhDHuYAKz/zTJTCnjg
	HtW2ufu6N9c/kQwpcdH41XEu6dEPQkUNvSTXhxXeOgD+2YwYH4Jc/dnPvSitBKREh+P87/stsyoIW
	AI2b5gy6VIEMu+fiTr3+OaFDUUWOWCgx5GtFaJgI7QiKr5aEu5BSf51ZS/EM67Hiizfoo420mxOXH
	qHrzJpnbAAE8wu5FrXlfmwi+YXknamzVhqgwGQHO2VKNeFT2KUwl23zxphGtRzlQjsNVQW4kgtTsF
	pBSCKki2/YNx8VvoFiw29cpsjU9YiQJoyliAZICs53HIk9BP4lvzdNrWS2d8V44NfoFQ/0qw1wS3R
	BIMeW0eg==;
Received: from localhost ([::1]:34708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtSmB-006MZb-1F; Thu, 09 Jul 2020 09:23:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19344) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtSm1-006MZU-6L
 for samba-technical@lists.samba.org; Thu, 09 Jul 2020 09:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=miJ8EF/YLxdPuMmz5HHMReK3KVv6gcRqT36dE1CwBas=; b=Ru2ViKZnsiH0lGxu/YmmtYTBoO
 Kg856aBoOoSjVIlLHB84HI2pjMVK4Ol2fBmp5p3oQrNeM4JUQc6j3nnNjA/XSVitjSZMhPRTeNEXZ
 g4E/5bBjuO40FTyj6yY4EQRnULjW67/CCNS1oGfhUayuN96HjGbKP8KFrqWWJ2yVTH19w2sHH4q/X
 H69aq4V6w6QkTKOiTBYe3lwjAqhUVL7NoZQFg0vPz/wZdDsbf0TXHYI5Bi71eY6ZpX5rRYcSmV/mh
 nHq1/Fqv3XliY702ycb+moa85/UbRlnXnP5hiZZ0013HD9h0vdsGiAHHDr3TeYBFO0BBxfxGBNoDt
 paVXLX+aNZ+dOaigWYrppGK0fmld0tAYP79mArKrDKIwG/Mz7YCUq1qTNGxrOB4SWSff8PZ/j1dZs
 u+oKpQbFCYp/NUN/2RCuAL4ePhop4gLjF3CKzSX5XuvKmOUOziyg3X+3SXAtw+oO5UT9I2DnZOGiR
 mGV6/3SNoI0ZPJgTRl8OtGi8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtSlx-0007xd-Mg
 for samba-technical@lists.samba.org; Thu, 09 Jul 2020 09:23:17 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.13] Samba 4.13.0rc2
Organization: Samba Team
Message-ID: <8d02b882-e449-dd1c-f9e8-3d28f75c925d@samba.org>
Date: Thu, 9 Jul 2020 11:23:17 +0200
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

Samba 4.13.0rc2 is scheduled for Thursday, August 6th.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

