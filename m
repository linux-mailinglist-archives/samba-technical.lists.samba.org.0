Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1402261C0A
	for <lists+samba-technical@lfdr.de>; Tue,  8 Sep 2020 21:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1D5POdJLjJfp3DKi272A1v6G6BGBYDfDcCAzpioD4RM=; b=PGb+kF12aBLGjahzD3bal3M2gh
	0lC93WWjBRR0qcsulnUSoQRexs5sJy4g7tfPSFDzVcuwkCuaLSRcF95XhUSldHk2YouEP0ZwesA/Y
	lv+DWVk+jC6+2ge5cEW7nSEMNdQxD9G1ayxttU5FPcw5BzlZvRgo7aJ/ml2rdiXcCxOipUqk56R+n
	O4uZiOtOzhRrjWEtSR3L2I3r4eOhwqYzV8xfD947d0P/Ec82B2KECuH/jAg9KGpy9jWqIubALN3gZ
	3llD3vW0z2x3hEgtG7zGmBKTMII9FRBuzxlU1E+t1ALhMMVW4jfGEQknIsd0zhaG3VsApEtcQUD90
	dpKQfpIw==;
Received: from localhost ([::1]:51198 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFj3W-004hAV-El; Tue, 08 Sep 2020 19:13:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12534) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFj3M-004hAN-Bd
 for samba-technical@lists.samba.org; Tue, 08 Sep 2020 19:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=1D5POdJLjJfp3DKi272A1v6G6BGBYDfDcCAzpioD4RM=; b=2X4IhcpC9FurkkEj7Jo1EdDtNO
 8IpediLfjTBKFxQ3en2Dp7yr8Nk6z1GmqFnkqNK/SVArnfWqwXOnC3+lNkrMjjnec2d8mKmR1DbF4
 zwqYDEYR38ukHA5HuGApF4l0hqCaTtVISdJMA6kewbhBD42bEND/cuVeshJoMnQG7RrsHJBpyeGKP
 1Ea/438hvFl6sTqaQSxId5D9pipYY4Pq89tGM3WsZpdq9vdamfOOBgHL2C9+hmWCLMpfEOG/4sIEZ
 4vYkJYxKo9A0Qvm3dpvyrFXhhFPrP3WaDRs2c1gknWzDjbsGTsMxFzxaaaiBNnXVplPwV7e4O6KMv
 QiLU/o0MfCnCLdh9DM38GZxnD+Q4fHiyAGK7geoMdRJ9uZA7ND/WMjUDCoNxHrrKv/IAGHyTFFw79
 NzQwfyl4ShYH5xdL1CRECa3g3Nt+9/7qw0TH6qjrw3ViTLPxn2v3JLam2CAIg/7PNuXjCS33jvfwR
 le2K4KwLB0tL+q2K8BlM0Ocu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFj3E-0004L4-Tc; Tue, 08 Sep 2020 19:13:09 +0000
Date: Tue, 8 Sep 2020 12:13:04 -0700
To: Isaac Boukris <iboukris@gmail.com>
Subject: Re: winbindd main process hangs on samba-dc
Message-ID: <20200908191304.GD599978@jeremy-acer>
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
 <20200908185901.GC599978@jeremy-acer>
 <CAC-fF8THpKjJ610t2QaT=uUEkZ1cU1WqKhs0FXNiKscMursMiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC-fF8THpKjJ610t2QaT=uUEkZ1cU1WqKhs0FXNiKscMursMiA@mail.gmail.com>
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

On Tue, Sep 08, 2020 at 09:05:30PM +0200, Isaac Boukris wrote:
> On Tue, Sep 8, 2020 at 8:59 PM Jeremy Allison <jra@samba.org> wrote:
> >
> > On Tue, Sep 08, 2020 at 08:56:35PM +0200, Isaac Boukris via samba-technical wrote:
> > > Hi,
> > >
> > > This issue was initially reported on ipa-dc, but I'm able to somewhat
> > > reproduce in lab with samba-dc, by dropping returned tcp packet from a
> > > DC from a trusted domain (iptables -A INPUT -p tcp -s 192.168.0.120 -j
> > > DROP).
> > >
> > > As you can see in the attached log, the main winbind process goes into
> > > blocking DC calls such as get_sorted_dc_list(), and depending on the
> > > amount of DCs to try, it may cause clients (such as wbinfo -p, or more
> > > importantly, smbd!) to hang for minutes and to timeout.
> > >
> > > Here for instance, we block for 5 second per DC:
> > > [2020/09/08 20:27:49.595952,  3, pid=66128, effective(0, 0), real(0,
> > > 0)] ../../source3/lib/util_sock.c:447(open_socket_out_send)
> > >   Connecting to 192.168.0.120 at port 445
> > > [2020/09/08 20:27:49.601764,  3, pid=66128, effective(0, 0), real(0,
> > > 0)] ../../source3/lib/util_sock.c:447(open_socket_out_send)
> > >   Connecting to 192.168.0.120 at port 139
> > > [2020/09/08 20:27:54.603044, 10, pid=66128, effective(0, 0), real(0,
> > > 0), class=winbind]
> > > ../../source3/winbindd/winbindd_cm.c:1712(find_new_dc)
> > >   find_new_dc: smbsock_any_connect failed for domain ACOM address
> > > 192.168.0.120. Error was NT_STATUS_IO_TIMEOUT
> > >
> > > On a member machine i couldn't trigger it as it seems the
> > > get_sorted_dc_list is done in the per-domain process (as well as the
> > > call to fork_child_dc_connect()), while here it happens in the main
> > > process.
> > >
> > > Any ideas?
> >
> > What version of Samba is this ?
> >
> > I may have already fixed this in master with
> > the async DNS SRV record -> A/AAAA lookup
> > changes.
> 
> git master, in this test i only block tcp packets btw.

OK, so we should be getting a good list in a reasonable time.
Looking at the smbsock_any_connect() that should be pinging
a new DC every second, and timing out in total after 10
seconds.

Can you add DEBUG to print out the number of DC's you
get back from get_sorted_dc_list(), and the timings
inside find_new_dc() ?


