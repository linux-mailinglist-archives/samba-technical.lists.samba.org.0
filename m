Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 079E8E185
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2019 13:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zzauFw6w0jze6Zvx9vbWzqf2lqom9V1OA6Wn+IY4d7Q=; b=ggN123zAwySWF4SrW3dJNcL9nX
	8P/FjeihEVCSVzSaND8toOvbDVQN0rbHDJY/5eJ3u1dLw4ExlV/1LRVrGlw6QIO0pD9zvvRgeSilt
	H/m66Um7d5gtFata/HWDvwzpEJZ5pZ8/KvXab+sRWoamDy3djTbo2J/KCAMPcsRk4xkRm/Kt2tqHa
	FLEA/88FVOHqCywCO/7juRpESH0g5obmjpy4w0cN4adtcKi/W4hOm8s1TlhLti7k81YCUFLeLHe5I
	ckgWATqlPeVSWVe9gqxv6AhEihyVAG0qeWUmHfkesboWTtZ5PL7kfE/1zT8Pla+VIqYUk1TJQYvOq
	dWBUSB4Q==;
Received: from localhost ([::1]:58928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hL4gd-003eFx-Ad; Mon, 29 Apr 2019 11:43:07 +0000
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:43011) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hL4gT-003eFq-6S
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 11:42:59 +0000
Received: by mail-yw1-xc43.google.com with SMTP id w196so3554769ywd.10
 for <samba-technical@lists.samba.org>; Mon, 29 Apr 2019 04:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zzauFw6w0jze6Zvx9vbWzqf2lqom9V1OA6Wn+IY4d7Q=;
 b=dgfX/DB3PdboFrMNsjs01iBXLBRM2A0Iyc7upyXk5NsA/IMBwYX1omjAuNEpRUMgq2
 JABamiKitXksL8KQUUl78WCYnR3D0PIk9Bgb40s/Gq+MSms4ChNcSMB11pOvtBSrvz/S
 JWFQrwTN2RORgmTuA8DN05sXrQr2LPf+OUXuTVRIOXoMV8x56nvJ/vxayE3T21mRTU+B
 z5i6BVtT8V3cKBi9qCrOgh2hgUXLb+uE1gM5ICETWSZQ1nc8G6cbYtvgy6AAs3oHU0nO
 +b9yeq1un/ak8IaWVfPkgrPerzkp6C2cWMgtXYIUsBTm5GcIyXuoVM40nE6R5PbxzE01
 V0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzauFw6w0jze6Zvx9vbWzqf2lqom9V1OA6Wn+IY4d7Q=;
 b=hC4BgmyePAb/63VPsKwPBmAm/ON7gV6pDpxYdgQB9O6+iOznXKTWMZQouOPN4OltQR
 CwEN+iNxzVc/SAAQfTrOtGgQIFjV3DpS4zJl1/WEWwagnENXYAEpN+NendkQFb9Zt4Eo
 qgyAMbJd3dG5Uqgysn0lsalvMucz3mRgz/HU4EScYNVS05gthSKsxHzrtjhzMRiu/zo6
 647lfgt+FgqPvVrLEwHApH6HSmmQk1S/f9UrPeHQoDAQi+CO/3mZEIo8JMY/7NZiVXpY
 RJ99Zz179yeSz6tJ5Q/ry673pq+upnqNUr/pidKzgZ2ENxoRV8XsRzQ66JxZY0AYXbwy
 1stw==
X-Gm-Message-State: APjAAAUL7x3scNgKGt3qmySL+vUo9Na59spQFDRRUwTGSffWUBXaBCh7
 zvbTFMwCR0wiUBLsOIxnWYy+49e8y9abH+RhlLY=
X-Google-Smtp-Source: APXvYqzu0AEe+PuaZFACZgj15Xf/EZndsrVuIoaAss5XZYLk2avgfY0QbCAKwbPLd7cllSm6a5hE9GbsWTFZaSCn2N8=
X-Received: by 2002:a81:3bc5:: with SMTP id
 i188mr50893879ywa.404.1556538175054; 
 Mon, 29 Apr 2019 04:42:55 -0700 (PDT)
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
 <CAOQ4uxhQOLZ_Hyrnvu56iERPZ7CwfKti2U+OgyaXjM9acCN2LQ@mail.gmail.com>
 <b4ee6b6f5544114c3974790a784c3e784e617ccf.camel@hammerspace.com>
