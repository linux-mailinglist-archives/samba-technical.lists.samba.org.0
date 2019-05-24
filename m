Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA2A2918F
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 09:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=05vAoVeOrdstEB55Nwy8Ge/6GUU8fE9/JUAdAnQMoes=; b=kT9csqwpQ6J4ErmKH7RJ37+Me0
	CEaRPd1/QiPQw8rkjlkfvRCDTihe0SvZVa/bDjRAtxo2FlMNGx1ltL9wCDYEwT8ciaXopbeAevw5I
	pS6bqWJyZwWeazIF8QkKwK1u3T1Mg2SLeDUrVxh7MMEQ5Ruv7+rFvGxU1xZKzPVM2jkgR91BMBqlm
	Tq1WQ5svwDZ5coHRLiO1r027r3Ussfh5iKrE1j4kf5LTMiYurqgJatG9CeowFllao26v/WSc8neAd
	7dn/wHNBKltnmQ+a5EnAhb4SExYRQaIA8H5LZwiz1m/feGOuowiTMrP/cboRslHvtKTy1zyTjkaDz
	9BPiYWlg==;
Received: from localhost ([::1]:34752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hU4NV-001XH0-Q9; Fri, 24 May 2019 07:12:33 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:36851) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hU4NP-001XGt-EE
 for samba-technical@lists.samba.org; Fri, 24 May 2019 07:12:30 +0000
Received: by mail-yb1-xb35.google.com with SMTP id y2so465200ybo.3
 for <samba-technical@lists.samba.org>; Fri, 24 May 2019 00:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=05vAoVeOrdstEB55Nwy8Ge/6GUU8fE9/JUAdAnQMoes=;
 b=l2cBl0zfxxMlrf8C6Fr2VJYVqCQe/2pi4SHlvlxJgaJqxbEjmvhKlSIXP9g2gFlykn
 TKq9Z+nJmKkVUyJ66Gkp1x7hRXjpDtcaefPFm8/uN5A8oPJYf+u7bLJJexvum2sBMopv
 JRI2G7Nw8QVc6i8HzdKHZSUC0I2LKGsm+bHLLtZJgfxQvC7/OFYeLMGci1aF/b2eWXdI
 mlsH95DI5gnl6tAzQx+X3iercDqlhDz10WPDSLRO2hELAtRo8DUIE78QF4dlEpD5/vAG
 NFlZybNL37qyoYankw2SjXAOt2gUi48ZVihMNvXMhfsasoPLrF2JszF2OagqODMOuvtv
 V0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=05vAoVeOrdstEB55Nwy8Ge/6GUU8fE9/JUAdAnQMoes=;
 b=h5w6JuOoiwa8u9lJHynnQNDbkvxxu2TgBRcBh6MBKKnl1zthGy1BQLt1o2G0WYvfE6
 Ol8ketQlYpPxWoolyHlCgbk9tPqbCyNPEK4NRvnWaBOqhik+lqQDt8hxNZ8VO94oxhmk
 GfgOIET7JMCstxbOGTHuovTaRA9kz5MZ++Kg6DDEEAPs7hDp2lLPuDKNEIpxD0UlFCfm
 /fdZlW407G8JxK/fvt7z+LHFM/Z/zT/8J+bHq1ZVcw4hXJiG86SbWg4uaQaM/DurzIYX
 BHBfYqt1kOjUmEV4snjFm2xYcRGxTV4nLD4t6MU//kyZyJRas5jo3rWvtBtDg/SYahi9
 vrUA==
X-Gm-Message-State: APjAAAWulbizpXYdg6k8nVW9ddk34Um61mUowEQ/WVQKhqHlR5psj5Vv
 0GkZ4S7XVmZfPhk28YwRPF9oyHtft5n1M4Ss2wM=
