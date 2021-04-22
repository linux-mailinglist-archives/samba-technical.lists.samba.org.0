Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E0367CF0
	for <lists+samba-technical@lfdr.de>; Thu, 22 Apr 2021 10:53:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=E6EpTbV4YpVnD6sECfFyI27bmZjriPFxtg3msdTU9yI=; b=lzGiK68F0vXIoGu1de62ZZxIp9
	J39GvSfHxBxh7wdvIuYQfuT6eDgr4pyW8Uow4/uqEMMpSw6tCwZ1HMZygm4LhYamf013/Ab3WmRYr
	9RtSzOw4NntrsnqvW2jBwKmz+xiNTuV7gd2f4oVYIrdXx1tJrVy/S1JMPagh7qGgjmtREjFaqg/qb
	3htKWGJuXjNzd54GMvIKkHPCu1GaecorxD3lPYI6T3BhZNYWEobohwT+x1I2Xjqqy+rrQk47iYIxZ
	NgCDxrA1uTkKHWnNqOYPlcefd/uxwioCZ6i1t+WmsyoBbFRJAneiG2wceIJu9PrnP4xS0QWsGicjl
	QJ/AlWvQ==;
Received: from ip6-localhost ([::1]:59992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lZV48-00C4BE-2F; Thu, 22 Apr 2021 08:52:04 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:38872) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lZV43-00C4B6-04
 for samba-technical@lists.samba.org; Thu, 22 Apr 2021 08:52:01 +0000
Received: by mail-io1-xd2a.google.com with SMTP id q25so1331209iog.5
 for <samba-technical@lists.samba.org>; Thu, 22 Apr 2021 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E6EpTbV4YpVnD6sECfFyI27bmZjriPFxtg3msdTU9yI=;
 b=ginByRBGSL3zAfXTU6AMkr68s25pX+8loUKak9GY0OfcoPweKG/zlYLNaJP604MF6r
 BOgSBjQdsT2OX7X0z6i0Q0d+U8/1K7gWSy294nx3G+9+ztGk+zLz1ikStU2DzWwnt/XE
 nAaw5H5AEeOOUTexbFnqJtu37IZ9tYnCzsyoS0nOQRWKaV4LRoU3eYMnlEjANEKs1Ydy
 TB1cNzQXif+HJFvZdlaDdYq3E+99YqGSV/YsFOhRtOis1zL7IhxQ+Ni/EvDIDDWwh5jd
 KH1luk+WGnKe5c7osggwp9vc8w8cwl38nmmBL5cnaIukQ4n5MYjmagoo0gPW8U+ehUQD
 VFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E6EpTbV4YpVnD6sECfFyI27bmZjriPFxtg3msdTU9yI=;
 b=M+dblgZu5VoWYqnOZyXOzkqDqIy83B9dqt7aUoEvD9VtzN+95YygmpJTHMc3RORXRT
 Y1Oql9bp0S/QwOMwTf9a9szrj2YrRGdgpkDezt2s4ktdrOVd2qkhPYuBSgoYh+JgP8Wi
 aKMn2FSMDyQCluf9nN6eRMhkS8mcid7n0lOwOo95zlnKXlqAv/ZIzVVc1oTwB3p2dyaI
 NQ3JeOQPjMhpiygSchzbFXn1Wqe/qxbMJWNEZe9d1outOk9MPOvWb1tywSqLOVCfAI4y
 kdSRMLMzQTwVkzrDwGvmEBPoHodeNc26D3Fsx8UIN6rVVWUAS/82DnKQ7QgBasG2PkHJ
 o9UQ==
X-Gm-Message-State: AOAM532uxN25X2u9VXcTFBm8UT5pabcOkSkcJEMfhPLGg1YSecCj/cA5
 NGB59sa00TaX4s5uDoJ2wlvlbOptkgkKXzyAl2g=
X-Google-Smtp-Source: ABdhPJwrSQM3KHKdjhfNgd60IwHZTdQsSX1zlvPX6sgCeNlrkyb2AwunN9aq1aafaxy7AM5pITynMUIhXLTj6E7r4mo=
X-Received: by 2002:a6b:d213:: with SMTP id q19mr1870613iob.203.1619081516430; 
 Thu, 22 Apr 2021 01:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210422003836epcas1p391ed30aed1cf7b010b93c32fc1aebe89@epcas1p3.samsung.com>
 <20210422002824.12677-1-namjae.jeon@samsung.com>
 <20210422002824.12677-2-namjae.jeon@samsung.com>
 <CAOQ4uxgCJukhh9c0FjnP_CR0=Jpj+ObK1JPFVjsD4=oxuakcaw@mail.gmail.com>
 <02f001d7374f$27a667c0$76f33740$@samsung.com>
In-Reply-To: <02f001d7374f$27a667c0$76f33740$@samsung.com>
Date: Thu, 22 Apr 2021 11:51:45 +0300
Message-ID: <CAOQ4uxg7Xc21mkc8kgr1t-GpFHghLOZN6zbpST1GLvrH7vU9LQ@mail.gmail.com>
Subject: Re: cifsd/nfsd interop
To: Namjae Jeon <namjae.jeon@samsung.com>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: Jeff Layton <jlayton@kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, senozhatsky@chromium.org,
 samba-technical <samba-technical@lists.samba.org>,
 Randy Dunlap <rdunlap@infradead.org>, Eric Sandeen <sandeen@sandeen.net>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 Hyunchul Lee <hyc.lee@gmail.com>, Steve French <smfrench@gmail.com>,
 Volker Lendecke <Volker.Lendecke@sernet.de>,
 Colin King <colin.king@canonical.com>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

