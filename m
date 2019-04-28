Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEFEBC0C
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2019 00:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UowcWs8y0NGAO7QnT930/knM1MIEOfa1b7WqTNQHJco=; b=VYUwBjRyXD9Ytn8uRLkJ1LQRsl
	BJDfLZj2vhVQ5Gh6lW1GLaYVtwOVG2No301AdcMXwqJVB+rVc1j5lYzxalAJXAgpnXuPqV6AY84vY
	SLw74kdRCpMAIa3nCqMBpmIdd6Q8w44bUUyRYqoQeHdcpS9aooLPWC88qpIZtrgS01mPR91TFdcR/
	+z7JAO9CkQsq9KWH5IY9pakq4OsBbKGqcPskTUcrYsFYaCPwmuIp63b10RKLHrOtTsnUFd5U260i8
	TFnKieJqZcA7s+uJTgGcPZCSE8E5rBilYIaGpnkHQ8BD5sudiEn1p8yfmySjkGT1qFtekaWIlIT10
	CwJfyPVg==;
Received: from localhost ([::1]:22604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hKrqv-003BxJ-PR; Sun, 28 Apr 2019 22:00:53 +0000
Received: from mail-yw1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:35939) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hKrqp-003BxC-IX
 for samba-technical@lists.samba.org; Sun, 28 Apr 2019 22:00:51 +0000
Received: by mail-yw1-xc2a.google.com with SMTP id g29so3066118ywk.3
 for <samba-technical@lists.samba.org>; Sun, 28 Apr 2019 15:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UowcWs8y0NGAO7QnT930/knM1MIEOfa1b7WqTNQHJco=;
 b=WUn9R0mzrF8SlWRavwbBrTw9rACo0epTaN8VpSiq10DdpdfcuH3qcWW1QKXaWWgh4P
 iDLBOlhPFHz+WkgAZ4eAR8OgotEOXRwBTG3QUSvHFz/c7etoJVTTIvv8haRg7CGX0Nd7
 xO0Q5FIulDdq7aFGs+o/PCRqO/037GhmOaIFLbnBZVVP/SA46jCOTYBaFnmCA6xQqJef
 x7ouR5i+40BHjEPipkZ/g+ZQCjSCmo9sZxRyl1caADHq/ia3qDQDIT7KcRjSzeWONmav
 m88V/eCmCUVUJ8Uv6TbkjfsnLKFPW6o50WimbloVPsHXVmE9jG8CNy64bacKfO+in7tv
 P1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UowcWs8y0NGAO7QnT930/knM1MIEOfa1b7WqTNQHJco=;
 b=OoC5+wxnIIxBREG42Pat0v2sAAwDpgPtoCY9YeopM2VnVDOitgM6xCreXSx5fwRjwF
 dbehAkmz8Vy3j3dc8E9THhsYjwbTNdaRc70ODLdgOEnRa1M1Jb4fpS/25nZRshTr9L4u
 rQ1v+AMd065OEFKaYPPpWhVC2dHkFwM1a+yXn/BmqJzayGKwXlXPAKcQ6oQG9tE9IwZA
 fZTR3i8/KFXfmu/n6spduqBU/w4GueAALDayEGRJ7z5KxHVeTf578sQ+rYYeGFHXAOfc
 ctXrrjfSalvO5k9z3gsyDn0yIOE3agaPDEYMT8ViatiB7hDAe9DX5Qc1J4b3WPeeHBlB
 U5+Q==
X-Gm-Message-State: APjAAAU+NqJoxSUC3AFE48dO7ZiEK2B5sD9CtG1ehfXpd5sOSg176j5V
 JKhF21pMV96eSrbJqFefTfkwnSDyWT2fZqriH2w=
