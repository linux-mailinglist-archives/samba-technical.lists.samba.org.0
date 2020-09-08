Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B3261B31
	for <lists+samba-technical@lfdr.de>; Tue,  8 Sep 2020 20:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2iuL5/z7tq0B5bP7oNxQVl8ZeJp023mlb+Sd8qka2iQ=; b=eAgJc/bEEbZrpliXNvRJObGujH
	gjlbHVq7W3V27vDqKVUYAaUNPsHdDsFsKDQSoueoMXiSIj9oixseurrEVws2Ewa9sy4nYTr8zCfsl
	tiTMX5mr+gLXv+buC6RXWwkznrkPG57rhkkBHczCMIt/EjNmwgTLRHC2kwnwIJhK9ERQs8ENKaxK5
	guQtOjD9L/qHsemv5UXVSZ4LJvF+qNxT5bx5y3X+ECi7o1++IuTcZtW8fkvUxYS31uP21wdsFMU+f
	jFRLzHiRyiOBDsHhKXTJ9Ta0jnlHj+D0dOJ3930TR2mX0qfZwTy2o785W+Yv4P6A+Ws85T31sX3s9
	H4G0nUNQ==;
Received: from localhost ([::1]:49708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFipj-004gwe-Jh; Tue, 08 Sep 2020 18:59:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63448) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFipe-004gwX-JL
 for samba-technical@lists.samba.org; Tue, 08 Sep 2020 18:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=2iuL5/z7tq0B5bP7oNxQVl8ZeJp023mlb+Sd8qka2iQ=; b=Kmd4+vDJCBU0uunOvdPzq6ATcI
 6uktr/74chtNHO1rZizaHxmllxgS54bWE4V4Z3DUpnP2EuWPakGbf3w3MmkoBiyCrX3y8aQ63RLQH
 Joez6aG4qCktj1PwjrtlxLGLyNJWVHa2ZHZkWwC3oDzhA1y5A246i2sM/ZZzPqWB3kF5oSUwpEIJP
 ui+N8jjRl9hE00WGOcjYwrclQ2/hYDy/vz9t9UH2CFdBKPqvOEGqbQfSSp5B0FIc+Iju0Oy0vx3G3
 s0pvTylpKRApH2f/CYGD+ZnrgpFgU3aJ0wDdigcOVbXzko0DlRj1p/+rVdB887vETPM52kyUYMj4H
 JltLxzk1Ghm4furBwF2QddXPDcrimVpwNlfiCWQ/BfzLJW6Klk9vk1QwnHvu3+iUqakIqbYiTUFEn
 4izo1BDbDK7rMJWhIobweJqa7j/vQweLlpXSflyS4hVYjAXwc6aiHGQ+cviIejZ1HecTVd8V0STXP
 Z0F7clnIqPJOLsQMnJaAchD7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFipd-0004CA-OK; Tue, 08 Sep 2020 18:59:06 +0000
Date: Tue, 8 Sep 2020 11:59:01 -0700
To: Isaac Boukris <iboukris@gmail.com>
Subject: Re: winbindd main process hangs on samba-dc
Message-ID: <20200908185901.GC599978@jeremy-acer>
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 08, 2020 at 08:56:35PM +0200, Isaac Boukris via samba-technical wrote:
> Hi,
> 
> This issue was initially reported on ipa-dc, but I'm able to somewhat
> reproduce in lab with samba-dc, by dropping returned tcp packet from a
> DC from a trusted domain (iptables -A INPUT -p tcp -s 192.168.0.120 -j
> DROP).
> 
> As you can see in the attached log, the main winbind process goes into
> blocking DC calls such as get_sorted_dc_list(), and depending on the
> amount of DCs to try, it may cause clients (such as wbinfo -p, or more
> importantly, smbd!) to hang for minutes and to timeout.
> 
> Here for instance, we block for 5 second per DC:
> [2020/09/08 20:27:49.595952,  3, pid=66128, effective(0, 0), real(0,
> 0)] ../../source3/lib/util_sock.c:447(open_socket_out_send)
>   Connecting to 192.168.0.120 at port 445
> [2020/09/08 20:27:49.601764,  3, pid=66128, effective(0, 0), real(0,
> 0)] ../../source3/lib/util_sock.c:447(open_socket_out_send)
>   Connecting to 192.168.0.120 at port 139
> [2020/09/08 20:27:54.603044, 10, pid=66128, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd_cm.c:1712(find_new_dc)
>   find_new_dc: smbsock_any_connect failed for domain ACOM address
> 192.168.0.120. Error was NT_STATUS_IO_TIMEOUT
> 
> On a member machine i couldn't trigger it as it seems the
> get_sorted_dc_list is done in the per-domain process (as well as the
> call to fork_child_dc_connect()), while here it happens in the main
> process.
> 
> Any ideas?

What version of Samba is this ?

I may have already fixed this in master with
the async DNS SRV record -> A/AAAA lookup
changes.

