Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C03CF261CA0
	for <lists+samba-technical@lfdr.de>; Tue,  8 Sep 2020 21:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8Xjhpyo0EVAOI34DF5y8RTccxkN6txfpfz+6UzWA+tM=; b=1umDWrtRTC0vbVmC7q8n9rqgP/
	LrYRDyyGn0Ktg/tYv2XULKxCxM1p8QhxBZUecz7Qlc/rHXjJnS6vDp3Muy/z88ANbFhqwdwxCN1Ut
	z9gcl7Fbqe/zRM1WxKyIgp6stPaCF7C+IhgoN1lES2jERajJBLoAyHmS888P/Mp6w817wl2ug0AM4
	SaTMgmxvnJEBMdGghHh0T4+hhNGlY9tNPklLAAWNY92BoEKxMJbTugP9mH8Ou4wXLBVAUJJTCLM10
	f8EDrAhD1uZF8iHR4cJtHyjQ2n/4a+sW+6VWZucumSlDZvPOR8Th/X0a12lf0CtIkjWoTou5A26GL
	I6wa5opw==;
Received: from localhost ([::1]:51930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFjDV-004hH8-KG; Tue, 08 Sep 2020 19:23:45 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:44275) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFjDP-004hH1-Uz
 for samba-technical@lists.samba.org; Tue, 08 Sep 2020 19:23:42 +0000
Received: by mail-qt1-x832.google.com with SMTP id e7so64012qtj.11
 for <samba-technical@lists.samba.org>; Tue, 08 Sep 2020 12:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Xjhpyo0EVAOI34DF5y8RTccxkN6txfpfz+6UzWA+tM=;
 b=r9+krfobCulQjIzS/VTHf4afW/7NkXLoE5HoNY5KthMNw4gW+t4Y9iXAqRdD1FhIlP
 kWihTB6CNR/c8GYldOLXoyaMGdDwAt5eGrzh9KEh/YDHcctzL1t61iVF5zA4rTrcpRBa
 5646RfThDSYJZ1mp1WSessFnwtXXQF3z64RTi2jfyOY1Xx0l378wFPnz3WQQiwVz19W1
 eqM3Zn6TlG051/ToMe2HxU3NUf1mYuiG6XXrrH2Pg3GOrR95zk+1MFbwkk9UFLZvoGSv
 LkqUbPaBriGGhcwdLHy9FzIuoLNgUexiQBXEM7OVrXdYwTV5FZS+2/zzon79g3N1hNhV
 dq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Xjhpyo0EVAOI34DF5y8RTccxkN6txfpfz+6UzWA+tM=;
 b=dEKeZ9eAtP2YGtmrHHmkXUYmYB9+uRCpbnXVhRPw0oj/tBbBtnPzczpDQn8G27uW0m
 W55C0lDd2F0Ib2l8VgeQ+NjKDZFdqUApvd2kKB+7Xma0or4+8+880CHjDwMNbwc7pqkW
 e4SMBjGDnabv8bcSOpbHD2Zhaxv3hVjxpYgJIwm2Gp6T8dhi0CrQm9+wqlLL+L8/RbYn
 JumlCgPtWZg0ZjL7DmdE9udwzJBYT4CG3kPolk8DNWeSoUcfFvtzeeD+0/PEqu4DKJas
 lY0Xg9pJpvY+H0DpfGuacd3qDxGqMJicCRVbqzdDwneVIFWDDwrWZApOnJweFxh339qx
 zA9w==
X-Gm-Message-State: AOAM5316sZgN8Pfuog/nsfLPx4f9FZGCggp1vWX1j6fxZr7pIRSXrpgj
 AbQnOGyF8Zqy6zgRj1mvbhVkZrw+dbyEqzrhnJ2lTDAb
