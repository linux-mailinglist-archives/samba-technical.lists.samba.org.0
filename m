Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4BA186974
	for <lists+samba-technical@lfdr.de>; Mon, 16 Mar 2020 11:51:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=6EYM/Sp0JN8yy7fSA9P2RTKtN7T5owoTMo/xt5LndPQ=; b=2vnT3tw6MsNIZv3XgnV4k1QDtQ
	7rJVmnsSsUbVyEzMBdjQQL8HAXf9foTIn4/UoZ9H7sa+7JoOItJ0Xbr4/CqmRRwdo5XO8QXOiMPsn
	FGV1GAdBV1bL37slaJjeQU8fO99SkHrnUtZwO/VF1NpDQ6E03ElFRK28/rtQqSyQ/R7yMWQTNF7M/
	5BtuOa0OPxq976fOJzyzb4NeF+mg8x8LsYNndf7WkiK4NWrZ6ayDij6ji2X6VrQrfj15LNpZ6rzA4
	ng4Hx9L4Oikw1UZpfthSWJPMrSs5zFJvgSKGO9+tXPpIuXIbrtr/umeUu0kM944v6R0ak/4EmV8yq
	keARlIAw==;
Received: from localhost ([::1]:55440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDnKQ-0005m7-RQ; Mon, 16 Mar 2020 10:50:38 +0000
Received: from mx2.suse.de ([195.135.220.15]:45738) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jDnKM-0005m0-KZ
 for samba-technical@lists.samba.org; Mon, 16 Mar 2020 10:50:36 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EA92DAE2B;
 Mon, 16 Mar 2020 10:50:31 +0000 (UTC)
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: [SMB3] New compression flags
In-Reply-To: <CAH2r5ms_oxqwHm56nzabM-x2XMR1Ni-WD1_LEYYxOW_NkswsOQ@mail.gmail.com>
References: <CAH2r5ms_oxqwHm56nzabM-x2XMR1Ni-WD1_LEYYxOW_NkswsOQ@mail.gmail.com>
Date: Mon, 16 Mar 2020 11:50:30 +0100
Message-ID: <87sgi8mv49.fsf@suse.com>
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

Hi,

Changes looks good.

I had a quick look at this new stuff with Pike recently but it seems
even the latest windows server (1909) doesn't support it yet (not
returned in negprot).

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

