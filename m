Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884DAD5CD
	for <lists+samba-technical@lfdr.de>; Mon,  9 Sep 2019 11:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+j7j/pBSygLSol6SnREo8YMl8szqg3RJFcmUso6vIQY=; b=H7S5wf9yXUbw7b68AelGzjxmCB
	zdnCtQXN46piQ7vkrySYbwxwjnjW3ilzJFxPsuDKAgcW9PMOPDZbQYwgoFeICeVrFeIFzjxhZY1mD
	7Po6wHr9SsP2jewrIL14lHAq1NA/SwtqBI7Vm0cXtbKzafUIMVnJ7i/muVoV14ufQNIdeKfaZDyG7
	NC7JG6fqDwNdeyqOjt4dmY3CgP+/QDRhqT0PAxgJzZXZPP2eG+NAqZALcckXjXWmrJhn8KmZDEc9N
	03tDkSSScrDxhI0lt43JgtYK0/KCKX+YBXQ/pYmUa6VB9gwfw1t2i+4Tqt2D+p5ByMyVrgDwVX1sZ
	qQuJtOpw==;
Received: from localhost ([::1]:23672 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i7G3q-004P0n-5O; Mon, 09 Sep 2019 09:34:14 +0000
Received: from mx2.suse.de ([195.135.220.15]:58494 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i7G3i-004P0g-GQ
 for samba-technical@lists.samba.org; Mon, 09 Sep 2019 09:34:09 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 894B4AC1C;
 Mon,  9 Sep 2019 09:33:58 +0000 (UTC)
To: P Mairo <akoudanilo@gmail.com>
Subject: Re: Insights for the future of smbcmp
In-Reply-To: <CAELK94fiPPVEKuk3SP1dDeXkAm7xQRkjEU1FpHQ_duJONWPNMw@mail.gmail.com>
References: <CAELK94eRurKj24RLm7Csd88ueJ5K+D8NhnZQ-j7Wt+dJhJLSVA@mail.gmail.com>
 <87lfv17nwo.fsf@suse.com>
 <CAELK94fiPPVEKuk3SP1dDeXkAm7xQRkjEU1FpHQ_duJONWPNMw@mail.gmail.com>
Date: Mon, 09 Sep 2019 11:33:57 +0200
Message-ID: <87pnk9izju.fsf@suse.com>
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
Cc: P Mairo via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

"P Mairo via samba-technical" <samba-technical@lists.samba.org> writes:
> Can you provide me the file(s) you used ? And the steps to reproduce the
> bug because it just re-tested it and it works just fine

It happens with all the captures I have. I coudn't find a capture where
it loops correctly. I'm seaching for "res". It doesn't matter if you
open the file via the CLI or the menu, happens in both.

> - If you select something and then search it won't search starting from
>>   the selection.
> I think this is questionable, but you are one of the users so I'll do it
> accordingly

This is how most (all?) searches work. Text editors, web browsers, etc
all search from current cursor position. It is a pretty conventionnal
way to implement it I would say.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

