Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6256123FF7E
	for <lists+samba-technical@lfdr.de>; Sun,  9 Aug 2020 19:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=9Oco63l7kTneOYPN0fPMZjltSddddLNPio0eIR7IXZs=; b=yQfrRQqsGynEK1WuEUwMYRQqlQ
	8lA7rteQZO5USBtu+FkJv0k2k0vqZeDO0C3X66ysdA0T7vCS+yGUCqc55C+ySp7SZADEnm/XihJMY
	1EUzunJbFgLznX9LSlbCzXI34slphaWBfPGRAIUqByHNFCWF/DCOUvA9mCXnyK+mUElDzRdOJWRCd
	l+yx+CsYIvqB5hvaG2R2smeSQ0FwlpfwMv/9t8TYD/0WYlEOsQHE1/qb9iu7/HNHyiw/Ry3g7UM+h
	5NdliC6JNS7Gzrc7LPpODqW+zpNX0KyQ93fBqBfb87BgpCig1affShO5EssHKmde7hZJNyzWfAXLS
	SamIy2VA==;
Received: from localhost ([::1]:35436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k4p4O-00D30r-OI; Sun, 09 Aug 2020 17:25:16 +0000
Received: from smtprelay0236.hostedemail.com ([216.40.44.236]:35700
 helo=smtprelay.hostedemail.com) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4p4H-00D30h-Vy
 for samba-technical@lists.samba.org; Sun, 09 Aug 2020 17:25:13 +0000
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 39318180070C0
 for <samba-technical@lists.samba.org>; Sun,  9 Aug 2020 17:07:25 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 5E97B182CED2A;
 Sun,  9 Aug 2020 17:07:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: crate03_55148a926fd3
X-Filterd-Recvd-Size: 1638
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Sun,  9 Aug 2020 17:07:08 +0000 (UTC)
Message-ID: <5788fcd4bc9d055fa40302ecb6728265c7618772.camel@perches.com>
Subject: Re: [PATCH] cifs: Convert to use the fallthrough macro
To: Steve French <smfrench@gmail.com>, linmiaohe <linmiaohe@huawei.com>
Date: Sun, 09 Aug 2020 10:07:07 -0700
In-Reply-To: <CAH2r5mvHLXtCAam9Wcw6PJUGg3bY8PvjYG8ijFh0km-CKNEUnA@mail.gmail.com>
References: <1596875797-22710-1-git-send-email-linmiaohe@huawei.com>
 <CAH2r5mvHLXtCAam9Wcw6PJUGg3bY8PvjYG8ijFh0km-CKNEUnA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 216.40.44.236
 (smtprelay0236.hostedemail.com) incorrectly presented itself as
 smtprelay.hostedemail.com
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
From: Joe Perches via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joe Perches <joe@perches.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2020-08-09 at 11:46 -0500, Steve French wrote:
> Is this conversion from "/* Fallthrough */"   to the preferred (?)
> "fallthrough;" documented anywhere?

Documentation/process/deprecated.rst

As there have been a long list of flaws `due to missing "break" statements
<https://cwe.mitre.org/data/definitions/484.html>`_, we no longer allow
implicit fall-through. In order to identify intentional fall-through
cases, we have adopted a pseudo-keyword macro "fallthrough" which
expands to gcc's extension `__attribute__((__fallthrough__))
<https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html>`_.




