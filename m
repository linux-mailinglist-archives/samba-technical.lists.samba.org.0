Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A71D7EAD07
	for <lists+samba-technical@lfdr.de>; Tue, 14 Nov 2023 10:31:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7XAI842gwqpuCzETH/OJU9CSZeCdWRjR5wNnGkWZgBY=; b=fe/bT1+9tdJFl84OScxBZ8/CAO
	u3CXhh0R4/XVan2HQ+IaKqLLw5ZKXodtgPXbB182TTpCUhy1k2LUtjur/oONJRdLsAlXun+T5t9Us
	Z/XiY/F9n+yXfAKZ5pM71pjWWi5+ekMsR2cQ4UAtqACfpNbNR63ZS0Vmut7VyKuGWjYTCX0abrV+A
	WT0uKW4bLThg0FAVPlh3c0v/z3oA5Pqkefda92+sl5RkZ3xUCuDo0wOQktYhjbExYgNgxmUXF0t1u
	EOn6n43G31i2jLVUumCtJz1XcbNmpi99330ig6ogi+3b5RsX5ydlv8FvHX9SDRPxLRTqb2kZE5P5u
	Hd/wkyhg==;
Received: from ip6-localhost ([::1]:32812 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2plC-008DJf-O2; Tue, 14 Nov 2023 09:31:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:56689) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2pl3-008DJW-D0
 for samba-technical@lists.samba.org; Tue, 14 Nov 2023 09:31:01 +0000
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5c18a3387f5so1189955a12.1
 for <samba-technical@lists.samba.org>; Tue, 14 Nov 2023 01:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699954255; x=1700559055; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7XAI842gwqpuCzETH/OJU9CSZeCdWRjR5wNnGkWZgBY=;
 b=AvN7z6BJ7tTO9gN9mGomYHLFEFugeyO7si03GGWGE0sFltvPHmf6yYu5zwjx9XoNOh
 8dYVOBHz4B6n0usIeaUjLYJJ7iME0RzAzLMSqfZDCKavowoe4QPUn3Egs7CTefGwk9ih
 0mIoGp3Vn98WkgoQlM363xZeVVrzWjyR6J0VF0UrnbywvtU4S9Siho0sk7EaXfX3fkcX
 Wxtqf73K8PlDt1ddnwXu4qDetbf8btBSGZ/nUt5+WmZt4insMJHWEo/pLJTmw4+yb9CE
 qFlIpjAxkeWjrlWcHS1muy5bJ7E4gmX5+KtTHF0qnKZwq/WBpfkYI2CnronnBuPL9O1y
 epxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699954255; x=1700559055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7XAI842gwqpuCzETH/OJU9CSZeCdWRjR5wNnGkWZgBY=;
 b=LL+qBA4OeJV5r1XUWWNfmVtAtUgCp1gRP6rhzBoK6TB0qDVehNUC15qxbuBBs4BSS7
 JEujPdJ6ikk2/XaJSBiGGrBq0t5DQN73zCiDKPnek9D5FtMdyBK+P+lOjlO7uiALVAX9
 vkveNLsP4xBGZ5nuVl4yUY3n2YY0BA1MlT0BA3wiElDLgPXG4z0h/Pm9evgn9Zpvyxj/
 jL0ZrXBf1iOypvYif688nZPLF2nk7HKUcUMvAUFZXUm9qf5l1K7d4ui4yMPkhLzxmDIW
 fhNXqYBgjIvOkX3988LHTzzEwzQPJOwCEyYSorGw0oosR3q+tnXLuHjDUn/DizxCKw7r
 5M+g==
X-Gm-Message-State: AOJu0YwCZ76QL7IMIIaj4LqhKt2xAooJnyYFkPlxw1DsEQ2JO/YF+RCQ
 iAeZXIa3xZsFk5yHSwv+Hx0CmbH7js43HnR2M5A=
X-Google-Smtp-Source: AGHT+IE0zX0kETdGX8Da/Y9I93FpGR+TNJPf6E4U7ockmteQDGqxwKfONUN1zwM5zc87YVczxijE2ucHFOWSEVdSCMA=
X-Received: by 2002:a17:90b:3b83:b0:280:cc73:4c79 with SMTP id
 pc3-20020a17090b3b8300b00280cc734c79mr6477719pjb.7.1699954254777; Tue, 14 Nov
 2023 01:30:54 -0800 (PST)
MIME-Version: 1.0
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
In-Reply-To: <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
Date: Tue, 14 Nov 2023 19:30:43 +1000
Message-ID: <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
Subject: Re: [SMB3POSIX] File attributes
To: Ralph Boehme <slow@samba.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Volker Lendecke <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 14 Nov 2023 at 19:16, Ralph Boehme via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On 11/13/23 18:50, Jeremy Allison wrote:
> > On Mon, Nov 13, 2023 at 12:28:18PM +0100, Ralph Boehme wrote:
> >> We had support for file atttributes in the CIFS UNIX extensions, this
> >> is currently not in the spec (or code) for SMB3 POSIX.
> >>
> >> Is this intentional? What is the reason?
> >
> > Do you mean the attributes listed by:
> >
> > man chattr.
>
> yes.
>
> > chattr - change file attributes on a Linux file system
> >
> > This was at the insitence of Steve as I recall.
>
> adding Steve to the loop.
>
> > We never implemented this.
> >
> > Might be done via a tunnelling ioctl ? Other thoughts ?
>
> well, it's a rabbit hole of its own and still seem to be rarely used on
> Linux and the BSDs. It's not POSIX anyway so just declare it out of
> scope for now?

Not to derail, but "chattr +i" is not a rabbithole. It is very much real.
If you are going to set up and run bind locally on a systemd-resolved
infected system
you literally must use chattr +i to stop it from ruining your /etc/resolv.conf

>
> The Linux interface is via ioctls so doing it over the wire via SMB2
> IOCTLs looks like a good way forward allowing us to ignore this for now
> and possibly add it later if there's demand and resources to implement it.
>
> -slow

