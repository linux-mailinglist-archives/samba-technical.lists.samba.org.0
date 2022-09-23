Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5CC5E8581
	for <lists+samba-technical@lfdr.de>; Sat, 24 Sep 2022 00:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uTjHJc8ChNVLqz+Pfc5ketI657na6+ZAwa/a7AbJ7RQ=; b=yW+qZpfLXK40+EU6NI+tdpagnz
	nHz0L05/iqvXVyqAPTHxXjBqm5hezNXiOqNcpmZjIJy+ngYvDDQgve22jwuiyvFwQObCutB4n0OKz
	mJI8NctbdnjVr/6JFE46CGoRCdCnGTUnqiM/APdvFqH0dsFyLbbEHPoAoNwxOM3Lv2r+8gzK2k1/S
	lfFtQ+UEG2emMeppupysqby5R+BIonYH1zWCQ+Av3+p2p3OCjw0W3EclHIf8P1n12jy7/cBTWpu4k
	wuABJoAJPs+USl64SLJ9eyI7MoXEMKk1aUEp0AfYpNjEZzl1kQj+zIrnb+0Hydz2SAvrZ2YQpxD7s
	n41pGE7A==;
Received: from ip6-localhost ([::1]:19446 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1obqjU-003kLf-C7; Fri, 23 Sep 2022 22:01:16 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39906) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1obqjH-003kLW-H9
 for samba-technical@lists.samba.org; Fri, 23 Sep 2022 22:01:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id z13so3314893ejp.6
 for <samba-technical@lists.samba.org>; Fri, 23 Sep 2022 15:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=LLnmjWlyObkcQFTpfyOVDasT3cNFMKeOoU9Y55uBCK8=;
 b=Jtv/9K9fuy9wSOIJqeX0alCYUkxsKKrAk9Yu61ZkI7R8JFzII5BpzbfPiN9q5svx6U
 xzY1OW7zg5pYwMG2l4VxbAHc8ew9epqzIh/eXYtIoTww8LrU8qxE2IJPGoEvAP7m8uBm
 gvnPRed8KNmcKZzmWqAaBetU322/KPm8aADpRnSC4ef+5lJamExrolQfCXMiPXYsjl+T
 kMfp+rdJoJKVsXZ5wkG75PLQl3G1AcfhB6lfQ5npOLOoCE0ka3c+CQTZl50FdL3OnP76
 83cMlhI2+IufuQQoX+2l3ZBljqAbAVJmjBV769es8jbfs63kNTmOB1qgHf19RSyKxk9o
 MhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LLnmjWlyObkcQFTpfyOVDasT3cNFMKeOoU9Y55uBCK8=;
 b=LoF5GS+VqW0GTDdKkwKbC6+r42jEAiLuWkrccNHk1sXAGkiYzExWpDiyr9lpvGmHIo
 DXjAmg27rHbT/CJKcd/6n/nzoQ6cSasMH1kMKWeU8tVStAYPinlmTbn1kyINQzbV+Htn
 Gzc2cvhYltS1thid9Q5kxqPvLBS4/N1LOzoQHSb70uRz6pAFUtfvV+bybLBPR63PSpLw
 zdm02l75M0jR4MLPG8hXhpsk/yP4uaOGZjfbswv3Xg8JYc6396N3JBTDKIZ6R/xGykoK
 RQo7ieAt+KClzB8bOmJGkAyidEYR5khzhVQISosYpuwTKwNVlyrfsV9RcSxTmO1ka0hW
 NGXQ==
X-Gm-Message-State: ACrzQf1/tKCn+L4m4hPpfeWQJeb+LvUVAzp18Nc57R0Gu1xHiTen/y2z
 CKO6U05BQlaCke5+Om0JszZjhNAF7R6lFUNuWlw=
X-Google-Smtp-Source: AMsMyM6+7jgl/ngo1r0xKPg4Y1RuTgzSfdp6MO7O1Rj9bgmpUSRy0EQxOtyadjl6el3B+Hm+8SKHGP4vaM0v0auzF0g=
X-Received: by 2002:a17:907:272a:b0:77c:d7df:c9da with SMTP id
 d10-20020a170907272a00b0077cd7dfc9damr9202640ejl.332.1663970462364; Fri, 23
 Sep 2022 15:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
 <YyTdlsd2ExgX8U9r@jeremy-acer> <YyToAYaXsfopiTdh@jeremy-acer>
 <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
 <YyqQ9HtsTM2lmkQF@jeremy-acer> <Yys3/WVPd/gjBbEi@jeremy-acer>
In-Reply-To: <Yys3/WVPd/gjBbEi@jeremy-acer>
Date: Fri, 23 Sep 2022 18:00:50 -0400
Message-ID: <CAPw4iV4AH7e4odCQ=xjzG-bAcr=5mGVPFA8qf18WBz8wun_SLQ@mail.gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: "Nathaniel W. Turner via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 21, 2022 at 12:12 PM Jeremy Allison <jra@samba.org> wrote:

> On Tue, Sep 20, 2022 at 09:20:04PM -0700, Jeremy Allison via
> samba-technical wrote:
> >Change the API for dsgetdcname() so the caller
> >can specify if they want IPv6 or IPv4. Don't
> >return more than one address - we don't want
> >to double the lookup time for a down-DC.
>
> Probably should be a 'bool ip_v6_only' parameter.
> Only set it if the client has only IPv6 addresses
> available.
>

Thank you very much for the pointers. I explored this approach a bit and
got as far as hacking together
https://gitlab.com/nathanielwyliet/samba/-/commit/efcfe8f0380c44abd52082073b7c473c153caae3

However, I quickly realized that doesn't really work for all the use cases
I care about, as it puts a burden on the callers to set up smb.conf just
right. Pushing the complexity up the call stack doesn't feel like a great
solution, especially when most parts of samba already handle this scenario
correctly without special configuration.

My second attempt at hacking something together is at
https://gitlab.com/nathanielwyliet/samba/-/merge_requests/1

n
