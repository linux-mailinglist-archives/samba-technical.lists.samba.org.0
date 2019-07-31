Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F09CD7BE09
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 12:09:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=PPVC5vzSwJbLn2XDtsfqGhiXr1OBRLYHw5LkP3qFjzc=; b=kyYsQxesc3DrwhhM+2Kahlq23t
	8uo+zeLaDFpuPHw3XZ1QZYsNVa63+to1Kx2cYoxbc7M12MR3tHsDkk7jiTF8wRapKk1+C3iyRjts8
	/5xSdr/igxTltMVbNuyhd+j/1r18EJnzYzAI/LYxGgZCREWELh/UQ71SKI02rgnewVkXCvi/5fFaY
	O0jkDQSfpZ7oeUFAhgkZvRZIXSQLU5chkh2ekI9EzXi9dNN0FsiuLCe9/R2sbP5ZRE7ZBSaWkfuVb
	ApP0VFZMjsXGVr4lfDPVrrtnYyzbo8lIJsvQzL1BwOqjbk/Z38OpYkRU2VteBZYPma/jS2p1J8VIG
	r556W7VQ==;
Received: from localhost ([::1]:62998 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hslYH-001EsA-Az; Wed, 31 Jul 2019 10:09:45 +0000
Received: from mx2.suse.de ([195.135.220.15]:52782 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hslYD-001Es3-1Y
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 10:09:43 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9759CB08C;
 Wed, 31 Jul 2019 10:09:33 +0000 (UTC)
To: Colin King <colin.king@canonical.com>, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
In-Reply-To: <20190731090526.27245-1-colin.king@canonical.com>
References: <20190731090526.27245-1-colin.king@canonical.com>
Date: Wed, 31 Jul 2019 12:09:31 +0200
Message-ID: <87r266seg4.fsf@suse.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Colin King <colin.king@canonical.com> writes:
> Variable rc is being initialized with a value that is never read
> and rc is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.

I think I would actually rather have rc set to an error by default than
uninitialized. Just my personal opinion.

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Linux GmbH, Maxfeldstra=C3=9Fe 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 21284 (AG N=C3=BCr=
nberg)

