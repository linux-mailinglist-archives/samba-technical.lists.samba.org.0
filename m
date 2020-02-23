Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2C4169822
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 15:42:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3HBKPsxljgM6+jQii+L5UtbD7Vb5uBUoFXAs67iv9tQ=; b=rNydlRbYtn2TREgYvfW2ie3Gu1
	xStSNDQOY00+OiockiVXHY449/T2KDwai8buyDuwK+twqfUwWi0LM/Nqf3fY6IYxcVv6UB9+a2OgW
	Xz7cVMxLiXB0W/rj2X+zbdcEzXFPX9MaQmrX4/CP8127K4a5kIJisgJpAXVFg3tr3590YmgkOVj16
	ZNOFMDKTbmayosQuQo+KoLsY9Y5841OyNtRjkuff5eqF5HtJOBTW16yYSqcJErMiE7BHFrsxUgjFL
	+ZEtXuE+UcSbrBzEIruuRZ8PaukTNRF875iD1RLfJHVyc58XhH2sdCMEAl7/j++KWhYEEZM2t7gv2
	X8HaIoWA==;
Received: from localhost ([::1]:29158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5sS1-00BBfz-C4; Sun, 23 Feb 2020 14:41:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46740) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5sRw-00BBfs-Pq
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 14:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=3HBKPsxljgM6+jQii+L5UtbD7Vb5uBUoFXAs67iv9tQ=; b=rdhhRx+veMgWQCtfi2R18abmcl
 H5mMDkhJ4qaRYsxLGUTOCR+e9Peyo4x04uG4u6VbedM7TyACowd3Vy7QAxhOiB26UJA8p7hkz4lAj
 3pBD6R20SBkbtOKzmppCeDvPJLlZGalnJeF6tGy3YYxGrHYrBIR4UsNB4pX11z1yWeApIffbEMZWe
 Vif0nVvz+C/W4UBhnAW7KLXfWohzvzFeM0vz6TL10Jy3I+bfoDWXZgcTWzXUHi4i5xlr08KUtq3o0
 zaf7QA4Y8HlDDFq6de0AZgN4t6hY6B+SfoUL8TXVP5IQ2jS55DCLsU1ng3gZ73/1jndvOY8eAqgzd
 ADRNZuH2qN5MLSk7Azq26PxdH0sat5loAj68EsUgx23+DQ10iQ1T717luO/kkUOcI39G5d7Kk01wF
 e7vIYtkosgmZlEjcKWEqqxauqMfZ0GJlJxkwH6vOI9m31BtGFrngm15LvRXVB/cMWRq8uv4fzoskX
 YPTVjwYpISqkaBHndsqdZNEF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5sRv-0005Iu-0h
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 14:41:39 +0000
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <5b43a40c-9d80-a6d1-cb63-046cef3bbf77@samba.org>
 <88708706a3ddaf37a6ea43ecd86289c0ada99b69.camel@solinos.it>
Message-ID: <d804f548-50d1-f188-959c-57cd828174e8@samba.org>
Date: Sun, 23 Feb 2020 14:41:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <88708706a3ddaf37a6ea43ecd86289c0ada99b69.camel@solinos.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 23/02/2020 14:30, Dario Lesca via samba-technical wrote:
> Thanks, this is the answer to my question: This error message is not a
> DC problem.
> I can disable on Windows client the own record update (I will find out
> how) ... or ignore this error log (I know how to do it).
>
> Two little question to better understand:
> a) There is alto the way and it would make sense on Samba DC (or Bind?)
> to allow the client to update their own records like (I image) their do
> on MS-DC server?
Yes, stop using the script, you only really need it if you have Unix 
clients.
> b) This issue is there also on samba heimdal kerberos?
Yes, it is down to ownership of the DNS records in AD and nothing to do 
with kerberos.
> Sorry, I thought that since samba 4.12 was not released yet, I had to
> go here.
> I must move the message to other list?

For anything to do with an RC, probably asking here is a good idea, but 
the script is an add on and really has nothing to do with the RC 
release, so I feel you should have asked on the samba list.

Rowland