X-Google-Smtp-Source: APXvYqyGQCpiko6U6m4v9ICZ+RgTGoOrC5pUEeXSYq+PZCCZIfUEqpLqEqICdhWCGex3lrAAOddk8kkUpIBc4MjwY9A=
X-Received: by 2002:a25:c983:: with SMTP id z125mr44014196ybf.45.1558681942222; 
 Fri, 24 May 2019 00:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <379106947f859bdf5db4c6f9c4ab8c44f7423c08.camel@kernel.org>
 <CAOQ4uxgewN=j3ju5MSowEvwhK1HqKG3n1hBRUQTi1W5asaO1dQ@mail.gmail.com>
 <20190208155052.GB20573@fieldses.org>
 <CAOQ4uxg9NGPRpMZt0KgH9HUKMRpn0dFta7EnP1WioRb917n4+A@mail.gmail.com>
 <20190208221239.GA199180@jra3>
 <CAOQ4uxjxQoCWqfp+f91--tyR81PREsssT=RV9uRgCQFs+yk7mw@mail.gmail.com>
 <20190214210652.GC9216@fieldses.org> <20190305214748.GD27437@fieldses.org>
 <20190306151150.GC2426@fieldses.org>
 <1ade4724a4e505baf7b7c23a76e44d58b931da1f.camel@kernel.org>
 <20190306210743.GE19279@jra3> <F00A0481-0AC7-411E-8353-BF104713F524@samba.org>
 <5ebdb58b-26d9-c0f2-bd67-883bc4678ac7@samba.org>
 <CAOQ4uxiBLw_L=SqCjLU6W60LbtWiLaBh=5Cb4HnSAFqCW0z1WA@mail.gmail.com>
In-Reply-To: <CAOQ4uxiBLw_L=SqCjLU6W60LbtWiLaBh=5Cb4HnSAFqCW0z1WA@mail.gmail.com>
Date: Fri, 24 May 2019 10:12:10 +0300
Message-ID: <CAOQ4uxiJQj+wvL8UxfDWe+BAD_7cmHBa5Z3L5Gv0LaDc2TKgUg@mail.gmail.com>
Subject: Re: Better interop for NFS/SMB file share mode/reservation
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 devel@lists.nfs-ganesha.org, samba-technical <samba-technical@lists.samba.org>,
 Jeff Layton <jlayton@kernel.org>, Volker.Lendecke@sernet.de,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

[dropping linux-fsdevel]

