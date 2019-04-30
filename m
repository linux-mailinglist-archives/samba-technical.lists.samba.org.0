Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB8EEC5
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 04:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=nf9xg6nmAQEfUofYptPoOcBnZg5c+bp4s5gkbrtiIHs=; b=kf+DPbgYGc3hN53pOCjFAVZkHy
	vqqDFg6mB2dxogbJF/Y4r/NkvwPr/2VP0XthOV5IjFhFVBAEE7g18I+02t2O/tZwnALNTocbtF7rl
	RwKJ/r0Pmj4tpQzS2Th8OJ+8ixoq9jC2PiX/EIi7m6zRVXuN6F29tg30GEx+ujmiPfdEQmIRaf8fs
	AAokBc9VyCy6651cZgztosRKjaYUD0Bq8hl33kmi+ZRymk6AwVm1iCjn6J+ZGq+aBDHcaAUmBoiQa
	dZ9+WVltjv3IuStOfZhcSSpr4YRDg05rc+ZZMAopGYs7DpZzZuNHF/tVeMzbbp3B2xKChyCOSnXvK
	5TL2p68g==;
Received: from localhost ([::1]:21176 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLITt-003mdn-Jq; Tue, 30 Apr 2019 02:26:53 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:37532) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLITn-003mdg-HI
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 02:26:51 +0000
Received: from [IPv6:2404:130:0:1000:a8df:9eac:5598:3f05] (unknown
 [IPv6:2404:130:0:1000:a8df:9eac:5598:3f05])
 (Authenticated sender: aaronhaslett@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 0B8FF8106E
 for <samba-technical@lists.samba.org>; Tue, 30 Apr 2019 14:26:35 +1200 (NZST)
To: samba-technical <samba-technical@lists.samba.org>
Subject: [WIP] [PATCH] ldb: new on-disk pack format
Openpgp: preference=signencrypt
Message-ID: <09dfb485-0056-44f9-3baf-3ba38675758a@catalyst.net.nz>
Date: Tue, 30 Apr 2019 14:25:56 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Aaron Haslett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Aaron Haslett <aaronhaslett@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Garming discovered poor performance when recursively calculating group
membership for a user during LDAP bind.=C2=A0 This WIP patch attempts to =
fix
the problem by separating values from the rest of the data in our LDB
pack format.=C2=A0 This should dramatically reduce the amount of data loa=
ded
into cache while unpacking with flag LDB_UNPACK_DATA_FLAG_NO_DATA_ALLOC.

Correctness testing is included and a CI run is here:

https://gitlab.com/samba-team/devel/samba/pipelines/59051539

To be done:

  * Performance testing
  * Research into OpenLDAP's pack format and possible modifications to
    ours based on theirs


Thanks :)

Aaron H.

