Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A57117E5
	for <lists+samba-technical@lfdr.de>; Thu, 25 May 2023 22:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=SEtHntZHg7Ms5YQP5nZwmkuEWeGUPfuHk0wUhDFOsZA=; b=VIh9iTsuFf4AlLxmQNFO6EmJIY
	kW07QsLvgRnp0hOkoP7NJwtMw745yCJ7W0mM935DRZ6vWlvQnNTCtfWWjWLzHqSYHZc5DNoRuKHGY
	EMpIkYaINyOKhsaPnYmqo2ZEUQEpy0MAdjotphGDzFcXjJyErVDOX/TNuyzBwy8pZ6TpxsEa4lLy8
	IIKFTmGOpcN1yTvIyHbbFuU4bhJxj1JI/LFpG7E4Q610RRv7wAA1HeKeuLANQipgZ/sPgGyZrqEUd
	G3lMvSq0+ytYUORFCmfr88Sm/giJuw6KRe5r+fEz3u/TS6aqoNtf9iWtvC0JTe1+WPd96I5L1MO2Y
	HNvOTi3g==;
Received: from ip6-localhost ([::1]:49808 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2HJ6-00CJck-HU; Thu, 25 May 2023 20:11:32 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:54743) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2HJ0-00CJcb-U7
 for samba-technical@lists.samba.org; Thu, 25 May 2023 20:11:29 +0000
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2af29e51722so11105291fa.1
 for <samba-technical@lists.samba.org>; Thu, 25 May 2023 13:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685045485; x=1687637485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SEtHntZHg7Ms5YQP5nZwmkuEWeGUPfuHk0wUhDFOsZA=;
 b=P79uMI7NatuSIhbDUKW8SoaoXvzyBjSyek6HYp9dwC2rgSr0JHCFk44khyWJQC8bdb
 +fJDNez2/7psPSWmI1n+kIhNEMbyOk7rtCzERguacg4YY2sHrYYKx/+9RoT0EqValDUZ
 hXKCja810FTmbUiYkDqT4Jk+ptjp6/npNCSsmPIirxli1ojYV2Sz15B7H1EfvBGL/ZXG
 TvN4X9/finzn+tEO35cO9awzgIAg688W74Nq+dPIfrc3p6EBGEVPzD9DAnptf3K8v4k8
 37kY1Bb1HZdjRl7+qVjjlGQuLVB3UGPZ8pD9g6ykipjQq4fKVmvXhNrOfsS/QDTK035s
 rlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685045485; x=1687637485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SEtHntZHg7Ms5YQP5nZwmkuEWeGUPfuHk0wUhDFOsZA=;
 b=AtRZfdNeeq1m58k5Voa7SW7gbEpOrnG52ZrY24h/E2lPKWdl/5KIisgKsm1ZwtIg6f
 sGue7Kb/TCbIoIT3DKJObEnjnZY6PE/wj0hCeo8B8Mpvp8+jg6qUS5z2INvyrKWVgYlF
 uk3oqxFJC4sTNDtn4Ao0xKes1/DqKmzIJfw6PXVJr0I7rttaoNIsHoZ1yjsppno4aeFx
 xttl9TGglkJPbFv4PM+rgm5vFQa44lSyasAnTluaX/lqaRhZ4vt+sn19qwNNFazF0YCp
 ss598xtUJ2onmnLoDRp9M2l/ChrWVBVFaS6y1warC9V4bkdc+wVi3STyoa+oyNMBk7Cy
 mA6A==
X-Gm-Message-State: AC+VfDxxL2gqU2vkVGKbL+Q9RuSzEI4aRFL4hj+jAe5Sz4/n7vfoLk+5
 nTKlpdcdeQIQucx5GBLFSA7doOv4lhzYVu8gMy8=
X-Google-Smtp-Source: ACHHUZ7LOK+udplatlLHG+AhXhOY6hgiMjN2Rzuh5x5ArUDuYTDx8mw1Q0DUKybRkMPN4w9l1wxnGqsbI3OTBgLEPME=
X-Received: by 2002:a05:651c:20b:b0:2ad:cb20:695a with SMTP id
 y11-20020a05651c020b00b002adcb20695amr1202545ljn.51.1685045485047; Thu, 25
 May 2023 13:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop> <20230525093900.GA261009@sernet.de>
 <CAN05THTi0BC_iwjXMiWn61fg3hRemi5Momwp3O0WGygyWLGomQ@mail.gmail.com>
 <ZG+LOKTr8B+zjQsC@jeremy-rocky-laptop>
In-Reply-To: <ZG+LOKTr8B+zjQsC@jeremy-rocky-laptop>
Date: Thu, 25 May 2023 15:11:13 -0500
Message-ID: <CAH2r5mv7aZ8nm30oKyYpa-bd8-MqA13EcEmQWV4mOyrV-rj8Ug@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Jeremy Allison <jra@samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 =?UTF-8?B?QmrDtnJuIEpBQ0tF?= <bj@sernet.de>,
 samba-technical <samba-technical@lists.samba.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 25, 2023 at 11:22=E2=80=AFAM Jeremy Allison <jra@samba.org> wro=
te:
>
> On Thu, May 25, 2023 at 08:49:47PM +1000, ronnie sahlberg wrote:
> >>
> >> just took a look at how the ntfs-3g module is handling this. It was an=
 option
> >> streams_interface=3Dvalue, which allows "windows", which means that th=
e
> >> alternative data streams are accessable as-is like in Windows, with ":=
" being
> >> the separator. This might be a nice option for cifsfs also. That optio=
n would
> >> just be usable if no posix extensions are enabled of course.

You can already open alternate data streams remotely (from cifs.ko on Linux
as you can from Windows and Macs etc. just open "file:streamname"), but on
Linux you have to disable the reserved character mapping ("nomapposix")
otherwise ":" would get remapped on open in the Unicode conversion.

There may be a better way to list streams in the future (e.g. to help
backup applications
that need to be able to save files created by Macs or Windows that need the=
se
e.g. Virus checkers etc. use ADS, and looking at my Windows machines, PDFs
can have small "Zone Identifiers" saved in streams), but you can
already list them
with "smbinfo filestreaminfo <filename>"

I was thinking mainly about backup scenarios whether this came up as
listing them
also via a pseudo-xattr (IIRC Macs do something similar).



--=20
Thanks,

Steve

