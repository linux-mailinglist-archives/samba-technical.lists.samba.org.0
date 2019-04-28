Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F71D992
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2019 00:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zSbh5orQAOFlLCo4wlBuHnUgLykOnfmt1aJCPAp9m00=; b=j6kDWVB2O9dfzdBFZ3CGd2S2kp
	Jg6+iK6RNJrPCMJEAhuonerLuqCEDLY7bAHCLKf5bNnX8gaLmMJvGOK9RSO1OaVVcY9MBZFrNtbgT
	lxbRaqmIjSq0h7cwQO7YNb/RKVMlILd/IdYhCh0OLzuvgBNDqCiOjMaeLbcq7/cuMJgkDFJazOCP2
	D/2wcfVVpavPQzFOUA3Lm7Z8PAGThYbH5RcyYDgDanfNZ/wCY6RtXYEou9Kuz6e7a6yBrYYXYef8b
	0fPopHHHCHgWnaXrTMk513ygA+ECFRIPyNlZIRnbF8ne9kDGXYATHC3608Gbo0Iralm4oFZaZyqGu
	m96Q/QKg==;
Received: from localhost ([::1]:23354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hKsN8-003C5s-6T; Sun, 28 Apr 2019 22:34:10 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:34413) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hKsN3-003C5l-SR
 for samba-technical@lists.samba.org; Sun, 28 Apr 2019 22:34:08 +0000
Received: by mail-yb1-xb42.google.com with SMTP id a3so3170623ybr.1
 for <samba-technical@lists.samba.org>; Sun, 28 Apr 2019 15:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zSbh5orQAOFlLCo4wlBuHnUgLykOnfmt1aJCPAp9m00=;
 b=fQFRy18f1VB/uXlU7I0pAMelkAfXuxItxT6MURFdCgvIe1xEpN1oyHkilGID/duvgp
 3vspSWnKdEedAVb4wezUxa7/VekRzVDG6SqyecILPqWAZDhMum7gc4uAD4rwv66HRjNu
 wJ/lLS4YBwB6PeMU8i0KHV1uSkWruCYL95PhVgJLgrj7oWOovtKRUwslQaizYVOXJivY
 DT1jnNApxKxAkm5cnxrOyQzp5IXXF+hQr274DfaxDdFMPTZe7KZiliXUyIQ0BBDkkr4B
 yoxm6ia0PekoKqwd93mh5Kr7OM3NVsKlfg53sGH9/k22CnVuANMbkQCq0BqzLy1ch1rg
 0nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zSbh5orQAOFlLCo4wlBuHnUgLykOnfmt1aJCPAp9m00=;
 b=gSVwo0/6w7xS4AoYfCHkh7qXOXn0Xkr7Eyq/KTowW3KWG7KEcvHCzmm4TrZgxYt80q
 h9ciiMimUjCe0rWvisWPjho5RNdl0JTYtgD36fC/ocpbgAjvxY8lUH92wRx4PODjHAJ6
 FszKzN6oOLlhHn/mVMEVTialIjxzQU9T+457dKrlSzeG/AQKHskUEulDrfUOz03rc2C1
 Dlm34wC4MniGsoIwDBO7xFpVXxgUrpGOnxWPxObGNtlHYX1CsteAbZO9mk4eKYk/ZMuT
 9xH7YZ6LULoT2KMzp/GvBb1ekvmRx6r1kBULOE1MTu0bTOFHIU/Uf8MaQEoqdVKmh7rW
 fFoA==
X-Gm-Message-State: APjAAAV6F3c0AIVYad/wNnMb6xZ1w4yAr49i2uPEvUeDPUWdK7C2QdS1
 Yx68viyAoAK7W9zu79P5cH9OwutlxF7jlWGEZ0o=
