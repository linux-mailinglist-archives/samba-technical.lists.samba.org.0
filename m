Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C894A647
	for <lists+samba-technical@lfdr.de>; Tue, 18 Jun 2019 18:09:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QYRRYDBqeeBNPqE820ZPD7YMXyv0nEdzHotuJ4/ck3o=; b=3WCIRPAay4L4jl9/5W99lkd4lS
	tc2UnzQIr0fwrjNo94d0Q2MHg8EAdKRGi+S5yWI+bP/Y9jM8qiTdm9c0xkG2JTtS+LKORrN+iPzYn
	hppgq50WDdlNHTo0za3Ot1RYuRdKzzIPzUCMkXVkg3AQH9Rxr1vvYA3YIPiqNGD/letwXdKzgemnf
	lG6ikbFOM+XZv92mKWt3G5EsCK45P/8qlPop3mf5KYmmKgO6TOsxN7mRP135ma/2WE+B+LiSjkToW
	H0zdwdwYUEdHGsmQ5W6/seMAT5cXPQwz2dws6KiMZQLlMDNXW3CAMAVTfrAno41gqK+hEuIhhjlLK
	r8jkPLKg==;
Received: from localhost ([::1]:38178 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdGfa-000507-MP; Tue, 18 Jun 2019 16:09:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdGfW-000500-Ar
 for samba-technical@lists.samba.org; Tue, 18 Jun 2019 16:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=QYRRYDBqeeBNPqE820ZPD7YMXyv0nEdzHotuJ4/ck3o=; b=vQzpIWoN7vnji/XGG34uuY98bg
 GPJOAvHOrIGHlut7XI8E7ULKCwqo5ITTcFwbupFFFptw/w4Bx2KZ8YePkzTWRTE6MeHXBeX4jCjsu
 Ja5EOdOvDR0EpQOHp05vm96ZOQVbzj06DcgWRWnlmbr0tyIXA0mUNjYcFEs0SJrm3/gg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdGfV-0003YD-M1
 for samba-technical@lists.samba.org; Tue, 18 Jun 2019 16:09:10 +0000
Date: Tue, 18 Jun 2019 09:09:07 -0700
To: samba-technical@lists.samba.org
Subject: Re: RFC: deprecate allocation roundup size
Message-ID: <20190618160907.GA233746@jra4>
References: <20190618144358.GA6800@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190618144358.GA6800@sernet.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 18, 2019 at 04:43:58PM +0200, Björn JACKE via samba-technical wrote:
> Hi,
> 
> I was debugging a problem with strict allocate = yes and our current default of
> "allocation roundup size", which is 1MB. While I understand that a large
> allocation roundup size was supposed to the a performance tuning for old SMB1
> clients, this has the side effect that with "strict allocate = yes" this makes
> even small files take at least 1MB on the disk, because smbd allocates that
> ammount of disk space which is given back by smb_roundup. This is an issue for
> some setups, because the extra ammount of needed disk space can be huge
> actually.
> 
> To work around the issue, I tested to remove the smb_roundup in places wherere
> disk space allocation is being done so that the allocation roundup size value
> is only used to announce this 1MB "block size" to the clients. I'm not sure if
> there can be other negative side effect thought if we announce that large block
> size but behave with the actual space allocation with out normal small block
> size.
> 
> As this performance trick is not needed for modern SMB clients any more, it
> might also be be better idea to just reset the value of "allocation roundup
> size" to 4k again, deprecate the option and remove it with one of the next
> releases completely to behave more windows standard conforming and to just cut
> off this source of irritation.

+1 from me and I was the person who added it, a *long* time ago :-).

I agree, I don't think we need this anymore.

Cheers,

	Jeremy.

