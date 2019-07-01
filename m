Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE285BD47
	for <lists+samba-technical@lfdr.de>; Mon,  1 Jul 2019 15:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=A2zbgWPDEp85zktSm9wTZHKerO/KKcjIw9/WL6Al9SQ=; b=M8ws97hbhoGYyahdiNlmxJumM/
	+d+GJVNatHOeMmYdyX9kyDhPbBYlXxvgoCgkMd6mAuZ9pUKwtBnQXd6bQkXkLlF4PlTZrQ4BkGDpX
	4oWhTAWY6XJhRBmSvnlFyNnD0fxMlHESiCseGdR24UCD9q7ND6m+43gXgmeNFsuBIAbSzF8wwrsqh
	2YfNXHNtmifrdHv1EHRM8NwlDgAy+pyWgx/+9PVLcpJBROR2MdzeVmwD5Kc+Ty03K89CyYpGcI4y+
	BTvPaYegxQhxBy1uszrRrjHde8DYmfaAOxiCrmcEIeXe1m1+/IPaox4iDAlECOofcpgwrP2xV/0FM
	Y2XUCohQ==;
Received: from localhost ([::1]:24186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hhwgX-004J7O-Ui; Mon, 01 Jul 2019 13:49:34 +0000
Received: from mx2.suse.de ([195.135.220.15]:52012 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hhwgS-004J6p-Si
 for samba-technical@lists.samba.org; Mon, 01 Jul 2019 13:49:31 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F05B1AF9F;
 Mon,  1 Jul 2019 13:49:20 +0000 (UTC)
To: P Mairo <akoudanilo@gmail.com>,
 P Mairo via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Clarification about Pdml output
In-Reply-To: <CAELK94eFMBfrvxoPQWC20TaUL3cGXm49cTsixkBS04hn6ckkAg@mail.gmail.com>
References: <CAELK94eFMBfrvxoPQWC20TaUL3cGXm49cTsixkBS04hn6ckkAg@mail.gmail.com>
Date: Mon, 01 Jul 2019 15:49:19 +0200
Message-ID: <87ftnpamqo.fsf@suse.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


(this is regarding this year GSoC project on my smbcmp tool)

"P Mairo via samba-technical" <samba-technical@lists.samba.org> writes:
> Hello,
> I am working on using the tshark XML output to do better and deeper diffs
> (basically adding ways to let users add ignore rules). and I wonder if I
> may delete some fields by default mainly :
> pos - the starting offset within the packet data where this
> protocol starts
> size - the number of octets in the packet data that this protocol
> covers.

For now you can ignore those fields yes. Ideally if we implement a
mechanism to use user-provided rules to add/ignore things it can made as
a default ignore rule.

To dump the SMB packet tree to text from the XML structure you can
either:

- dump everything within the SMB node and have ignore rules (black
  list approach)
- explicitely dump specific fields (white list approach)

Given the amount of fields to handle to cover all of SMB the black list
approach seems better to me. But it could also be a mix of both
e.g. dump everything for the header but for this sub-field only select
some things.

Depending on how what you use to parse the XML tree you might be able to
use XPath to select specific tags (to access the SMB node or specific
fields in it). XPath expressions are compact strings you can use to
access and return things in an XML tree. Think regex for XML.

https://en.wikipedia.org/wiki/XPath

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Linux GmbH, Maxfeldstra=C3=9Fe 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 21284 (AG N=C3=BCr=
nberg)

