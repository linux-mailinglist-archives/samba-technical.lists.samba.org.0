Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D897459
	for <lists+samba-technical@lfdr.de>; Wed, 21 Aug 2019 10:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=SdQK0T5B6rEEDJyv0v3tXPa4XohqqczbAQY7zoODNlk=; b=qEgMcdmmARBKBQ8RsjMygYQWvz
	BXnH8UAYstKsgasNFTTwMkrqGaA9aGda0j9sYQAa/AA1c9ueFybke3slnKjRQQ/a1kf/5MIjYiv4w
	mTnB5Ij4cpmE02v3Z5CgBBzlw512wBeHoSK7IcL5EdkIGv+L0w07+P7xWThUOIZnXQMN4qjv43tgK
	7lzqlk9Z4oy4gmfQ0I8bnfv8XMMKvq8sKHlSa4aacKVqPlcCUew8BLEjmLCRPDPmfnCTUgzGteAlX
	RjsW64HWpSTXOglD5sebyUDqdDn+q3KYyRZhSABIxn4lFskaP2CNEAvxnrFySiedAeHaQ/NttNKUM
	QARe70fQ==;
Received: from localhost ([::1]:52214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i0Ld0-007LdC-DV; Wed, 21 Aug 2019 08:05:58 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:39609) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0Lcw-007Ld5-Ey
 for samba-technical@lists.samba.org; Wed, 21 Aug 2019 08:05:56 +0000
Received: by mail-ot1-x331.google.com with SMTP id b1so1239669otp.6
 for <samba-technical@lists.samba.org>; Wed, 21 Aug 2019 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SdQK0T5B6rEEDJyv0v3tXPa4XohqqczbAQY7zoODNlk=;
 b=pbW4zR4Au+8TLPIoD/iJAW8qv9GelgzRZzkkQe/XYieDBKFRy2/C8gvdfaRXbfYFhc
 cziDBVj8mrUWGsQKDNrLVTgEP1tXyR4saU2AguvVIq20SwJlBYyNsmFcgnHCIg2NXJFB
 dfqNeb64GA49ynHkKYGyrTTQn4EO2ViKTQqosUHtX6YU6DacWW+xjBQDReSQCt5GpNh6
 +m2OKPgig+WoaX89oLJad78/xuM6TTbcDTix1qY3MGkrms+GlF0Y/je8YweHo2tRGh7z
 RrrzRxro4LpQCBSU8UlA56qUAeY/6RBCt2LyeM8RVydGK99jIeUU2y/9eaT+G6pBLHz5
 feeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SdQK0T5B6rEEDJyv0v3tXPa4XohqqczbAQY7zoODNlk=;
 b=jZJdWnWsVRcg6AHdQXvrSh1HOKM1ba5hARSXlde9Exy9ue6UoYmiYr83U379+vwt2j
 RtLYgvoF1DZ/KO5+/8Lc9mjDXL5/lkKH1E7PbO4ab1REOqAhc6BZ4ZPkPwAntHpjTum6
 SHzE9M4LISKIqLoJz0edK0oOPPjofSOrli+2iCG4I/yyPQ84tex/yDJiKuV2xX/9IjXB
 HqlkySKC1jGULLPTGN54Fa+JgvytoNaIBMNTBkOoxnxvJPPjIFA13yCViiZdnhdbLIzp
 my6Lh+mL2gnPg6WdwgEvJGFIONmBECibMaFuzlc+PWmzSGZp3N9HvoUPmAJEvq2y4V4R
 W2Yg==
X-Gm-Message-State: APjAAAVHhmjJ/bF/xSbucWwX+wBjjBjpTbX5Iz85FKokeWMYX8CjeI/3
 hX719aGw9xti3cjDcGTef+wWV1l6Y6DEJskx1P33QeIU
X-Google-Smtp-Source: APXvYqx1r7zFFUcJWCPbjxOFIBsBPIiXYcTPE+z76cnKmxyrHSrYyvSXhAwdD9VCOw/AIQ8T007khiFkMJgcdRhvuE4=
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr21036183otp.232.1566374752290; 
 Wed, 21 Aug 2019 01:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190821175956.32cd4776@martins.ozlabs.org>
In-Reply-To: <20190821175956.32cd4776@martins.ozlabs.org>
Date: Wed, 21 Aug 2019 18:05:41 +1000
Message-ID: <CAJ+X7mTO_GjFRO2zSsuty7vnnHXmuh92LorsQmugOfZ_yoZAmg@mail.gmail.com>
Subject: Re: [PATCH] Fix CTDB flapping tests
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 21, 2019 at 6:01 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> The attached patch set fixes nearly all of the flapping CTDB tests.
>
> A variant passed pipeline:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/77082113
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

