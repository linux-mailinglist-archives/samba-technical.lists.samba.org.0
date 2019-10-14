Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4702D5F00
	for <lists+samba-technical@lfdr.de>; Mon, 14 Oct 2019 11:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mhnfXuQoP6a1BrVW/w3XyiP+IMfwS4hOQvSAVUxdCdg=; b=w1pXnQ/znWR64YDB0tcMzZtIvP
	eTEKHRS4Y2XVV0AgAvFGZ9UzAbgQplsdi6VIr9k6INQcxeNAttab8Vl2KRDFBNjDeRGMTIrDx8a57
	Z9/z1FSyHVpSMd/0TnRERrbIXQ+inBfLXzuJI2Kl4oFRgNfdLSKzXW8k+H9wU68OPDCpKtg/NrRUx
	RrcBK/KuYINMqr+7WNagaJuLr67GS+VMnufFdrp0CzjnXWP9e5S1cfI0S8dRuEcZjd7OgKEQ/wMlj
	NcrpQPCW12e3iKg9FZZ/n6XwDb09ByRaNN+vi1iu68WYNlNp4B5n6kgop4kf7Ue6zK80JKo+BebIJ
	xIpC/eJQ==;
Received: from localhost ([::1]:58656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iJwiz-003ZDT-HO; Mon, 14 Oct 2019 09:33:09 +0000
Received: from mx2.suse.de ([195.135.220.15]:59178 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iJwiv-003ZDD-Qc
 for samba-technical@lists.samba.org; Mon, 14 Oct 2019 09:33:07 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D48A9BC8C;
 Mon, 14 Oct 2019 09:32:57 +0000 (UTC)
To: ronnie sahlberg <ronniesahlberg@gmail.com>, Roberto Bergantinos Corpas
 <rbergant@redhat.com>
Subject: Re: [PATCH] CIFS: avoid using MID 0xFFFF
In-Reply-To: <CAN05THQTb=aechQB5rqUxZLpfwocqfLPMVW5mAz4F5dn3ryj0w@mail.gmail.com>
References: <20191014085923.14967-1-rbergant@redhat.com>
 <CAN05THQTb=aechQB5rqUxZLpfwocqfLPMVW5mAz4F5dn3ryj0w@mail.gmail.com>
Date: Mon, 14 Oct 2019 11:32:56 +0200
Message-ID: <87ftjvbrjr.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Warn: EHLO/HELO not verified: Remote host 195.135.220.15 (mx2.suse.de)
 incorrectly presented itself as mx1.suse.de
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
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

"ronnie sahlberg" <ronniesahlberg@gmail.com> writes:
> Steve, can we get this pushed to linus soonish?  It is a bad issue.

Probably a good idea to CC: stable=20

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