X-Google-Smtp-Source: APXvYqyM1ImM7vHnV+T+6uuqe5TpK/blaQmuyE14vME947Lf0I+KXiFAXTNQPr/COlodqE46tSxRO7X1hwrwzueoGjk=
X-Received: by 2002:a25:74c9:: with SMTP id
 p192mr50431547ybc.507.1556490843819; 
 Sun, 28 Apr 2019 15:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxjQdLrZXkpP30Pq_=Cckcb=mADrEwQUXmsG92r-gn2y5w@mail.gmail.com>
 <379106947f859bdf5db4c6f9c4ab8c44f7423c08.camel@kernel.org>
 <CAOQ4uxgewN=j3ju5MSowEvwhK1HqKG3n1hBRUQTi1W5asaO1dQ@mail.gmail.com>
 <930108f76b89c93b2f1847003d9e060f09ba1a17.camel@kernel.org>
 <CAOQ4uxgQsRaEOxz1aYzP1_1fzRpQbOm2-wuzG=ABAphPB=7Mxg@mail.gmail.com>
 <20190426140023.GB25827@fieldses.org>
 <CAOQ4uxhuxoEsoBbvenJ8eLGstPc4AH-msrxDC-tBFRhvDxRSNg@mail.gmail.com>
 <20190426145006.GD25827@fieldses.org>
 <e69d149c80187b84833fec369ad8a51247871f26.camel@kernel.org>
 <CAOQ4uxjt+MkufaJWoqWSYZbejWa1nJEe8YYRroEBSb1jHjzkwQ@mail.gmail.com>
 <8504a05f2b0462986b3a323aec83a5b97aae0a03.camel@kernel.org>
 <CAOQ4uxi6fQdp_RQKHp-i6Q-m-G1+384_DafF3QzYcUq4guLd6w@mail.gmail.com>
 <1d5265510116ece75d6eb7af6314e6709e551c6e.camel@hammerspace.com>
 <CAOQ4uxjUBRt99efZMY8EV6SAH+9eyf6t82uQuKWHQ56yjpjqMw@mail.gmail.com>
 <95bc6ace0f46a1b1a38de9b536ce74faaa460182.camel@hammerspace.com>
