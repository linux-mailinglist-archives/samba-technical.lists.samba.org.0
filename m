Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC7294D3D3
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2024 17:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KSX5z71Ic2mcCJIyuQl3/ERa/3iXO0QhvWRXQN2FvGY=; b=2r62kaqUHKyPWbqo0riA1FS0/B
	EYAq+R3mt4P4EqKVC8jZn8OvXuH9o/ev5CwapEmbYlHU5c2pViEB9jGOKmY2GQdCGh/lQgShZRgcd
	3I3/1zppnBz/taHhxF+/3H6ZZtGHM+G8rRkUGONO9najQ+p5HFMzQcboli7uWBZacHDQnu4ctbB2q
	u/JI1J5eCjtUHc4QIoW17+oVuLCHb+eCNuug+Gbytqi9bqRtbvedlh+ipgFhaJJ/FLaghVPsivmoX
	W7OVYA7+5DOsN5Ti1LzgnMjNrguGLscn/nZwyqJdnoSFIhe30QkUnKEEeSFst59Ug5Pdtpspro/EW
	yC7lZpuQ==;
Received: from ip6-localhost ([::1]:37966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1scRlK-004GpV-SE; Fri, 09 Aug 2024 15:42:42 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:51624) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1scRlG-004GpO-Ce
 for samba-technical@lists.samba.org; Fri, 09 Aug 2024 15:42:40 +0000
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52f025bc147so2599164e87.3
 for <samba-technical@lists.samba.org>; Fri, 09 Aug 2024 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723218157; x=1723822957; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSX5z71Ic2mcCJIyuQl3/ERa/3iXO0QhvWRXQN2FvGY=;
 b=ll/ma90boj3qe1c8QIrwdTJE2cu4Pmz5ftIPEtgoJ81xQyERc8i0oC9U6Jb9px1DHi
 ew07bpoMv/ayWGwqFB0P2yjcbp+4jdOhXv3QvnJzz7yHQnOIPQ8RMWsHdRadsDwCWCe2
 +kuchOKuewse1R8w2aZGOo4DLCDqCd/5pG+HbMxEpK0C7Dv73q9GTTbtjUIe6XSQaAV1
 TTsp6A9Ldr/Oo3Mng3zWehbRzLD3/jN66amed3hQ+N8ZMsOpKP15IMop+R8C/GacMY7Y
 xDSM9d/JBBJ4698a/jrLmCHiZfxUeiWlNTZ1OOhFau959D7bBRpUBpT0mAUOA6RGbD6l
 Ioeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723218157; x=1723822957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSX5z71Ic2mcCJIyuQl3/ERa/3iXO0QhvWRXQN2FvGY=;
 b=smCP6HyzoYvORMDcKhDJuWRUWOBA56l56JSxbc2K1qiqq2RRNFPOu/+cGX3XUz0tJw
 ezEXQSWyxi58oRDo82mhgrYI9GJhLSNThgk2VcNUF46SMmwNUaehxpZQRKPrsuzjePF/
 22Qqhh0/dHkITpfyJEPHXozo8Ep+VapyyaXvtGNtFel/6pyCTLnyT2K17LBySTSoo86j
 bL0TleLOWBDM5HtxFHUy41FcFJ8RzzK3w+UD7TbbMZ5Q5+BvFGaLPpPE4NSRuN8q6Mlo
 JHg86vnPRdVecU9S7HO46JAEvQOuW62WlQjXCfM87DXBTjxJlnDJMxtVkS6hC+xfjTX5
 WdUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU22Vr4006HwQF24FmXCyANx4R5nj553BkImxpAGaEZTKG6NVfw7+g0SawkKAXhMAneQ1R2aiCxRZlkVF7YuiEBzUqSzYre7uBgExEhDjGG
X-Gm-Message-State: AOJu0Yy3ailM5ZoYKSLeGOXEKjzlWW4NkPPxCBvFNrup+DrKzQ6AhkIn
 EsgQgQEyI8vnI4InzcnmBOr/kxokRUBjJ4hpEo+VwtCI4wUwJBjNFh1bL5fjUojeHymxJtPH3hN
 MB6RvORmLKKvLQDHZkf/HxQwXtXo=
X-Google-Smtp-Source: AGHT+IFf3tUCbIQMHNGwguaQ9im7C6T8tOEzS58zEtUlzxRikiSdKkWG25I/i2K77g4pYlFNNJcS+X4cmA9+McJ8CNw=
X-Received: by 2002:a05:6512:3d8a:b0:52e:f2a9:b21a with SMTP id
 2adb3069b0e04-530ee97a165mr1351764e87.19.1723218156526; Fri, 09 Aug 2024
 08:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240808122331.342473-1-suhui@nfschina.com>
 <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
 <a08c6b03-6d23-4711-a891-14b0250b90be@stanley.mountain>
In-Reply-To: <a08c6b03-6d23-4711-a891-14b0250b90be@stanley.mountain>
Date: Fri, 9 Aug 2024 10:42:25 -0500
Message-ID: <CAH2r5msS8_Jc0hRXqY==OGiaoJKyjqkh7HT0esSKcEvsxht46Q@mail.gmail.com>
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in
 cifs_free_subrequest()
To: Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: pc@manguebit.com, sfrench@samba.org, sprasad@microsoft.com,
 llvm@lists.linux.dev, Su Hui <suhui@nfschina.com>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 nathan@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, bharathsm@microsoft.com, tom@talpey.com,
 morbo@google.com, justinstitt@google.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 9, 2024 at 10:11=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Fri, Aug 09, 2024 at 06:00:26PM +0300, Dan Carpenter wrote:
> > On Thu, Aug 08, 2024 at 08:23:32PM +0800, Su Hui wrote:
> > > Clang static checker (scan-build) warning:
> > >     cifsglob.h:line 890, column 3
> > >     Access to field 'ops' results in a dereference of a null pointer.
> > >
> > > Commit 519be989717c ("cifs: Add a tracepoint to track credits involve=
d in
> > > R/W requests") adds a check for 'rdata->server', and let clang throw =
this
> > > warning about NULL dereference.
> > >
> > > When 'rdata->credits.value !=3D 0 && rdata->server =3D=3D NULL' happe=
ns,
> > > add_credits_and_wake_if() will call rdata->server->ops->add_credits()=
.
> > > This will cause NULL dereference problem. Add a check for 'rdata->ser=
ver'
> > > to avoid NULL dereference.
> > >
> > > Signed-off-by: Su Hui <suhui@nfschina.com>
> >
> > Needs a Fixes tag.
> >
> > Also when you add a Fixes tag, then get_maintainer will add the David H=
owells
> > automatically.  I've added him manually.
> >
>
> Actually, David should have been CC'd but the fixes tag wouldn't have poi=
nted
> to his patch.
>
> This is an inconsistent NULL checking warning.  It's not clear to me if t=
he NULL
> checks should be removed or more added.  If David were trying to fix a NU=
LL
> pointer dereference and accidentally left one unchecked dereference out t=
hen the
> Fixes tag would point to his patch.  Since David was doing something unre=
lated

Looks like (if this is even possible for server to to be null) then I
will need to change
the fixes to commit 69c3c023af25. I will update the tag in the current
patch in for-next

Author: David Howells <dhowells@redhat.com>
Date:   Fri Oct 6 18:16:15 2023 +0100

    cifs: Implement netfslib hooks

    Provide implementation of the netfslib hooks that will be used by netfs=
lib
    to ask cifs to set up and perform operations.
--=20
Thanks,

Steve

