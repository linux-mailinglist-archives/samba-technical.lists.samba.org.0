Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5841497B5
	for <lists+samba-technical@lfdr.de>; Sat, 25 Jan 2020 21:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=G4YzBgfYo5hUELzBgs82VixNB2z8ybhB5ryWv5kdIdk=; b=q1StMTg9Oeou6Cm8lfmmX5VjG2
	EZcuWY42q9PRlKGfS6kDBMSR8CiLvVOHZn9mBd266hHLe/Iw4UcIFADJbQ1GYnb4LrIHvbVdUL+6y
	uvxiF0Tsd31bmaUkC3vGBN+Jzblmf/ETm+o9XLNTWWFuckRf3UXHDot4rkP5DjfnNpMftjskWbKdH
	wlZtGz9XZqV07YywySGumeTykZRsYmJYY1l1rRIeYlMxzSuUG37rNbDJwlbKUiZ5CDzu6EhhyoAUc
	5xn1w9BlyiYP5f8kSFUt8Hz/YD/aJBGb+mMSj9GQ5G9R70xtGgyDZnHMNg4FQ1Lw2YgypOnXfivsW
	lKpCwoaA==;
Received: from localhost ([::1]:30898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ivRgg-004jrh-3l; Sat, 25 Jan 2020 20:05:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13900) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ivRga-004jrZ-Gj
 for samba-technical@lists.samba.org; Sat, 25 Jan 2020 20:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=G4YzBgfYo5hUELzBgs82VixNB2z8ybhB5ryWv5kdIdk=; b=S4LCGTdXt7QMfN4Lw+Y2DV7Dwd
 bcDOlVC5O9TqN0RMd1+OUgVUJWbE6+8pksO50tSbr+36v3yAg+lwew+GZkEAHfoo2afT37koytJjK
 W8p+HxyVoK5JvOHcnyHqp9yPZazm4f8yKcJxHZQl9kt6MVOgKbkxNJfRlf7Ml5U+gXM+7FTbXB2Nm
 2q12brQYXq3ZCl1w4yBscgcxfVlTy298C5rIN5TDG2tb0yuzjEiFzi4rBEYA7kKTcRlzrrGleD/BI
 dj1/5OZzZ+uvjxLSTwzcgXE5wc/5Y1mnKSCsiS9Z+wrGvjPYPbb4YPp2c44FnxpSBgn0RjWu+Sgaf
 poo31Zhh9jvwdA33Ek4Zgmsy8pwx3bARSqrwiiljG+pyCuH9ULBqucU0fkhcRLQPfyttkyvmC7zND
 oBW1M/GwriieMD7tbB2hyDW7q15x7ki+CzECsikZqoLm+BdKhX486kktOxIIEOmj/dsnpNkPTl9WZ
 hJlvf1h7szaujMvLgQLthzLd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ivRgZ-0006gX-Bb; Sat, 25 Jan 2020 20:05:40 +0000
Message-ID: <bfb0a2aed55e58e3f40822fd1bbc7815042a9a16.camel@samba.org>
Subject: Re: regshell.c: compiler uses -m32 as well as -m64
To: Rouven WEILER <Rouven_Weiler@gmx.net>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sun, 26 Jan 2020 09:05:34 +1300
In-Reply-To: <F2128FA3-16EC-428F-8E37-447C96E99F90@gmx.net>
References: <F2128FA3-16EC-428F-8E37-447C96E99F90@gmx.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2020-01-25 at 18:14 +0100, Rouven WEILER via samba-technical
wrote:
> I tried to compile samba-4.11.5 using "-m64“ since it is a 64bit system.
> The most parts compile and link well.
> 
> regshell.c does not. In the compiler command I find a "-m64" as well as a "-m32“.

Can you explain a bit more about the system, and why you need to
specify -m64 at all?  (I've not heard of this done before).

As to what is different about regshell, it would be the only ncurses
program on the system, so this is what might be different. 

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



