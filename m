Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E0C19FB83
	for <lists+samba-technical@lfdr.de>; Mon,  6 Apr 2020 19:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/uB5LryQOGJ3maDd4YeGpn0MtV4juQ/OLta1UPhtd0s=; b=PBtfWX7dvSj0G9apwnxin7KEpu
	VKaqJ7RqNprfYvgfZzsesxDZFD3VzXq4wVteULTgvJSLHr4qHO8rsVdP7jbyYKYMxFsOf0XjWixlF
	YYAIbcuJxvy3KZTGzmpQFIGQmRYOGZ3jsQyajw8ACrhYM4hKG3oVlhZg9sQGb41CWs++B/WeB4I8h
	8klR8D9ohKMS07Wo9/oPsiXc7jFAsQVbHLaSpLKFWOudiQTGrtuSGrtbnEe9ATCcJnLGh/1PP1uBg
	5JSG9EGTXAFK7luLEfxzRGgkxNg7AxzzcyAUxpfREZAG24PAS8Fjdy4gNQYEws9b7f1PSvD+GyYbi
	/eFbubfQ==;
Received: from localhost ([::1]:56248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jLVXN-003cij-DF; Mon, 06 Apr 2020 17:27:53 +0000
Received: from mx2.suse.de ([195.135.220.15]:44946) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jLVXH-003cib-Px
 for samba-technical@lists.samba.org; Mon, 06 Apr 2020 17:27:50 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93A78BE46;
 Mon,  6 Apr 2020 17:27:43 +0000 (UTC)
To: Pavel Shilovsky <piastryyy@gmail.com>, Long Li <longli@microsoft.com>
Subject: Re: [PATCH] cifs: Allocate crypto structures on the fly for
 calculating signatures of incoming packets
In-Reply-To: <CAKywueTyHNw5P1M4WR+SdBKU-yXvJEfJc5VSONveNBZm-dOjKQ@mail.gmail.com>
References: <1585696903-96794-1-git-send-email-longli@linuxonhyperv.com>
 <CAKywueRg8kJ+0aOehM-QKGuRwbDSb2TA5vNje8eSCdMqBT+EdQ@mail.gmail.com>
 <BN8PR21MB11559BF18DF932A38624369ECEC70@BN8PR21MB1155.namprd21.prod.outlook.com>
 <CAKywueRBghVuNtfP0XdLYL-wS_Nfci8uF_7pRPSjvQDif22BFQ@mail.gmail.com>
 <CAKywueTyHNw5P1M4WR+SdBKU-yXvJEfJc5VSONveNBZm-dOjKQ@mail.gmail.com>
Date: Mon, 06 Apr 2020 15:05:55 +0200
Message-ID: <87h7xwn4r0.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Pavel Shilovsky <piastryyy@gmail.com> writes:
> + Aurelien
>
> Ok, before negotiate tcpStatus is not CifsGood, so, the allocation
> won't be skipped. I think this function should be no-op for all
> protocols except SMB 3.1.1 to reflect the meaning. Other protocols
> don't use preauth hash anyway.
>
> @Aurelien, @everybody, what would be your thoughts about moving
> protocol version check from IF block to the top of the function thus
> skipping to allocate preauth hash for protocols that don't need it? In
> this case Long's patch will require a change to keep
> smb2_crypto_shash_allocate() and its invocation.

Sounds good. I think we could go even further and do preauth crypto
alloc/dealloc all in the preauth hash compute function too and remove
the pointers from the server struct (except for the byte array with the
hash result). It only runs during negprot+session establishement which
is not a hot path at all and would keep the memory model simpler.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