On Thu, Apr 25, 2019 at 9:11 PM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Thu, Mar 7, 2019 at 1:04 PM Stefan Metzmacher <metze@samba.org> wrote:
> >
> > Am 06.03.19 um 22:25 schrieb Ralph B=C3=B6hme via samba-technical:
> > >
> > > Jeremy Allison wrote:
> > >> On Wed, Mar 06, 2019 at 03:31:08PM -0500, Jeff Layton wrote:
> > >>> On Wed, 2019-03-06 at 10:11 -0500, J. Bruce Fields wrote:
> > >>>>
> > >>>> Jeff, wasn't there some work (on Ceph maybe?) on a userspace deleg=
ation
> > >>>> API?  Is that close to what's needed?
> > >>>>
> > >>>
> > >>> Here's the C headers for that stuff:
> > >>>
> > >>>    https://github.com/ceph/ceph/blob/7ba6bece4187eda5d05a9b84211fe6=
ba8dd287bd/src/include/cephfs/libcephfs.h#L1734
> > >>>
> > >>> It's simple enough and works for us in ganesha, and I think we can
> > >>> probably adapt it to samba without too much difficulty. The callbac=
k
> > >>> doesn't seem like it'll do for a kernel API though -- you'd almost
> > >>> certainly need to do something different there (signals? inotify?).
> > >>
> > >> SMB3 leases have R/RW and Handle-based leases.
> > >
> > > Just to be precise: SMB2.1+ has R, RH, RW and RWH leases.
> > >
> > >> Handle leases allow multiple opens of the same pathname
> > >> that get different handles to share the lease, allowing
> > >> a client redirector to delay opens or closes locally
> > >> so long as it has a handle lease.
> > >
> > > That'a a propertly of leases in general, not just H-leases. The clien=
t provides a lease key which is a GUID with each lease request
> > >
> > >>
> > >> Here are the semantics:
> > >>
> > >> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2=
/d8df943d-6ad7-4b30-9f58-96ae90fc6204
> > >>
> > >> I'm not sure a simple file-descriptor based API is
> > >> enough for us. Can he have a uuid or token based
> > >> API instead where the server can chose what fd's
> > >> to cover with a token ?
> > >
> > > Yes, that would be ideal.
>
> Getting back to this.
> Thanks all for the valuable inputs.
>
> Next week is LSF/MM and I was assigned a 30 minute slot on filesystems tr=
ack
> to discuss "NFS/SMB file share".
>
> So let me try to echo what I read on this thread and how I understand wha=
t APIs
> samba needs from the kernel.
>
> >
> > If we want to design an useful API, we also need to think about
> > all features:
> > - file oplock/leases
>
> Kernel can have a flavor of leases which are not broken
> by opens from threads of the process holding the lease.
> Bruce has some patches along those lines for knfsd and SMB R/RW
> leases could use this flavor if it was exported to userspace?
>
> For SMB RH/RWH leases and Ganesha delegations, server
> could keep track of its own handles/clients and break leases within the
> same process without involving the kernel.
> Am I wrong?
>
> > - directory leases
>
> I have WIP on fsnotify directory pre modification hooks.
> There is opposition from fsnotify maintainer to add new userspace
> APIs that can create kernel->user->kernel deadlocks, like the
> deadlocks currently reported with fanotify permission events.
>
> Need to see if we can find a middle ground between
> "post modification notifications" and "pre modification permission"
> API, somewhere along the lines of regular file lease breaking API.
>
> > - share modes
>
> Volker told me he thinks samba can enforce share modes by
> a single daemon policing all opens in the system with fanotify.
> I think he is right. If anyone thinks differently please speak up.
>
> > - disconnected handles (for durable and persistent handles),
> >   which exists within the kernel for a while and can be reattached
> >   to process, using some kind of cookie and the same euid
>
> So this interface exists in the kernel.
> Nothing more required from the kernel API. Right?
>
> > - the API needs ways to use epoll in order to do async opens
> >   and lease breaks. For opens the model of async socket connects
> >   could be used. Leases could have a signalfd-style api.
>
> I should hope that the new AIO API (http://kernel.dk/io_uring.pdf)
> would solve those problems as well as other issues that
> samba has w.r.t dispatching AIO.
>
> >
> > We may not need everything at once, but we should have the full picture
> > in mind. And we need working code in kernel and userspace that passes
> > all tests (we may need to add additional test). Otherwise the kernel
> > creates new syscalls, which wouldn't be used by Samba in the end.
> >
>
> Tested interfaces - good idea ;-)
>
> If anyone has any comments about my view of required new interfaces,
> or important things that I missed, please say so before Tuesday!
>

Hello Samba-team,

Some of you may have already seen the reports from my session at LSF/MM
on Samba/NFS interop: https://lwn.net/Articles/788335/

It should not be a surprise to anyone here to know that I have had interest=
ing
and productive conversations with NFS folks about improving samba interop.
It should not be a surprise to anyone here to know that the rest of the aud=
ience
was, generally speaking, uninterested in the problem.

Which provides a re-enforcement to the point I was trying to make in sessio=
n -
The path of least resistance for NFS-Samba interop is the communicate with
each other (both human and software wise) and try to leave VFS out of the
discussion for as much as possible (hence dropping linux-fsdevel from
this thread).

An idea that has already been thrown around is to use some samba daemon as
an arbitrator for opening files and locks. Of course, this would be an
opt-in feature
for NFS servers.

For example, can we use fanotify permission hooks to delegate access contro=
l
checks from knfsd to a daemon? Right now, the information in
permission events is
rather minimal, but as an fanotify developer, I can assure you, that
we can enrich the
information passed by knfsd on open permission events if that is deemed use=
ful.

I will be attending SambaXP, so if any of the Samba guys would like to, we =
could
find a slot in the Hallway track or at a local bar to discuss those options=
.

Thanks,
Amir.