[re-posting for samba-technical with shorter CC list]

On Thu, Apr 22, 2021 at 11:11 AM Namjae Jeon <namjae.jeon@samsung.com> wrote:
>
> >
> > On Thu, Apr 22, 2021 at 4:31 AM Namjae Jeon <namjae.jeon@samsung.com> wrote:
> > >
> > > This adds a document describing ksmbd design, key features and usage.
> > >
> > > Signed-off-by: Namjae Jeon <namjae.jeon@samsung.com>
> > > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> > > Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> > > Acked-by: Ronnie Sahlberg <lsahlber@redhat.com>
> > > Signed-off-by: Steve French <stfrench@microsoft.com>
> > > ---
> > >  Documentation/filesystems/cifs/cifsd.rst | 152
> > > +++++++++++++++++++++++  Documentation/filesystems/cifs/index.rst |  10 ++
> > >  Documentation/filesystems/index.rst      |   2 +-
> > >  3 files changed, 163 insertions(+), 1 deletion(-)  create mode 100644
> > > Documentation/filesystems/cifs/cifsd.rst
> > >  create mode 100644 Documentation/filesystems/cifs/index.rst
> > >
> > > diff --git a/Documentation/filesystems/cifs/cifsd.rst
> > > b/Documentation/filesystems/cifs/cifsd.rst
> > > new file mode 100644
> > > index 000000000000..cb9f87b8529f
> > > --- /dev/null
> > > +++ b/Documentation/filesystems/cifs/cifsd.rst
> > > @@ -0,0 +1,152 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +==========================
> > > +CIFSD - SMB3 Kernel Server
> > > +==========================
> > > +
> > > +CIFSD is a linux kernel server which implements SMB3 protocol in
> > > +kernel space for sharing files over network.
> > > +
> >
> > Hello cifsd team!
> Hi Amir,
> >
> > I am very excited to see your work posted and especially excited to learn about the collaboration with
> > the samba team.
> Thanks!
> >
> > One of the benefits from kernel smbd implementation is improved ability to interoperate with VFS in
> > general and nfsd in particular.
> Agreed. This seems to be an important issue, I was missing this.
> >
> > For example, I have discussed with several samba team members the option that ksmbd will serve as a
> > kernel lease agent for samba, instead of having to work around the limitations of file lock UAPI.
> >
> > Could you share your plans (if any) for interoperability improvements with vfs/nfsd?
> >
> > It would be useful to add an "Interop" column to the Features table below to document the current
> > state and future plans or just include a note about it in the Status column.
> Okay, First, I need to check your previous mails about this. Then I will update it in features table.
> >
> > Off the top of my head, a list of features that samba supports partial kernel/nfsd interop with are:
> > - Leases (level 1)
> > - Notify
> > - ACLs (NT to POSIX map)
> > - Share modes
> >
> > In all of those features, ksmbd is in a position to do a better job.
> Right.
> >
> > I only assume that ksmbd implementation of POSIX extensions is a "native" implementation (i.e. a
> > symlink is implemented as a symlink) so ksmbd and nfsd exporting the same POSIX fs would at least
> > observe the same objects(?), but I would rather see this explicitly documented.
> Okay.
> >
> > Thanks,
> Thank you!
> > Amir.
> >
> > [...]
> >
> > > +
> > > +CIFSD Feature Status
> > > +====================
> > > +
> > > +============================== =================================================
> > > +Feature name                   Status
> > > +============================== =================================================
> > > +Dialects                       Supported. SMB2.1 SMB3.0, SMB3.1.1 dialects
> > > +                               excluding security vulnerable SMB1.
> > > +Auto Negotiation               Supported.
> > > +Compound Request               Supported.
> > > +Oplock Cache Mechanism         Supported.
> > > +SMB2 leases(v1 lease)          Supported.
> > > +Directory leases(v2 lease)     Planned for future.
> > > +Multi-credits                  Supported.
> > > +NTLM/NTLMv2                    Supported.
> > > +HMAC-SHA256 Signing            Supported.
> > > +Secure negotiate               Supported.
> > > +Signing Update                 Supported.
> > > +Pre-authentication integrity   Supported.
> > > +SMB3 encryption(CCM, GCM)      Supported.
> > > +SMB direct(RDMA)               Partial Supported. SMB3 Multi-channel is required
> > > +                               to connect to Windows client.
> > > +SMB3 Multi-channel             In Progress.
> > > +SMB3.1.1 POSIX extension       Supported.
> > > +ACLs                           Partial Supported. only DACLs available, SACLs is
> > > +                               planned for future. ksmbd generate random subauth
> > > +                               values(then store it to disk) and use uid/gid
> > > +                               get from inode as RID for local domain SID.
> > > +                               The current acl implementation is limited to
> > > +                               standalone server, not a domain member.
> > > +Kerberos                       Supported.
> > > +Durable handle v1,v2           Planned for future.
> > > +Persistent handle              Planned for future.
> > > +SMB2 notify                    Planned for future.
> > > +Sparse file support            Supported.
> > > +DCE/RPC support                Partial Supported. a few calls(NetShareEnumAll,
> > > +                               NetServerGetInfo, SAMR, LSARPC) that needed as
> > > +                               file server via netlink interface from
> > > +                               ksmbd.mountd.
> > > +==============================
> > > +=================================================
> > > +
>