In-Reply-To: <95bc6ace0f46a1b1a38de9b536ce74faaa460182.camel@hammerspace.com>
Date: Sun, 28 Apr 2019 18:33:52 -0400
Message-ID: <CAOQ4uxhQOLZ_Hyrnvu56iERPZ7CwfKti2U+OgyaXjM9acCN2LQ@mail.gmail.com>
Subject: Re: Better interop for NFS/SMB file share mode/reservation
To: Trond Myklebust <trondmy@hammerspace.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "pshilov@microsoft.com" <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Apr 28, 2019 at 6:08 PM Trond Myklebust <trondmy@hammerspace.com> wrote:
>
> On Sun, 2019-04-28 at 18:00 -0400, Amir Goldstein wrote:
> > On Sun, Apr 28, 2019 at 11:06 AM Trond Myklebust
> > <trondmy@hammerspace.com> wrote:
> > > On Sun, 2019-04-28 at 09:45 -0400, Amir Goldstein wrote:
> > > > On Sun, Apr 28, 2019 at 8:09 AM Jeff Layton <jlayton@kernel.org>
> > > > wrote:
> > > > > On Sat, 2019-04-27 at 16:16 -0400, Amir Goldstein wrote:
> > > > > > [adding back samba/nfs and fsdevel]
> > > > > >
> > > > >
> > > > > cc'ing Pavel too -- he did a bunch of work in this area a few
> > > > > years
> > > > > ago.
> > > > >
> > > > > > On Fri, Apr 26, 2019 at 6:22 PM Jeff Layton <
> > > > > > jlayton@kernel.org>
> > > > > > wrote:
> > > > > > > On Fri, 2019-04-26 at 10:50 -0400, J. Bruce Fields wrote:
> > > > > > > > On Fri, Apr 26, 2019 at 04:11:00PM +0200, Amir Goldstein
> > > > > > > > wrote:
> > > > > > > > > On Fri, Apr 26, 2019, 4:00 PM J. Bruce Fields <
> > > > > > > > > bfields@fieldses.org> wrote:
> > > > > > > > >
> > > > > > > That said, we could also look at a vfs-level mount option
> > > > > > > that
> > > > > > > would
> > > > > > > make the kernel enforce these for any opener. That could
> > > > > > > also
> > > > > > > be useful,
> > > > > > > and shouldn't be too hard to implement. Maybe even make it
> > > > > > > a
> > > > > > > vfsmount-
> > > > > > > level option (like -o ro is).
> > > > > > >
> > > > > >
> > > > > > Yeh, I am humbly going to leave this struggle to someone
> > > > > > else.
> > > > > > Not important enough IMO and completely independent effort to
> > > > > > the
> > > > > > advisory atomic open&lock API.
> > > > >
> > > > > Having the kernel allow setting deny modes on any open call is
> > > > > a
> > > > > non-
> > > > > starter, for the reasons Bruce outlined earlier. This _must_ be
> > > > > restricted in some fashion or we'll be opening up a ginormous
> > > > > DoS
> > > > > mechanism.
> > > > >
> > > > > My proposal was to make this only be enforced by applications
> > > > > that
> > > > > explicitly opt-in by setting O_SH*/O_EX* flags. It wouldn't be
> > > > > too
> > > > > difficult to also allow them to be enforced on a per-fs basis
> > > > > via
> > > > > mount
> > > > > option or something. Maybe we could expand the meaning of '-o
> > > > > mand'
> > > > > ?
> > > > >
> > > > > How would you propose that we restrict this?
> > > > >
> > > >
> > > > Our communication channel is broken.
> > > > I did not intend to propose any implicit locking.
> > > > If samba and nfsd can opt-in with O_SHARE flags, I do not
> > > > understand why a mount option is helpful for the cause of
> > > > samba/nfsd interop.
> > > >
> > > > If someone else is interested in samba/local interop than
> > > > yes, a mount option like suggested by Pavel could be a good
> > > > option,
> > > > but it is an orthogonal effort IMO.
> > >
> > > If an NFS client 'opts in' to set share deny, then that still makes
> > > it
> > > a non-optional lock for the other NFS clients, because all ordinary
> > > open() calls will be gated by the server whether or not their
> > > application specifies the O_SHARE flag. There is no flag in the NFS
> > > protocol that could tell the server to ignore deny modes.
> > >
> > > IOW: it would suffice for 1 client to use O_SHARE|O_DENY* to opt
> > > all
> > > the other clients in.
> > >
> >
> > Sorry for being thick, I don't understand if we are in agreement or
> > not.
> >
> > My understanding is that the network file server implementations
> > (i.e. samba, knfds, Ganesha) will always use share/deny modes.
> > So for example nfs v3 opens will always use O_DENY_NONE
> > in order to have correct interop with samba and nfs v4.
> >
> > If I am misunderstanding something, please enlighten me.
> > If there is a reason why mount option is needed for the sole purpose
> > of interop between network filesystem servers, please enlighten me.
> >
> >
>
> Same difference. As long as nfsd and/or Ganesha are translating
> OPEN4_SHARE_ACCESS_READ and OPEN4_SHARE_ACCESS_WRITE into share access
> locks, then those will conflict with any deny locks set by whatever
> application that uses them.
>
> IOW: any open(O_RDONLY) and open(O_RDWR) will conflict with an
> O_DENY_READ that is set on the server, and any open(O_WRONLY) and
> open(O_RDWR) will conflict with an O_DENY_WRITE that is set on the
> server. There is no opt-out for NFS clients on this issue, because
> stateful NFSv4 opens MUST set one or more of OPEN4_SHARE_ACCESS_READ
> and OPEN4_SHARE_ACCESS_WRITE.
>

Urgh! I *think* I understand the confusion.

I believe Jeff was talking about implementing a mount option
similar to -o mand for local fs on the server.
With that mount option, *any* open() by any app of file from
that mount will use O_DENY_NONE to interop correctly with
network servers that explicitly opt-in for interop on share modes.
I agree its a nice feature that is easy to implement - not important
for first version IMO.

I *think* you are talking on nfs client mount option for
opt-in/out of share modes? there was no such intention.

Thanks,
Amir.

