Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 430CD193C5F
	for <lists+samba-technical@lfdr.de>; Thu, 26 Mar 2020 10:57:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hwb4ro9MIIOLZ32wsMRiw+XrHANzaw9AoyRowM3GJUc=; b=ASoitniouVEAPkW4/0NMhx/JrG
	EIUmF9eJz3q873tcU8BGKktlHvuJ39uLLkOaFnOTw+Mm39Vuk02E+12XiXeDX3j14K5zufgW8oFYT
	mZhlG9lTXH5LjgxunNtoK+QFW3QfIFNFAblJX275wzr/G1jwkgrtp5CKID/KgQbePF4zB+87NQEuU
	Xj5FvAVbmWW1KsrLPkfVYmAqZGj+tctY6wPkCBUPQZIg4xXD9wnNwf4xknkDbCY4NszLQvUXzoqtO
	RNq17qigpftiF9NH0iGXKrH4Y89GN3Vaqqsn4SEJChYD/A75VhwKpRzXlaROm5UF0xZDs8mvcgkLl
	pyytgVpg==;
Received: from localhost ([::1]:23560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHPFa-000mUI-Lq; Thu, 26 Mar 2020 09:56:34 +0000
Received: from mx2.suse.de ([195.135.220.15]:51826) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jHPFV-000mU2-9x
 for samba-technical@lists.samba.org; Thu, 26 Mar 2020 09:56:32 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 982FBAC8F;
 Thu, 26 Mar 2020 09:56:26 +0000 (UTC)
To: longli@linuxonhyperv.com, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cifs: Remove locking in smb2_verify_signature() when
 calculating SMB2/SMB3 signature on receiving packets
In-Reply-To: <1585159997-115196-1-git-send-email-longli@linuxonhyperv.com>
References: <1585159997-115196-1-git-send-email-longli@linuxonhyperv.com>
Date: Thu, 26 Mar 2020 10:56:25 +0100
Message-ID: <87d08zzbg6.fsf@suse.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

longli@linuxonhyperv.com writes:
> On the sending and receiving paths, CIFS uses the same cypto data structu=
res
> to calculate SMB2/SMB3 packet signatures. A lock on the receiving path is
> necessary to control shared access to crypto data structures. This lock
> degrades performance because it races with the sending path.
>
> Define separate crypto data structures for sending and receiving paths and
> remove this lock.

Something I've often wondered: why do we keep crypto state in the server
structure instead of creating it as needed in the caller stack (thus
avoiding the need for locks). AFAIK there's no state that need to be
kept between signing/encrypting calls beside the access to keys. Is it that
expensive to create/release?

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