X-Google-Smtp-Source: APXvYqxS/M/9nqsjsuAB3ssK0QulC5IuiTmzjAFxYi1glexGKAOy84GfxrWynrlQlL2q8s2rukCTOqiYnwNr5yhZfdY=
X-Received: by 2002:a0d:ff82:: with SMTP id
 p124mr50257703ywf.409.1556488844487; 
 Sun, 28 Apr 2019 15:00:44 -0700 (PDT)
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
In-Reply-To: <1d5265510116ece75d6eb7af6314e6709e551c6e.camel@hammerspace.com>
Date: Sun, 28 Apr 2019 18:00:32 -0400
Message-ID: <CAOQ4uxjUBRt99efZMY8EV6SAH+9eyf6t82uQuKWHQ56yjpjqMw@mail.gmail.com>
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
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "pshilov@microsoft.com" <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Apr 28, 2019 at 11:06 AM Trond Myklebust
<trondmy@hammerspace.com> wrote:
>
> On Sun, 2019-04-28 at 09:45 -0400, Amir Goldstein wrote:
> > On Sun, Apr 28, 2019 at 8:09 AM Jeff Layton <jlayton@kernel.org>
> > wrote:
> > > On Sat, 2019-04-27 at 16:16 -0400, Amir Goldstein wrote:
> > > > [adding back samba/nfs and fsdevel]
> > > >
> > >
> > > cc'ing Pavel too -- he did a bunch of work in this area a few years
> > > ago.
> > >
> > > > On Fri, Apr 26, 2019 at 6:22 PM Jeff Layton <jlayton@kernel.org>
> > > > wrote:
> > > > > On Fri, 2019-04-26 at 10:50 -0400, J. Bruce Fields wrote:
> > > > > > On Fri, Apr 26, 2019 at 04:11:00PM +0200, Amir Goldstein
> > > > > > wrote:
> > > > > > > On Fri, Apr 26, 2019, 4:00 PM J. Bruce Fields <
> > > > > > > bfields@fieldses.org> wrote:
> > > > > > >
> > > > > That said, we could also look at a vfs-level mount option that
> > > > > would
> > > > > make the kernel enforce these for any opener. That could also
> > > > > be useful,
> > > > > and shouldn't be too hard to implement. Maybe even make it a
> > > > > vfsmount-
> > > > > level option (like -o ro is).
> > > > >
> > > >
> > > > Yeh, I am humbly going to leave this struggle to someone else.
> > > > Not important enough IMO and completely independent effort to the
> > > > advisory atomic open&lock API.
> > >
> > > Having the kernel allow setting deny modes on any open call is a
> > > non-
> > > starter, for the reasons Bruce outlined earlier. This _must_ be
> > > restricted in some fashion or we'll be opening up a ginormous DoS
> > > mechanism.
> > >
> > > My proposal was to make this only be enforced by applications that
> > > explicitly opt-in by setting O_SH*/O_EX* flags. It wouldn't be too
> > > difficult to also allow them to be enforced on a per-fs basis via
> > > mount
> > > option or something. Maybe we could expand the meaning of '-o mand'
> > > ?
> > >
> > > How would you propose that we restrict this?
> > >
> >
> > Our communication channel is broken.
> > I did not intend to propose any implicit locking.
> > If samba and nfsd can opt-in with O_SHARE flags, I do not
> > understand why a mount option is helpful for the cause of
> > samba/nfsd interop.
> >
> > If someone else is interested in samba/local interop than
> > yes, a mount option like suggested by Pavel could be a good option,
> > but it is an orthogonal effort IMO.
>
> If an NFS client 'opts in' to set share deny, then that still makes it
> a non-optional lock for the other NFS clients, because all ordinary
> open() calls will be gated by the server whether or not their
> application specifies the O_SHARE flag. There is no flag in the NFS
> protocol that could tell the server to ignore deny modes.
>
> IOW: it would suffice for 1 client to use O_SHARE|O_DENY* to opt all
> the other clients in.
>

Sorry for being thick, I don't understand if we are in agreement or not.

My understanding is that the network file server implementations
(i.e. samba, knfds, Ganesha) will always use share/deny modes.
So for example nfs v3 opens will always use O_DENY_NONE
in order to have correct interop with samba and nfs v4.

If I am misunderstanding something, please enlighten me.
If there is a reason why mount option is needed for the sole purpose
of interop between network filesystem servers, please enlighten me.

Thanks,
Amir.

