Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D3E337A87
	for <lists+samba-technical@lfdr.de>; Thu, 11 Mar 2021 18:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=iNOgB4zQF/AGxEUxum6IfVgj1YJ5XP+wMGTUJDqkP1E=; b=rY4+m/ZTmUeojMiCqIY2NFdGOJ
	aLn5aAYuqBLDa3avBV9tPLchjdOgQXmaI45KmNetSM67x59uHbu8uf/T0uiv397lK/Uxuv/yvspuy
	IZcj/453WpVF84iULHjhpqFYrGVxcP0yNQHByzqZ2cKlTjsSLXKzeEJ3s+eQ5Xa5EUGbof7Nz1hLO
	QtZ09FXQtgp7gY++MAS4A7RDmc0YKockKKskat6jv5nAuv6g376biuP0gIWxmCdB0h64qUE42UIEi
	3dL/lW9UHnzbjyZz3NXSj2dwJNM8pJVzjicrw5Zlgh5zhb4nSG7HUzWgI3mErb9BCJ4yIRY6OOEpm
	WdFYR5yQ==;
Received: from ip6-localhost ([::1]:36384 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lKOrU-0051Rg-0d; Thu, 11 Mar 2021 17:12:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17100) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lKOrP-0051RY-I9
 for samba-technical@lists.samba.org; Thu, 11 Mar 2021 17:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=iNOgB4zQF/AGxEUxum6IfVgj1YJ5XP+wMGTUJDqkP1E=; b=r2XEmtDfYuB5ZhbE8lGp6won1C
 2pvfYUjlJbWpYR3nnwjA8wbvHzPQZwj+Rc0MEHLtbqE9DA78IScc3NdG2y60W8uX8AXWmpiq0sU/p
 U/1TS/LME6khtQWlIt6Y4/xpITgeOQ0oJiLmmWVKxZxf27b2M8/KftBWSPl36pF+REuq3nZl32mfu
 H4IC04I7DMi2M6DSHkUnkw3DmEu0QOv8/h5v/ZlpjYIVj9liYSE+N/DMlmahV3Re755cZcvm8uLze
 5w6KYtHoSsuLzIUcKXwiqOnkqnvSbiDLj52sJh5i8sAi0uNQC8V/7uWj+M1ZUC5uB1ufeoZCWSO5z
 5OsiCGMZW2x0zVUF6AnCmGpAdg/tBOtwAZ0nIof2tNDneZ2odk1WjcDrKHHH26gldbCbIUniChLmY
 Kr+rWz7oS1P33vfb3VaQsOmtipoW3cYRsqinA8DSPcGEGcZBP8xWgGy2Um6CfT1rPMlt+rCKO+xVH
 hVMAjaDblWi3PEWNiJaA3KEh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lKOrN-00063K-Vg; Thu, 11 Mar 2021 17:12:30 +0000
Date: Thu, 11 Mar 2021 09:12:26 -0800
To: =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>
Subject: Re: flock possibly missing in SMB3 POSIX extensions?
Message-ID: <20210311171226.GE1882429@jeremy-acer>
References: <878s7aztu8.fsf@suse.com> <20210226181702.GA94004@jeremy-acer>
 <20210226184037.GB94004@jeremy-acer> <87czwdwm9g.fsf@suse.com>
 <87ft11tyo9.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ft11tyo9.fsf@suse.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Mar 11, 2021 at 05:58:30PM +0100, Aurélien Aptel via samba-technical wrote:
>
>Little update on that topic: I was looking into the cifs.ko SMB1 flock
>code and it turns out advisory locks were already in the SMB1 Unix
>extensions.
>
>After a quick grep in samba I found smb_set_posix_lock() in
>s3/smbd/trans2.c so presumably some of the logic in the server is
>already there.

Yep, the SMB1 extensions already do POSIX advisory locks.

Once the VFS is finished (soon, I know, I know :-) +
SMB3+ POSIX extensions, handles opened with a POSIX
create context will do SMB3 locks as POSIX advisory
locks so the same logic can be used.

