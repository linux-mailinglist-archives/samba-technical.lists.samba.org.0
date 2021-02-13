Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C43D331AC73
	for <lists+samba-technical@lfdr.de>; Sat, 13 Feb 2021 15:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1n/WBmFL7wH3aJ/A1XDR5Xb9QWxQCovm+4tMpoqpz4A=; b=zldFCyj5EUMwKqYrXCQTfeTEU9
	rg5PjzZtMRQJyeJY1hcXI4Q3iqhQKYAM9pBsLLO+F374p/R1Ho1d0sPAJreT/Cf9hm1V1EWuit4tb
	Mf+A99jwjoEQMNj/8iF7f8zcf/nL/af4MHgICxpfmLKPkLcRNr4EJ35ntbrTBBcvVcPKbxk76o5Mo
	Ap1UkZKY3Nb9QpAwT96Jr488dorIvPha0fle8sSNxthVNhOlZ+xRJEk55hSDxlKs9qKXOGkbf+a+a
	etOgonh6Qq1A03FeklMWYkvciXTRfTt2diSwXWUYHBt8LhijS1V5nD94ctdXJI3LOrZg2z5CkbK29
	jl9PA2kg==;
Received: from ip6-localhost ([::1]:54058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAwLq-00CUyb-Rx; Sat, 13 Feb 2021 14:56:50 +0000
Received: from mail.kernel.org ([198.145.29.99]:48304) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lAwLk-00CUyU-0d
 for samba-technical@lists.samba.org; Sat, 13 Feb 2021 14:56:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A418064DE7
 for <samba-technical@lists.samba.org>; Sat, 13 Feb 2021 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613228198;
 bh=0xdqdRFzbGrmy03gWLBiCqObAxiTvwlnCu2eKegsZy8=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=oOH/ZdJxhAuIPDMvOs7vZCcYDjzgAW1O4W6CoWMcgmKJHfmtVq2/1jyPGhf6iiBuH
 icnyHhTcQ1BkwzdqvZBRKEUhU/g+3PchuPi74Zi9xswLxaGDZRk46q1OOUF2gMplzR
 yL3Wr0EhspHCFl8UukeeCslCOfdk+89mB/9rzWHT0Kuku70FxIfuDoIShIyS/owztH
 zjr2AwxC2tqLPFS/tUJHfcAJJWG0FouM8GV+9HooyJUbm3qxvPCKCakUYfDY/guko9
 xrPOhoEvAK1oZUuD9Yhq/pjolqvb7++VhTNuZaRs6/1wL3AkAV/NJLeuWmlIA90nRa
 NKf7hM2DZzTyw==
Received: by mail-ot1-f46.google.com with SMTP id i20so2053355otl.7
 for <samba-technical@lists.samba.org>; Sat, 13 Feb 2021 06:56:38 -0800 (PST)
X-Gm-Message-State: AOAM532zCQmFu0NzIPb1I74chh7JOoGVp6DFdPVroR9AXpKaJeSgAK9u
 W+k89jtLwk/+Z5um+QtwE19lHkwdSz3SEgYVRDo=
X-Google-Smtp-Source: ABdhPJyWqY76r47SmKodt8q7v0eyULKAf5jzfPkeR73dmuaK4wvWzSgqi61MN8gUvCsRlQoKBSyObQqgk8Wa99DvjeI=
X-Received: by 2002:a9d:5f12:: with SMTP id f18mr5733756oti.282.1613228197946; 
 Sat, 13 Feb 2021 06:56:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac9:13e5:0:0:0:0:0 with HTTP; Sat, 13 Feb 2021 06:56:37
 -0800 (PST)
In-Reply-To: <d776f655-f58d-6541-e30a-f10e5b9f0660@samba.org>
References: <CGME20210126023109epcas1p257c4128a9d8673cb44f81dca636da39a@epcas1p2.samsung.com>
 <20210126022335.27311-1-namjae.jeon@samsung.com>
 <09887b1a-3303-9ac6-1d29-c53951be5324@samba.org>
 <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>
 <d776f655-f58d-6541-e30a-f10e5b9f0660@samba.org>
Date: Sat, 13 Feb 2021 23:56:37 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8ngEqRFfeQ9zmR5h4QWhg5=OoG=FM7QcuZiFP5wdn+xw@mail.gmail.com>
Message-ID: <CAKYAXd8ngEqRFfeQ9zmR5h4QWhg5=OoG=FM7QcuZiFP5wdn+xw@mail.gmail.com>
Subject: Re: [Linux-cifsd-devel] [PATCH] cifsd: make xattr format of ksmbd
 compatible with samba's one
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> Hi Namjae,
Hi Metze,
>
> I played with this today and found a few things.
Great. Thanks for your check!
>
>>>> Samba team request that ksmbd should make xattr format of ksmbd
>>>> compatible
>>>> with samba's one. When user replace samba with ksmbd or replace ksmbd
>>>> with samba, The written attribute and ACLs of xattr in file should be
>>>> used
>>>> on both server. This patch work the following ones.
>>>>  1. make xattr prefix compaible.
>>>>     - rename creation.time and file.attribute to DOSATTRIB.
>
> I just noticed that you use xattr_DosInfo3 instead of xattr_DosInfo4,
> Samba uses xattr_DosInfo4, starting from samba-4.11.0, so all supported
> Samba releases write xattr_DosInfo4. All versions from 3.5-4.10 wrote
> xattr_DosInfo3. Versions before 3.5 only stored the hex-string.
>
> So it would be good to read hex-string-only, xattr_DosInfo3 and
> xattr_DosInfo4 and write
> xattr_DosInfo4.
Okay, I will add xattr_DosInfo4 support. but I don't think that ksmbd
support the structure of too old samba version.
>
>>>>     - rename stream. to DosStream.
>
> I noticed that "vfs objects = acl_xattr" is allowed,
>
> "vfs objects = streams_xattr acl_xattr" is not handled at all,
> even acl_xattr isn't detected in that case.
ksmbd supports it under a different name. It would be better to change
it to the name used by samba.
>
>>>>     - rename sd. to NTACL.
>
> There seems to be a problem, when a new file inherits acls from the parent
> directory. There I see a strange owner sid:
Hm... I'll try to reproduce it when I go to office.

Thanks!
>
>                         owner_sid                : *
>                             owner_sid                : S-21-2276714256
> and
>
> WARNING! 20 unread bytes
> [0000] 00 00 00 00 00 00 00 00   00 00 00 00 00 00 00 00   ........
> ........
> [0010] 00 00 00 00
>
> I used this command to analyze this:
>
> getfattr -n security.NTACL WHATSNEW.txt | grep security.NTACL| sed -e
> 's!security.NTACL=0s!!' | ndrdump --base64-input xattr xattr_NTACL struct
> 2>&1 |less
>
> metze
>
>

