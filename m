Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD8304C77
	for <lists+samba-technical@lfdr.de>; Tue, 26 Jan 2021 23:46:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=mi/73ioCh8CviTiczHN0MGUwulWgeNEt5NnqetMNjD0=; b=RHy3Ck8VldwpwGKpT5Nh1jUu3y
	664OTPAOBHINH85GWwSXecYF56muGDR8qqBV/MVcYSxeKbwzNadp0mrq/LIxihV8SB4yFGBjaiSjV
	IaJh2dDtem1QVbJorgkeVU9H1NnsW1m/lO0/lji/zjSFG5mJjb0epCHSip5jgXZ2D1oS29s1jKTph
	5RNA8c9+jwdcuowbM3PiqbOpqNGf5cAYDC+Gj8aSfApvnax6jYJlqui2oY7k5OYM+F/P9oZ7cofxt
	HHf/B5nXslqLvO/16Dx2cEcEJeskH+gQDRH8Qv0NQM19rGkQbX6RWacsZYKKQHrVaNn6ih37YsakJ
	cFQiqhRg==;
Received: from ip6-localhost ([::1]:53034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4X57-007Io7-Gf; Tue, 26 Jan 2021 22:45:05 +0000
Received: from mail.kernel.org ([198.145.29.99]:60062) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1l4X4z-007Inx-Qr
 for samba-technical@lists.samba.org; Tue, 26 Jan 2021 22:45:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3CBE205CA
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 22:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611701080;
 bh=MbRYJ+ulAdgsBWawaUqYnwWoufFS8Ad4w+eH4/CosEo=;
 h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
 b=jfpUOAo/YCnvUajZ8/tcKO7fCxkUWdpBrb+zgz/v7U/9PNG2s77SkYk0INw/jJUuY
 GXIgYW+Za+lP4TiRDMgy6iVF2rX+KtaPJqH2n2Y2KukjBFbrUrGcVRLts/g+DYD9Nu
 QcK4MkcY4H7XVgGAmhtIaHFJqf0sq9EZdm8jpyqdiouPby1NL4zLBSzlqXpLXMhKrN
 gn5O1eI1ARZjAQprR//jfTcO1cAozHgG5s7WkymXP4xig8rbFxYd4wQ57le4iGmUcp
 Qj1PcrkxPdltNF+3ZAjtoJXH8mEmWa364lqghUpgdBcenEgAHZM+0UG+cazb+lN9i/
 VZdgK+S7IhBFA==
Received: by mail-ot1-f49.google.com with SMTP id n42so17916756ota.12
 for <samba-technical@lists.samba.org>; Tue, 26 Jan 2021 14:44:40 -0800 (PST)
X-Gm-Message-State: AOAM530bC/zN7TvPxq8eUu9rvKU34Odw89yKElyyZXdOLnyl6qSBcKP2
 FA4H0N+7DAB6fBOspoImJcE3qGwZFC98zdAgjgo=
X-Google-Smtp-Source: ABdhPJwQmJKwjtdhLUEqrlSIg+7AP93XMN6cREIZgam4h4GMlTCHDFEQr/LjOOQV60HjsoSGBXMSGEmoHcPLa6whBow=
X-Received: by 2002:a05:6830:10da:: with SMTP id
 z26mr5489351oto.120.1611701080122; 
 Tue, 26 Jan 2021 14:44:40 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac9:13e5:0:0:0:0:0 with HTTP; Tue, 26 Jan 2021 14:44:39
 -0800 (PST)
In-Reply-To: <09887b1a-3303-9ac6-1d29-c53951be5324@samba.org>
References: <CGME20210126023109epcas1p257c4128a9d8673cb44f81dca636da39a@epcas1p2.samsung.com>
 <20210126022335.27311-1-namjae.jeon@samsung.com>
 <09887b1a-3303-9ac6-1d29-c53951be5324@samba.org>
Date: Wed, 27 Jan 2021 07:44:39 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>
Message-ID: <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>
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
Cc: Namjae Jeon <namjae.jeon@samsung.com>,
 Samba Technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2021-01-26 23:36 GMT+09:00, Stefan Metzmacher via samba-technical
<samba-technical@lists.samba.org>:
> Hi Namjae,
Hi Metze,
>
>> Samba team request that ksmbd should make xattr format of ksmbd
>> compatible
>> with samba's one. When user replace samba with ksmbd or replace ksmbd
>> with samba, The written attribute and ACLs of xattr in file should be
>> used
>> on both server. This patch work the following ones.
>>  1. make xattr prefix compaible.
>>     - rename creation.time and file.attribute to DOSATTRIB.
>>     - rename stream. to DosStream.
>>     - rename sd. to NTACL.
>>  2. use same dos attribute and ntacl structure compaible with samba.
>>  3. create read/write encoding of ndr functions in ndr.c to store ndr
>>     encoded metadata to xattr.
>
> Thanks a lot!
>
> Do you also have this a git commit in some repository?
Yes, You can check github.com/cifsd-team/cifsd
tree(https://github.com/cifsd-team/cifsd/commit/0dc106786d40457e276f50412ecc67f11422dd1e).
And there is a cifsd-for-next branch in
github.com/smfrench/smb3-kernel for upstream.
I have made a patch for that git tree, but I haven't fully tested it yet...
I'm planning to send a pull request to Steve this week after doing it.
>
> I played with ksmbd a bit in the last days.
Cool.
>
> I can also test this commit and check if the resulting
> data is compatible with samba.
Great!  Let me know your opinion if there is something wrong:)
Thank you so much for your help!
>
> metze
>
>