In-Reply-To: <b4ee6b6f5544114c3974790a784c3e784e617ccf.camel@hammerspace.com>
Date: Mon, 29 Apr 2019 07:42:43 -0400
Message-ID: <CAOQ4uxhkXt-71=CDwWEz0axqKi_TsEj3S_dgDhXkwNmG57T61Q@mail.gmail.com>
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

On Sun, Apr 28, 2019 at 8:57 PM Trond Myklebust <trondmy@hammerspace.com> wrote:
>
> On Sun, 2019-04-28 at 18:33 -0400, Amir Goldstein wrote:
> > On Sun, Apr 28, 2019 at 6:08 PM Trond Myklebust <
> > trondmy@hammerspace.com> wrote:
> > > On Sun, 2019-04-28 at 18:00 -0400, Amir Goldstein wrote:
> > > > On Sun, Apr 28, 2019 at 11:06 AM Trond Myklebust
> > > > <trondmy@hammerspace.com> wrote:
> > > > > On Sun, 2019-04-28 at 09:45 -0400, Amir Goldstein wrote:
> > > > > > On Sun, Apr 28, 2019 at 8:09 AM Jeff Layton <
> > > > > > jlayton@kernel.org>
> > > > > > wrote:
> > > > > > > On Sat, 2019-04-27 at 16:16 -0400, Amir Goldstein wrote:
> > > > > > > > [adding back samba/nfs and fsdevel]
> > > > > > > >
> > > > > > >
> > > > > > > cc'ing Pavel too -- he did a bunch of work in this area a
> > > > > > > few
> > > > > > > years
> > > > > > > ago.
> > > > > > >
> > > > > > > > On Fri, Apr 26, 2019 at 6:22 PM Jeff Layton <
> > > > > > > > jlayton@kernel.org>
> > > > > > > > wrote:
> > > > > > > > > On Fri, 2019-04-26 at 10:50 -0400, J. Bruce Fields
> > > > > > > > > wrote:
> > > > > > > > > > On Fri, Apr 26, 2019 at 04:11:00PM +0200, Amir
> > > > > > > > > > Goldstein
> > > > > > > > > > wrote:
> > > > > > > > > > > On Fri, Apr 26, 2019, 4:00 PM J. Bruce Fields <
> > > > > > > > > > > bfields@fieldses.org> wrote:
> > > > > > > > > > >
> > > > > > > > > That said, we could also look at a vfs-level mount
> > > > > > > > > option
> > > > > > > > > that
> > > > > > > > > would
> > > > > > > > > make the kernel enforce these for any opener. That
> > > > > > > > > could
> > > > > > > > > also
> > > > > > > > > be useful,
> > > > > > > > > and shouldn't be too hard to implement. Maybe even make
> > > > > > > > > it
> > > > > > > > > a
> > > > > > > > > vfsmount-
> > > > > > > > > level option (like -o ro is).
> > > > > > > > >
> > > > > > > >
> > > > > > > > Yeh, I am humbly going to leave this struggle to someone
> > > > > > > > else.
> > > > > > > > Not important enough IMO and completely independent
> > > > > > > > effort to
> > > > > > > > the
> > > > > > > > advisory atomic open&lock API.
> > > > > > >
> > > > > > > Having the kernel allow setting deny modes on any open call
> > > > > > > is
> > > > > > > a
> > > > > > > non-
> > > > > > > starter, for the reasons Bruce outlined earlier. This
> > > > > > > _must_ be
> > > > > > > restricted in some fashion or we'll be opening up a
> > > > > > > ginormous
> > > > > > > DoS
> > > > > > > mechanism.
> > > > > > >
> > > > > > > My proposal was to make this only be enforced by
> > > > > > > applications
> > > > > > > that
> > > > > > > explicitly opt-in by setting O_SH*/O_EX* flags. It wouldn't
> > > > > > > be
> > > > > > > too
> > > > > > > difficult to also allow them to be enforced on a per-fs
> > > > > > > basis
> > > > > > > via
> > > > > > > mount
> > > > > > > option or something. Maybe we could expand the meaning of
> > > > > > > '-o
> > > > > > > mand'
> > > > > > > ?
> > > > > > >
> > > > > > > How would you propose that we restrict this?
> > > > > > >
> > > > > >
> > > > > > Our communication channel is broken.
> > > > > > I did not intend to propose any implicit locking.
> > > > > > If samba and nfsd can opt-in with O_SHARE flags, I do not
> > > > > > understand why a mount option is helpful for the cause of
> > > > > > samba/nfsd interop.
> > > > > >
> > > > > > If someone else is interested in samba/local interop than
> > > > > > yes, a mount option like suggested by Pavel could be a good
> > > > > > option,
> > > > > > but it is an orthogonal effort IMO.
> > > > >
> > > > > If an NFS client 'opts in' to set share deny, then that still
> > > > > makes
> > > > > it
> > > > > a non-optional lock for the other NFS clients, because all
> > > > > ordinary
> > > > > open() calls will be gated by the server whether or not their
> > > > > application specifies the O_SHARE flag. There is no flag in the
> > > > > NFS
> > > > > protocol that could tell the server to ignore deny modes.
> > > > >
> > > > > IOW: it would suffice for 1 client to use O_SHARE|O_DENY* to
> > > > > opt
> > > > > all
> > > > > the other clients in.
> > > > >
> > > >
> > > > Sorry for being thick, I don't understand if we are in agreement
> > > > or
> > > > not.
> > > >
> > > > My understanding is that the network file server implementations
> > > > (i.e. samba, knfds, Ganesha) will always use share/deny modes.
> > > > So for example nfs v3 opens will always use O_DENY_NONE
> > > > in order to have correct interop with samba and nfs v4.
> > > >
> > > > If I am misunderstanding something, please enlighten me.
> > > > If there is a reason why mount option is needed for the sole
> > > > purpose
> > > > of interop between network filesystem servers, please enlighten
> > > > me.
> > > >
> > > >
> > >
> > > Same difference. As long as nfsd and/or Ganesha are translating
> > > OPEN4_SHARE_ACCESS_READ and OPEN4_SHARE_ACCESS_WRITE into share
> > > access
> > > locks, then those will conflict with any deny locks set by whatever
> > > application that uses them.
> > >
> > > IOW: any open(O_RDONLY) and open(O_RDWR) will conflict with an
> > > O_DENY_READ that is set on the server, and any open(O_WRONLY) and
> > > open(O_RDWR) will conflict with an O_DENY_WRITE that is set on the
> > > server. There is no opt-out for NFS clients on this issue, because
> > > stateful NFSv4 opens MUST set one or more of
> > > OPEN4_SHARE_ACCESS_READ
> > > and OPEN4_SHARE_ACCESS_WRITE.
> > >
> >
> > Urgh! I *think* I understand the confusion.
> >
> > I believe Jeff was talking about implementing a mount option
> > similar to -o mand for local fs on the server.
> > With that mount option, *any* open() by any app of file from
> > that mount will use O_DENY_NONE to interop correctly with
> > network servers that explicitly opt-in for interop on share modes.
> > I agree its a nice feature that is easy to implement - not important
> > for first version IMO.
> >
> > I *think* you are talking on nfs client mount option for
> > opt-in/out of share modes? there was no such intention.
> >
>
> No. I'm saying that whether you intended to or not, you _are_
> implementing a mandatory lock over NFS. No talk about O_SHARE flags and
> it being an opt-in process for local applications changes the fact that
> non-local applications (i.e. the ones that count ) are being subjected
> to a mandatory lock with all the potential for denial of service that
> implies.
> So we need a mechanism beyond O_SHARE in order to ensure this system
> cannot be used on sensitive files that need to be accessible to all. It
> could be an export option, or a mount option, or it could be a more
> specific mechanism (e.g. the setgid with no execute mode bit as using
> in POSIX mandatory locks).
>

I see. Thanks for making that concern clear.

If server owner wishes to have samba/nfs interop obviously
server owner should configure both samba and nfs for interop.
nfs should thus have it configurable via export options IMO
and not via mount option (server's responsibility).

Preventing O_DENY_X on a certain file... hmm
We can do that but, if nfs protocol has O_DENY what's the
logic that we would want to override it?
What we need is a way to track, blame the resource holder and
release the resource administratively.

For that matter, assuming the nfsd and smbd (etc) can contain
their own fds without leaking them to other modules (minus bugs)
then provided with sufficient sysfs/procfs info (i.e. Bruce's new open
files tracking), admin should be able to kill the offending nfs/smb client
to release the hogged file.

I believe that is the Windows server solution to the DoS that is implied
from O_DENY.

Thanks,
Amir.

