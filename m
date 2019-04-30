Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A05EEE1
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 04:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=IppMTMBU5SHwiOiWNSkvyZ5vAXLM8upvtdGm1trjYcM=; b=c6MVm6MV3UwFLQtKe+VqdVnbbD
	D67TXu4vkqMb2xUP3/yIY5Mgmb49u3vHjoa/gy5xzzp89ucLXdxNO50jhA3LBVB6PqLKg5zfFojuH
	H+85/r4yLGqUQS1LIYaS3PkjEp+64mOUrY8S59dzF1qV1gpGyzghCjkixxlkVkKy6EU9crjTY2F4z
	gLMiExP3t6bgBf5jt5B1vNJ47G0Py1y88e43UiKd8ylbqKZP1gFCj0e1/Uvc/rsENPY6m6SofDG+j
	1fuo7ThYq3NysybKekhUxmzoy4K+txDVdTA0QWK4rKkghTLo/ANVRjMJDhCKBQGNyFUUVY/FiuFXT
	JCDW42pQ==;
Received: from localhost ([::1]:21908 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLIvp-003mkU-Pj; Tue, 30 Apr 2019 02:55:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:21080) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLIvl-003mkN-7y
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 02:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=IppMTMBU5SHwiOiWNSkvyZ5vAXLM8upvtdGm1trjYcM=; b=bi2AfT2OafJwxhgQd2NSiy+yBE
 H4O7a+3BiaLLC3jHZLJUtnUKQKih9lcnllo8J3NGjn9ROpLupKimEWHl8meW3xDu+nCtfWHQCO7J3
 ol9PauCYKYvi+0az/6E+uopE1ONbGczvdxv9FHt34H6Ebazj0pEeuyuVfzYUHrj3l/vM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLIvj-0004DE-H1; Tue, 30 Apr 2019 02:55:40 +0000
Message-ID: <1556592935.25595.87.camel@samba.org>
Subject: Re: [WIP] [PATCH] ldb: new on-disk pack format
To: Aaron Haslett <aaronhaslett@catalyst.net.nz>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 30 Apr 2019 14:55:35 +1200
In-Reply-To: <09dfb485-0056-44f9-3baf-3ba38675758a@catalyst.net.nz>
References: <09dfb485-0056-44f9-3baf-3ba38675758a@catalyst.net.nz>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-04-30 at 14:25 +1200, Aaron Haslett via samba-technical
wrote:
> Garming discovered poor performance when recursively calculating group
> membership for a user during LDAP bind.  This WIP patch attempts to fix
> the problem by separating values from the rest of the data in our LDB
> pack format.  This should dramatically reduce the amount of data loaded
> into cache while unpacking with flag LDB_UNPACK_DATA_FLAG_NO_DATA_ALLOC.
> 
> Correctness testing is included and a CI run is here:
> 
> https://gitlab.com/samba-team/devel/samba/pipelines/59051539
> 
> To be done:
> 
>   * Performance testing
>   * Research into OpenLDAP's pack format and possible modifications to
>     ours based on theirs

I've looked at the OpenLDAP code (mdb_entry_encode()), and the big
difference is not in the implementation but in the ability to follow
the code.  Both need more inline comments, but the OL code also avoids
whitespace (ouch).

Things this code does that OL doesn't do are pack the offsets at
smaller than 'unsigned int' size.

It looks like OpenLDAP avoids the issue being worked on here (large
multi-valued attributes needing to be loaded and discarded) by putting
them in different DB keys with SLAP_ATTR_BIG_MULTI, but it also puts
the data at the end of the buffer.

So from a 'is there something major we are missing' point of view, I
think what we are doing is reasonable.

Finally, for a future investigation, I think we should remove the
'talloc individual pointers' behaviour entirely, and leave that to the
'filter' layer in ldb_key_value (which copies the whole entry). 

I hope this helps answer these questions,

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





