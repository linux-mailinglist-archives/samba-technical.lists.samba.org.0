Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 363AAF1814
	for <lists+samba-technical@lfdr.de>; Wed,  6 Nov 2019 15:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=91K8bl5c577LmcvlgoC1TYbFx8XANuwxURn9zYcy35M=; b=F749/2JePdCMrgtr9+GiJqcLoC
	rLqJIF9oFJDsilngj8+rj7e1ArwLEn4nKl9wgKa8bUlouWdWgG95Hln5LsTflRTZCIFwVGrrlicO4
	I2Ms0+g+eYnQZ37P5UptUDqIxvHZ9OLNg6o4uWahKK9tbrqxrfxIWgQ7zN7OmHv5GOh0JZfneA26Y
	g6jRMb9yi51RHraMncRI2K9KYWeupqn1ybZn+T7iP9DyAjmCXS6d2KOsoLOrY3uleBHt8pKgn9Pbn
	QTVEqBxQkyZgPK7Tj4GvPeAHI8SVJMEBAzlYMBuXMB7oS0HeY0bBK5wF3zkcpiRjO8d+9VrjtIj/e
	doweV+jA==;
Received: from localhost ([::1]:42080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iSM4T-0074IG-Ds; Wed, 06 Nov 2019 14:14:05 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:34448) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iSM4O-0074HY-88
 for samba-technical@lists.samba.org; Wed, 06 Nov 2019 14:14:02 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 1BAA3D47D888F
 for <samba-technical@lists.samba.org>; Wed,  6 Nov 2019 17:13:57 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AEJOhyvN_i7Z for <samba-technical@lists.samba.org>;
 Wed,  6 Nov 2019 17:13:56 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 88F6BD47D88B8
 for <samba-technical@lists.samba.org>; Wed,  6 Nov 2019 17:13:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 88F6BD47D88B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1573049636;
 bh=91K8bl5c577LmcvlgoC1TYbFx8XANuwxURn9zYcy35M=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=gzndDaCpZp/FPBYhpUNAxl33dEKkVODisTk+hikv/htplWy63NXNhr3zgUxiNFB1n
 6wNbEAk56a5eiaJA2AM7+IngKvtWnTIaxc2/C0zto7adNsPNd+fYrwKlkJx1Qmco6c
 8ZwJfUHs5qOnySLpJFgfPRerJ/QhG9Lf9jEt2KaLV1l8RlzYU7zNV+fNlnBR71Nxhz
 Ks5izfKt+iprnvzBZBAcuPa4xeidP8VS31bJfnP94NUwAtOcfirDWlp2Ga6p1Tg5uU
 UlrnpijBZNhPiLoU1zp1RZnQiF2Rq7Swdnma4NhClWcdTGvEqb4YTie4nktqs6KvS8
 tbdJ5cxdb07mA==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kiWIKX51DpC7 for <samba-technical@lists.samba.org>;
 Wed,  6 Nov 2019 17:13:56 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-71-21.ip.moscow.rt.ru
 [90.154.71.21])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 5D768D47D888F
 for <samba-technical@lists.samba.org>; Wed,  6 Nov 2019 17:13:56 +0300 (MSK)
Subject: Re: GPO application in Samba
To: samba-technical@lists.samba.org
References: <80a05da5-3692-8e07-8013-1c4874aba498@basealt.ru>
Message-ID: <a2d79287-e532-5379-d604-085fb6c4e0b6@rosalinux.ru>
Date: Wed, 6 Nov 2019 17:13:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <80a05da5-3692-8e07-8013-1c4874aba498@basealt.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
Content-Transfer-Encoding: quoted-printable
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello!

06.11.2019 12:10, Igor Chudov via samba-technical =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
> <...>
>
> so it would be nice to standardize the approach.
I'm not able to answer your questrions, but what do you mean under=20
standartizing?
> Also it would be nice if I will be able to modify yast-gpmc so it will=20
> be able to run in a generic distribution, not only SuSE Linux.

It's an interesting idea. I've just run an AppImage downloaded by=20
following the link in the description of yast-gpmc=20
https://github.com/yast/yast2-gpmc on Github, it seems to work in=20
console mode on non-SUSE distros. I previously thought about building=20
yast on non-SUSE but did not try. Building its core and ncurses/Qt/Gtk=20
bibdings should not be tricky.



