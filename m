Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF88B1DFC8
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 01:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CbY4WZ+7o9lSfwvHTfItfVyp4xvraMt9Ugx5QarC7xU=; b=GRZDmEMKHcqfJwGa0SLWcB14rR
	dqt3FkvIfgFn6N42i1/o+iiivXm+f1dsoEQJGgODJ7kI4uNfECGhZUNA2T4h7dEJvxjphKjeLzLwf
	UGOj5RaG3+nugypA/94zNX/TLoiSwT29aP+TxTE5Zh/X9Q6RQK96lZ/PPy7emd7NhFw4KlSLXyMZ2
	1OKJC+zlwjZcC/ThR9JPJSte6Gc7HGKmPpY4LH929eVi0eRN/ZMSfrTbto2ZO68bc2Q7nPUhaDtj+
	G3lDPqPFueqgK/TijojdJiOiBXkDp+9UEhZvw2drEGGw+LRSq+G+1i+YES/UNiR2AnlivdwFTUPci
	S2wz4YmQ==;
Received: from ip6-localhost ([::1]:41018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk9vP-00Eczt-BY; Thu, 07 Aug 2025 23:21:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:48200) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk9vL-00Eczm-O8
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 23:21:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5301C41937
 for <samba-technical@lists.samba.org>; Thu,  7 Aug 2025 23:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332E9C4CEEB
 for <samba-technical@lists.samba.org>; Thu,  7 Aug 2025 23:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754608882;
 bh=CbY4WZ+7o9lSfwvHTfItfVyp4xvraMt9Ugx5QarC7xU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WbdbtJQxPYro7btYQqtsdLT03q4AdFutNlquP3le/wUfrX2/UyC78Eywua04EcaLB
 bM2PMbPIbqjyUqH7s8DfRpeqEgTLx6yP07VJr1GZOYUarS/yStZixTJdOMb0WHlY9l
 DCJzrTRaR3q/5kXMJy5wTBeqN24zrfM7ojjTBAbpeLHeLpkKLrzFmhjgnfU961MLwO
 l+uX9HrGvKtCy2rPcCkSYbDdK+qsnP95ybj749N8mc9iUSC75rAqfYKEdOWUTW2HVX
 j0XoFThi1nnHzEn0k86ThCS2yQD9oFoDup0Oz2bR+xwgQeVq1Sc5KRVhpTzW0bC6by
 VhFi1wTIv+85A==
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-af96d097df5so291853866b.3
 for <samba-technical@lists.samba.org>; Thu, 07 Aug 2025 16:21:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9RCt3aqBfvxyuXWsPYs/nFQhG5RdPw+JlrvSX5hRV/bXpC0xT/bosUElV8SvwfH/Qwc+hfpJN0F5zBCkzQfk=@lists.samba.org
X-Gm-Message-State: AOJu0Yy9bdwoMX1Yz/Sudqo2gQ5SZff4pUqekAuxL79GSZISVOLEaP7l
 c7aJVXaVGrEot7ghZGyn11Qt0RDutQI6PPRMjadibp4aca9pZ25jfh5MgqP6Ae/vaTVg05XDDPi
 9sRMaGMX/oFQbYQBqVqgKamOHmCP9feg=
X-Google-Smtp-Source: AGHT+IG+9rdH+c8Ws1CrtllYip+mf38sZjiJ4K2/UsYa3tzgrKexpidjUlURX2/WEaS/Grpex/1kOVrIEs1aC3d3EWM=
X-Received: by 2002:a17:907:7f9e:b0:af9:5e9a:b6a with SMTP id
 a640c23a62f3a-af9c65b04eamr55544466b.42.1754608880767; Thu, 07 Aug 2025
 16:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754501401.git.metze@samba.org>
 <ea27f558-ab35-4607-b8a3-480c9ca4c6c3@samba.org>
 <CAH2r5mvA7CWGR0cDn0DrxvMXdcmcJru1nOKPr1FD=rANPyYTHA@mail.gmail.com>
In-Reply-To: <CAH2r5mvA7CWGR0cDn0DrxvMXdcmcJru1nOKPr1FD=rANPyYTHA@mail.gmail.com>
Date: Fri, 8 Aug 2025 08:21:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_j475c5Njw2BQpLaKwJrgmM7QuE1tswCKJiRaRNBQUqg@mail.gmail.com>
X-Gm-Features: Ac12FXwVmJk-GeEA671vNc7xAqRnwQWlRTFBWpFyP3qI45IZ8p4txOtHogzXmfk
Message-ID: <CAKYAXd_j475c5Njw2BQpLaKwJrgmM7QuE1tswCKJiRaRNBQUqg@mail.gmail.com>
Subject: Re: [PATCH 00/18] smb: smbdirect: more use of common structures e.g.
 smbdirect_send_io
To: Steve French <smfrench@gmail.com>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Stefan Metzmacher <metze@samba.org>, linux-cifs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 7, 2025 at 5:21=E2=80=AFAM Steve French <smfrench@gmail.com> wr=
ote:
>
> tentatively merged those 7 additional small patches into cifs-2.6.git
> for-next pending more review and testing.
Could you apply ksmbd smbdirect patches from Metze to for-next branch also =
?
Thanks.
>
> On Wed, Aug 6, 2025 at 12:41=E2=80=AFPM Stefan Metzmacher <metze@samba.or=
g> wrote:
> >
> > Am 06.08.25 um 19:35 schrieb Stefan Metzmacher via samba-technical:
> > > Hi,
> > >
> > > this is the next step towards a common smbdirect layer
> > > between cifs.ko and ksmbd.ko, with the aim to provide
> > > a socket layer for userspace usage at the end of the road.
> > >
> > > This patchset focuses on the usage of a common
> > > smbdirect_send_io and related structures in smbdirect_socket.send_io.
> > >
> > > Note only patches 01-08 are intended to be merged soon,
> >
> > Sorry it's just 01-07.
> >
> > metze
>
>
>
> --
> Thanks,
>
> Steve

