Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 899002C5E86
	for <lists+samba-technical@lfdr.de>; Fri, 27 Nov 2020 02:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tzMcP5Im5oWNhSK5rNun4lchkl6De7Kl4cYKLEDYAcM=; b=OoewvI/qH4SyvvtAPMn+lefy5v
	rDu/52UjTzAoU4Nx1jV36wbz7vOLkcBptehPYW0Re/f84g8SO/Z6Jah3FMttOPWIYRFwQZJ6KNDH/
	e+EsEM+rtgDKT+GdrkfJMAK44ktTTIorVWYZ74owybgL2v8vAhUl218BBZYkSp38JftWD+M5UvS/P
	jITfq5gegd8+BlTkno4/1t+idWEAusCa8BSvryYmso22HcLznERt4ini+57gHEfdm894B9HjKgcLF
	dWap5O9LDFqCD9vmrhfTJWhAwvG9mWuwxumWwwTjE2p9TPHeNQRvRRdoxkOHOxk6pGH1HqsFp/Oi7
	2C2chIwA==;
Received: from ip6-localhost ([::1]:49920 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kiSJ0-002sSo-15; Fri, 27 Nov 2020 01:12:10 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45399) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kiSIr-002sSh-9t
 for samba-technical@lists.samba.org; Fri, 27 Nov 2020 01:12:04 +0000
Received: by mail-ed1-x533.google.com with SMTP id q3so4016306edr.12
 for <samba-technical@lists.samba.org>; Thu, 26 Nov 2020 17:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pHupnjQNevXvfhhMjpu/SSbURz8ndJ9YHTF9LzGWTTE=;
 b=GRjqFCzUkD+5d3gQ5ZI17sqhsKEBSeVzD4b0a9Y84Z2+ZuLy3nsYXHpLOMR1iQ8GRh
 M4auT+5+Yd2cxweRIj0GP/gjSWLOOEMh4sFHYVK+bhQOGolOm6Rbbh/QQezK5R8fk1fP
 J6SwqPTR/Q7RHG5fqEgFu+RswNh6gXWypJbPXtimfB6OlMslicl38uA/1urNqL30E5wM
 5kPCOGuCGBtWb9I6zFl+YaOx7+W546tp63OUGDIhEqZjVUEWhd1cdAwbIz97wzGEhsvg
 oXJ7DxpXdYGo2+c08uroeY5VFc9URxIT3T/5Yje0o33S4nw3BXgfwRJAu6h8v+lBrS4f
 9mYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pHupnjQNevXvfhhMjpu/SSbURz8ndJ9YHTF9LzGWTTE=;
 b=cdg0VYqdIdExVsrV35d4eL2LX0Jh+DhfFdrHup04l5yKvG1Qfi+FnXZcqkJnPEYd29
 LgwTzaNXCFini+RJ7ANim16hTNWavkqt4e7vbaO0/LoSpXc1zV0Z3xakKqh8sACyodT8
 OxsyzmxoVjx7PsRm811GUXxcThuXkfmCSfr6PL0ZyAEWn4wrrPITKsE5EOkpbysyQXjF
 Qj4VE8g7HvBJNFZ1hmq0anH4ypdOO94uASlCFcgGoAqD+yjbXMsAtFfImv0lvTx8KKlA
 TRW/7jR4tCW+/5/mQ8YdCBtSWVuKY8cTA/b7Mm0bQU26gCVcovJ3GPRg/ezs5oB3mg2d
 oZ9w==
X-Gm-Message-State: AOAM530ucuYL4onv0uqEujEmm8VaY9phpwQNumFD+DMrU9UUi34iVyq2
 61ixMZVUbKsW86rg1kllhCs32iTjd/gPK8VkrWN5DQ==
X-Google-Smtp-Source: ABdhPJwwmVLLmxoOPeCo5UNAigoe7/vV/cJ5xyBoW9vPdh993nDRLJabKZDt1BfPksSvBOzE9kkRnj9+1whUvWhW+s0=
X-Received: by 2002:aa7:d459:: with SMTP id q25mr5259049edr.104.1606439518121; 
 Thu, 26 Nov 2020 17:11:58 -0800 (PST)
MIME-Version: 1.0
References: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
 <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
 <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
In-Reply-To: <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
Date: Thu, 26 Nov 2020 20:11:47 -0500
Message-ID: <CAB5c7xrF9uSQ6PwyojwAUiCK_H7-p-Lvtsj88OZ4BQSRuCWS3g@mail.gmail.com>
Subject: Re: about "ea support" parameter
To: Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: Albert Guo <aguo@vmware.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Leo Fan <xfan@vmware.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 26, 2020 at 5:30 AM Ralph Boehme via samba-technical <
samba-technical@lists.samba.org> wrote:

> Am 11/26/20 um 10:57 AM schrieb Leo Fan via samba-technical:
> > Hi samba experts,
> >
> > I need your help to understand the smb.conf parameter =E2=80=98ea suppo=
rt=E2=80=99.
> > We are developing a customized samba service to serve Windows 10
> > clients and MAC OS clients. And, we would like to set =E2=80=98EA suppo=
rt =3D
> > no=E2=80=99 to gain more performance of =E2=80=98dir=E2=80=99 command e=
specially on the large
> > directory, but as smb.conf doc says, EA support disablement will
> > impact Windows file service compatibility.
> >
> > The default has changed to yes in Samba release 4.9.0 and above to
> > allow better Windows fileserver compatibility in a default install.
>
> To give you some background: that change untangled the previous mixture
> of configuring both SMB level behaviour *and* backend storage behaviour.
> Nowadays this parameter only configures the SMB level behaviour, ie if
> we support EAs in the protocol. There are various ways a client get
> list, get and set EAs over SMB, by setting "ea support =3D no" all of
> those will fail with an error, probably NT_STATUS_NOT_SUPPORTED.
>
> However, if when setting "ea support =3D no" Samba will still use xattrs
> in the backend as storage for various bits and pieces like DOS
> attributes, creation date, ACLs and so on.
>
> > I am not quite clear about compatibility problem with EA support
> > disablement, and have some questions:
> >
> >
> > 1.  In which scenarios will there be windows file service
> > compatibility?
>
> As explained above, you disable something which a Windows server
> supports. Hell may brake loose or you may never notice a difference in
> client behaviour, you never know.
>
> > 2.  How do we create and use EA?
>
> There are various SMB info level to get and set them, cf MS-FSA/MS-FSCC.
>
> > 3.  Does any well-known Windows/MAC application use EA?
>
> I'm not aware of any.
>
Windows Subsystem For Linux uses them, but unsure of implications over SMB
protocol (haven't looked into it). IIRC, Illumos disables EA support by
default in their SMB server implementation for performance reasons for
directory listing.

https://docs.microsoft.com/en-us/windows/wsl/file-permissions
