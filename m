Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC5787F1C
	for <lists+samba-technical@lfdr.de>; Fri, 25 Aug 2023 06:55:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=2of40hskuudI9R+5wCTL6pTuY9gu4K0w/i4Ps6dXiKs=; b=a4K80TNQYvRVpNYW53t8igNPv1
	FQziqxbwbwXw3Czr4pn4PZ82M+FSTEIj8ze8Q09DdM1768aQkWt37LyAt5RB9B0aUGG5ae40IaeH4
	8HBWyn+lvntLu37TLCKwcyAQySd9FDvTFfpnjuvq/FwGGWhqAx7j8kugMJAxJ6uJfNooggrB+259p
	nokUSO1SgswI+GJOrFq+x1ANkes7b20QRT/wlZQANQSwh6jwHxe0vx7OU4NTCC2rT33PX2vq+BlqF
	2pFv/juV4sexV4b7kR+hGkYQEdwnxFpSCMqjqn65WQ0zgoxz5wv2S8Qt28NPLcWdrNagNYiy/sg2g
	PYodUJwQ==;
Received: from ip6-localhost ([::1]:30190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZOr1-00EPY9-TC; Fri, 25 Aug 2023 04:55:27 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:50333) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZOqo-00EPXz-V8
 for samba-technical@lists.samba.org; Fri, 25 Aug 2023 04:55:21 +0000
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bcc14ea414so7605701fa.0
 for <samba-technical@lists.samba.org>; Thu, 24 Aug 2023 21:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692939313; x=1693544113;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2of40hskuudI9R+5wCTL6pTuY9gu4K0w/i4Ps6dXiKs=;
 b=PoF7nZtY8Ia3CjLcjdEU9Rj9UIVmslszWMdfs3K5WoTY6NQewwyW65pm/silPK7O0a
 4CSb+oE0jE9SVaEn/oA9IfvC2drD7OxpjLSKS1fNTMJR32V5RHD8TCjRoSYEn7fKJosz
 VvoegRYMISq9/RHJNVjKQxFO/yVs2WOw4bwMcO5f09mh67SDnjobj8KEeOK95eKFlUzM
 fPWmK8GZtGMXAFNjDU53vXu4/N5vB9/hNb6KGi4L/wJUgRfPXIdRvgipPZ99ACYNUOUH
 knKJJN0YnnMPcrXOq/VSQaMk0yqxPmkZem+r7YNO+U3Yo6d2n+cechaiTLsWEDIWkPWA
 LfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692939313; x=1693544113;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2of40hskuudI9R+5wCTL6pTuY9gu4K0w/i4Ps6dXiKs=;
 b=eeqKDJATvTyYM/fb+7Et8XleAo85HaNh287WStE8tckD/UeprZupx+6zj1QG5PhRWW
 RU+LrzUvR6XzXJJCPmGFMSBf6sdXVNs5NIUsnNepVxyXXLztbHsE6eb3siuB+K1BnAUW
 24MbnHZQbpsEc9SRwODsDvYN388HWNDFGVYIBYhi7nvLXxdfQM9VDGIUNrtUs4ND2szV
 vDBmmDPCeTCvqq4WuJ/wSvlnASDf6K0hgvsw6y50mzEbnwxUIN6Mkac3xBWGCWQQq9r8
 t2GsP8KU1PG21hbwI8tpiTTvtQArg7OoR34bDPcFF45WRek1Cfno4F7MfRd+4jXrOnc1
 Nt+Q==
X-Gm-Message-State: AOJu0YwJWc5bDfS0JmMPC1UhgzFfrfjcoHGsDg8ccrdsj3r9VkBxFlai
 4UBoeesuKk7mNIj4vi+0duKzeVJysskwKAuZYWE=
X-Google-Smtp-Source: AGHT+IEQh4VXX+4sfq4HIgCClAvFKD3N0BiwmXUaBcr70zK2Zm9TEi0MqLqJ7uSEsu3do4bwajeQBHa3NfzTclYr1u8=
X-Received: by 2002:a2e:3310:0:b0:2bc:ed80:46e with SMTP id
 d16-20020a2e3310000000b002bced80046emr1903577ljc.31.1692939312620; Thu, 24
 Aug 2023 21:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mucC=YxgaQV5nAPCfduAmjyEyxYw+XdToOwELezqe=e0g@mail.gmail.com>
 <CAH2r5mu75kYDVGPqe135pjZRjCS1SvdXqjOax+nyG9aTXmoJJw@mail.gmail.com>
In-Reply-To: <CAH2r5mu75kYDVGPqe135pjZRjCS1SvdXqjOax+nyG9aTXmoJJw@mail.gmail.com>
Date: Thu, 24 Aug 2023 23:55:01 -0500
Message-ID: <CAH2r5mvb=Bz3dW+yoS0WJk7oJuteCiGqgu=sRzVQN5C-Rn2JMA@mail.gmail.com>
Subject: Re: [PATCH][SMB client] send ChannelSequence number after reconnect
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>, Tom Talpey <tom@talpey.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> How have you tested this? Seems like some significantly random
> connection fault injection is needed, when doing active multichannel
> load testing to a Windows server sku.

I tested this to Windows by pausing the Windows server VM in HyperV to
force timeout, then resumed the VM to see reconnect (I also tried this
with the Windows client to see how it updated the ChannelSequence).
I also tried this to Samba by dropping the network interface and
letting the requests time out ("ifconfig lo down") and then doing
"ifconfig lo up" and letting it reconnect

On Thu, Aug 24, 2023 at 11:51=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
>
> The ChannelSequence field in the SMB3 header is supposed to be
> increased after reconnect to allow the server to distinguish
> requests from before and after the reconnect.  We had always
> been setting it to zero.  There are cases where incrementing
> ChannelSequence on requests after network reconnects can reduce
> the chance of data corruptions.
>
> See MS-SMB2 3.2.4.1 and 3.2.7.1
>
> Note that (as Tom Talpey pointed out) a macro  "CIFS_SERVER_IS_CHAN"
> used by this patch is confusing (has a confusing name) since
> multichannel is not supported for older dialects like CIFS.  I will
> fix that macro name in a followon patch.
>
> --
> Thanks,
>
> Steve
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