X-Google-Smtp-Source: ABdhPJw/Wy51XvBiMI7YaCrA93yNRDZEu46XerOpZqVznJb5PlF8FXdU4fAR7sm4oVjUoiEtpyuhyJOVQm7V+PH07PY=
X-Received: by 2002:ac8:338d:: with SMTP id c13mr1687361qtb.5.1599593015844;
 Tue, 08 Sep 2020 12:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
 <20200908185901.GC599978@jeremy-acer>
 <CAC-fF8THpKjJ610t2QaT=uUEkZ1cU1WqKhs0FXNiKscMursMiA@mail.gmail.com>
 <20200908191304.GD599978@jeremy-acer>
In-Reply-To: <20200908191304.GD599978@jeremy-acer>
Date: Tue, 8 Sep 2020 21:23:24 +0200
Message-ID: <CAC-fF8Qx7K_bA5JWDGpRAm2tYe2pdQNMVe9XFwrtciOOCrKTFw@mail.gmail.com>
Subject: Re: winbindd main process hangs on samba-dc
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 8, 2020 at 9:13 PM Jeremy Allison <jra@samba.org> wrote:
>
> On Tue, Sep 08, 2020 at 09:05:30PM +0200, Isaac Boukris wrote:
> > On Tue, Sep 8, 2020 at 8:59 PM Jeremy Allison <jra@samba.org> wrote:
> > >
> > > On Tue, Sep 08, 2020 at 08:56:35PM +0200, Isaac Boukris via samba-technical wrote:
> > > > Hi,
> > > >
> > > > This issue was initially reported on ipa-dc, but I'm able to somewhat
> > > > reproduce in lab with samba-dc, by dropping returned tcp packet from a
> > > > DC from a trusted domain (iptables -A INPUT -p tcp -s 192.168.0.120 -j
> > > > DROP).
> > > >
> > > > As you can see in the attached log, the main winbind process goes into
> > > > blocking DC calls such as get_sorted_dc_list(), and depending on the
> > > > amount of DCs to try, it may cause clients (such as wbinfo -p, or more
> > > > importantly, smbd!) to hang for minutes and to timeout.
> > > >
> > > > Here for instance, we block for 5 second per DC:
> > > > [2020/09/08 20:27:49.595952,  3, pid=66128, effective(0, 0), real(0,
> > > > 0)] ../../source3/lib/util_sock.c:447(open_socket_out_send)
> > > >   Connecting to 192.168.0.120 at port 445
> > > > [2020/09/08 20:27:49.601764,  3, pid=66128, effective(0, 0), real(0,
> > > > 0)] ../../source3/lib/util_sock.c:447(open_socket_out_send)
> > > >   Connecting to 192.168.0.120 at port 139
> > > > [2020/09/08 20:27:54.603044, 10, pid=66128, effective(0, 0), real(0,
> > > > 0), class=winbind]
> > > > ../../source3/winbindd/winbindd_cm.c:1712(find_new_dc)
> > > >   find_new_dc: smbsock_any_connect failed for domain ACOM address
> > > > 192.168.0.120. Error was NT_STATUS_IO_TIMEOUT
> > > >
> > > > On a member machine i couldn't trigger it as it seems the
> > > > get_sorted_dc_list is done in the per-domain process (as well as the
> > > > call to fork_child_dc_connect()), while here it happens in the main
> > > > process.
> > > >
> > > > Any ideas?
> > >
> > > What version of Samba is this ?
> > >
> > > I may have already fixed this in master with
> > > the async DNS SRV record -> A/AAAA lookup
> > > changes.
> >
> > git master, in this test i only block tcp packets btw.
>
> OK, so we should be getting a good list in a reasonable time.
> Looking at the smbsock_any_connect() that should be pinging
> a new DC every second, and timing out in total after 10
> seconds.
>
> Can you add DEBUG to print out the number of DC's you
> get back from get_sorted_dc_list(), and the timings
> inside find_new_dc() ?

I don't see how we can block at all in the main process, we can have
trust with more than one domain, to me this seems utterly wrong.

